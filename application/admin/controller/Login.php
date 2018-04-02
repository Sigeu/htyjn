<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yn123 <www.yn123.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\NodeModel;
use app\admin\service\LogService;
use think\Db;

/**
 * 系统登录控制器
 * class Login
 * @package app\admin\controller
 * @author yn123 <www.yn123.com>
 * @date 2017/02/10 13:59
 */
class Login extends BasicAdmin {

    /**
     * 控制器基础方法
     */
    public function _initialize() {
        if (session('user') && $this->request->action() !== 'out') {
            $this->redirect('@admin');
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
            // 验证码 TODO 网站上线后取消注释
            $verifyCode = $this->request->post('verify', '', 'trim');
            if( !captcha_check($verifyCode) ) {
                $this->error('验证码不正确');
            }

            $username = $this->request->post('username', '', 'trim');
            $password = $this->request->post('password', '', 'trim');
            (empty($username) || strlen($username) < 4) && $this->error('登录账号长度不能少于4位有效字符!');
            (empty($password) || strlen($password) < 4) && $this->error('登录密码长度不能少于4位有效字符!');
            $user = Db::name('SystemUser')->where('username', $username)->find();
            empty($user) && $this->error('登录账号不存在，请重新输入!');
            ($user['password'] !== admin_md5($password)) && $this->error('登录密码与账号不匹配，请重新输入!');
//            Db::name('SystemUser')->where('id', $user['id'])->update(['login_at' => ['exp', 'now()'], 'login_num' => ['exp', 'login_num+1']]);
            session('user', $user);
            !empty($user['authorize']) && NodeModel::applyAuthNode();
            LogService::write('系统管理', '用户登录系统成功');
            $this->success('登录成功，正在进入系统...', '@admin');
        }
    }

    /**
     * 退出登录
     */
    public function out() {
        LogService::write('系统管理', '用户退出系统成功');
        session('user', null);
        session_destroy();
        $this->success('退出登录成功！', '@admin/login');
    }

    public function verify_code(){
        $array = array(
            'imageW' => 130,
            'imageH' => 38,
            'length' => 4,
            'fontSize'=>16,
            'useNoise' => false,
            'useCurve' => false,
        );

        return captcha("", $array);
    }

}
