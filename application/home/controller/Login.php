<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: ding <dingzhangze@qq.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use app\api\controller\Easemob;
use app\api\controller\Send;
use app\api\service\LoginService;
use app\common\controller\HomeBase;
use app\home\validate\BaseValidate;
use app\api\service\UserService;
use think\Request;
use app\api\model\MemberModel;
use think\Db;

/**
 * 登录,注册控制器
 * Class Login
 * @package app\home\controller
 * @author ding <dingzhangze@qq.com>
 * @date 2017/7/11
 */
class Login extends HomeBase {

    /**
     * 控制器基础方法
     */
    public function _initialize() {
        if (session('m_user') && $this->request->action() !== 'out') {
            $this->redirect('@home');
        }
    }
    /**
     * 登录
     * @return mixed
     */
    public function login()
    {

        if(request()->isPost()){
            // 验证码
            $postParams = ajax_url_params_to_array($this->request->param('params'));
            $verifyCode = $postParams['verify'];
            if( !captcha_check($verifyCode) ) {
                $this->error('验证码不正确');
            }
            $member=new MemberModel();
            $username = $postParams['username'];
            $password = $postParams['password'];
            (empty($username) || strlen($username) < 4) && $this->error('登录账号长度不能少于4位有效字符!');
            (empty($password) || strlen($password) < 4) && $this->error('登录密码长度不能少于4位有效字符!');

            if (check_is_mobile($username)) {
                // 手机号登录
                $mobile = $username;
                $user = MemberModel::self()->where('member_mobile', $mobile)->find();
            }else {
                // 用户名登录
                $user = MemberModel::self()->findUser(0,$username);
            }

            empty($user) && $this->error('登录账号不存在，请重新输入!');
            ($user['member_passwd'] !== make_password($password,$user['member_uniq'])) && $this->error('登录密码与账号不匹配，请重新输入!');
            $member->where('member_id', $user['member_id'])->update(['member_login_time' => time(), 'member_login_num' => ['exp', 'member_login_num+1']]);

            // TODO 登录成功 执行api登录 保存token供接口调用
            $result = LoginService::login($user);
            $resUser = $member->findUser($user['member_id']);

            $resUser['member_token'] = $result['member_token'];
//            session('m_user', $user);



            // 设置redis缓存登录信息
            $logoutHash = sha1('yjn100'.rand(0,9999));
            $userAuthSign = data_auth_sign($resUser);
            $userAuth = $resUser;
            $loginIp = get_client_ip();
            $setLoginRes = $this->setLogin($logoutHash, $userAuthSign, $userAuth, $loginIp);

            if (!empty($setLoginRes['user'])) {
                //设置Session
                $this->setSession($logoutHash, $userAuthSign, $userAuth, $loginIp);

                //设置Cookie
                $this->setCookie($userAuthSign, $userAuth);



                $this->success('登录成功', $this->request->param('callback'));
            }else {
                $this->error('登录失败，请重新登录', 'home/Login/login');
            }

        }else{

//            dump(vbao_session('user_auth'));die;
//            dump(session('user_auth'), null, null);die;
//            dump($_SESSION['user_auth']);die;
            $callback=$this->request->param('callback','http://www.yjn100.com');
            $this->assign('callback', $callback);
            return $this->fetch('');
        }

    }

//    public function setSession($logoutHash, $userAuthSign, $userAuth, $loginIp){
//
//        session('logout_hash', $logoutHash);
//        session('member_login_ip', $loginIp);
//        session('user_auth', $userAuth);
//
//        session('user_auth_sign', $userAuthSign);
//    }
//
//    public function setCookie($userAuthSign, $userAuth){
//
//        cookie('user_auth', $userAuth, 60*60*24*7);
//        cookie('user_auth_sign', $userAuthSign, 60*60*24*7);
//    }

    /**
     * 设置登录Redis缓存
     * @param $logoutHash
     * @param $userAuthSign
     * @param $userAuth
     * @param $loginIp
     * @return array
     */
    public function setLogin($logoutHash, $userAuthSign, $userAuth, $loginIp){
        $login = [];

        $loginUrl = 'http://www.yjn100.com/home/login/login.html';
        $registerUrl = 'http://www.yjn100.com/home/login/register.html';

        $params = [
            'site'=>'bz',
            'callback'=>urlencode(get_url())
        ];
        $login['login_url'] = set_url($loginUrl,$params);
        $login['register_url'] = set_url($registerUrl,$params);
        $logoutUrl = 'http://www.yjn100.com/home/login/out.html';

        vbao_session('logout_hash', $logoutHash); // 退出登录hash
        vbao_session('user_auth_sign', $userAuthSign); // 登录验证签名
        vbao_session('member_login_ip', $loginIp); // 登录验证ip

        $params = [
            'site'=>'bz',
            'callback'=>urlencode(get_url()),
            'logout_hash' => $logoutHash
        ];
        $login['logout_url'] = set_url($logoutUrl, $params);
        $login['user'] = vbao_session('user_auth', $userAuth);

        return $login;
    }

//    public function setLogin(){
//        $uid = is_login();
//        $login = [];
//
//        $loginUrl = 'http://www.yjn100.com/home/login/login.html';
//        $registerUrl = 'http://www.yjn100.com/home/login/register.html';
//
//        $params = [
//            'site'=>'bz',
//            'callback'=>urlencode(get_url())
//        ];
//        $login['login_url'] = set_url($loginUrl,$params);
//        $login['register_url'] = set_url($registerUrl,$params);
//        if($uid){
//            $logoutUrl = 'http://www.yjn100.com/home/login/out.html';
//
//            vbao_session('logout_hash', session('logout_hash')); // 退出登录hash
//            vbao_session('user_auth_sign', session('user_auth_sign')); // 登录验证签名
//            vbao_session('member_login_ip', get_client_ip()); // 登录验证签名
//
//            $params = [
//                'site'=>'bz',
//                'callback'=>urlencode(get_url()),
//                'logout_hash' => session('logout_hash')
//            ];
//            $login['logout_url'] = set_url($logoutUrl, $params);
//            $login['user'] = vbao_session('user_auth', session('user_auth'));
//        }
//
//        return true;
//    }



    /**
     * 注册
     * @return mixed
     */
    public function register()
    {

        if(request()->isPost()){
            $data = ajax_url_params_to_array($this->request->param('params'));
//            $data=input('post.');
            $result=[
                'phone'=>$data['phone'] ,
                'password'=>$data['password'],
                'verify'=>$data['verify'],
                'mobile_code'=>$data['mobile_code']
            ];
            // 验证参数
            $validate = new BaseValidate();
            if (!$validate->check($result)) {
             $this->error($validate->getError());
            }
            if ($data['password'] !== $data['repassword']) {
                $this->error('两次输入的密码不一致！');
            }
//            /***针对短信通知验证码的验证 测试环境隐藏 上线后打开注释***/
//        $check = UserService::checkVerifyCode($data['mobile_code']);  // 验证码检查
//        if($check){
//            $this->wrong($check);
//        }
            $member=new MemberModel();
            $num = substr($data['phone'],-4);
            $username = MemberModel::self()->getMemberName('yun', $num);

            $user_uniq = uniqid($username);
            $password  = make_password($data['password'],$user_uniq);
            // 验证码
            $verifyCode = $data['verify'];
            if( !captcha_check($verifyCode) ) {
                $this->error('验证码不正确');
            }
            if (!isset($data['protocol'])) {
                $this->error('请同意用户协议');
            }
            $user = $member->where('member_mobile', $data['phone'])->find();
            if($user){
                $this->error('账号已存在，请重新输入!');
            }
            $uMap=[
                'member_uniq' => $user_uniq,
                'member_name' => $username,
                'member_mobile'=>$data['phone'],
                'member_passwd'=>$password,
                'member_time'=>time()
            ];

            $res=$member->addUser($uMap);

            if ($res) {
                // 用户注册成功 将其注册到环信用户
                $easemod = new Easemob();
                $easemod->emchatRegisterUser($username);


                // TODO 登录成功 执行api登录 保存token供接口调用
                $user = MemberModel::self()->findUser($res);
                $result = LoginService::login($user);
                $resUser = $member->findUser($user['member_id']);

                $resUser['member_token'] = $result['member_token'];
//            session('m_user', $user);



                // 设置redis缓存登录信息
                $logoutHash = sha1('yjn100'.rand(0,9999));
                $userAuthSign = data_auth_sign($resUser);
                $userAuth = $resUser;
                $loginIp = get_client_ip();
                $setLoginRes = $this->setLogin($logoutHash, $userAuthSign, $userAuth, $loginIp);

                if (!empty($setLoginRes['user'])) {
                    //设置Session
                    $this->setSession($logoutHash, $userAuthSign, $userAuth, $loginIp);

                    //设置Cookie
                    $this->setCookie($userAuthSign, $userAuth);


                    $this->success('注册成功', $this->request->param('callback'));
                }else {
                    $this->error('登录失败，请重新登录', 'home/Login/login');
                }
            }else {
                $this->error('注册失败，请稍候再试！');
            }


//            $res !== false ? $this->success('注册成功！', url('/home/login/login')) : $this->error('注册失败，请稍候再试！');
        }else{

            $callback=$this->request->param('callback','http://www.yjn100.com');
            $this->assign('callback', $callback);

            return $this->fetch('');
        }

    }

    /**
     * 验证码
     */
    public function verify_code()
    {
        $array = array(
            'imageW' => 100,
            'imageH' => 40,
            'length' => 4,
            'fontSize'=>14,
            'useNoise' => false,
            'useCurve' => false,
        );

        return captcha("", $array);
    }

    /**
     * 短信验证码
     */
    public function mobile_code()
    {
        if(request()->isPost()){
            $send=new Send();
            $send->sms([
                'mobile'  => input('post.'),
            ]);
        }
    }

    /**
     * 退出登录
     */
    public function out() {

        $res = vbao_session('logout', $this->request->param('logout_hash'));
        if (!$res) {
            $this->error('退出登录失败！');
        }

        $callback=$this->request->param('callback','http://www.yjn100.com/');

        $this->success('退出登录成功！', $callback);
    }
}