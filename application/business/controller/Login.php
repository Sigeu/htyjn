<?php

// +----------------------------------------------------------------------
// | Think.Admin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/Think.Admin
// +----------------------------------------------------------------------

namespace app\business\controller;

use app\business\model\NodeModel;
use app\business\service\LogService;
use app\wechat\controller\BasicWechat;
use think\Db;

/**
 * 系统登录控制器
 * class Login
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/10 13:59
 */
class Login extends BasicWechat {

    /**
     * 微信网页授权
     * @var bool
     */
    protected $check_auth = true;

    /*
     * 控制器基础方法
     */
    public function _initialize() {
        if (session('b_user') && $this->request->action() !== 'out') {
            $this->redirect('@business');
        }
    }

    /**
     * 用户登录
     * @return string
     */
    public function index() {
        if ($this->request->isGet()) {
            $this->assign('title', '用户登录');
            return $this->fetch();
        } else {

            $username = $this->request->post('username', '', 'trim');
            $password = $this->request->post('password', '', 'trim');
            if (is_mobile()){
                (empty($username) || strlen($username) < 11 || !check_is_mobile($username)) && $this->error('请输入正确的手机号!');
            }else{
                (empty($username) || strlen($username) < 4) && $this->error('登录账号长度不能少于4位有效字符!');
            }
            (empty($password) || strlen($password) < 4) && $this->error('登录密码长度不能少于4位有效字符!');

            // 验证码
            $verifyCode = $this->request->post('verify', '', 'trim');
//            if( !captcha_check($verifyCode) ) {
//                $this->error('验证码不正确');
//            }

            if (is_mobile()){
                $user = Db::name('BusinessStaff')->where('phone', $username)->find();
            }else{
                $user = Db::name('BusinessStaff')->where('username', $username)->find();
            }

            empty($user) && $this->error('登录账号不存在，请重新输入!');
            ($user['password'] !== admin_md5($password)) && $this->error('登录密码与账号不匹配，请重新输入!');
//            Db::name('BusinessStaff')->where('id', $user['id'])->update(['login_at' => ['exp', 'now()'], 'login_num' => ['exp', 'login_num+1']]);
            session('b_user', $user);
             !empty($user['authorize']) && NodeModel::applyAuthNode();
            LogService::write('系统管理', '用户登录系统成功');
            // 登录成功 获取微信授权信息
            Db::name('BusinessStaff')->where('phone', $username)->update(['wechat_openid' => session('openid')]);
//            dump(session('openid'));die;
            $this->success('登录成功，正在进入系统...', '@business');
        }
    }

    /**
     * 退出登录
     */
    public function out() {
        LogService::write('系统管理', '用户退出系统成功');
        session('b_user', null);
        session_destroy();
        $this->success('退出登录成功！', '@business/login');
    }

    public function verify_code(){
        if (is_mobile()){
            $array = array(
                'imageW' => 80,
                'imageH' => 39,
                'length' => 4,
                'fontSize'=>12,
                // 是否画混淆曲线
                'useNoise' => false,
                'useCurve' => false,
            );
        }else{
            $array = array(
                'imageW' => 130,
                'imageH' => 38,
                'length' => 4,
                'fontSize'=>16,
                // 是否画混淆曲线
                'useNoise' => false,
                'useCurve' => false,
            );
        }


        return captcha("", $array);
    }

}
