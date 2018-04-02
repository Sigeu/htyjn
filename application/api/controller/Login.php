<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: andy <290648237@qq.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use app\api\model\MemberModel;
use app\api\service\LoginService;
use app\api\service\UserService;
use app\api\validate\BaseValidate;
use axios\tpr\core\Api;
use axios\tpr\service\RedisService;

/**
 * 登录API
 * Class Login
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/16
 */
class Login extends Api {

    /**
     * andy-登陆接口
     * @desc 验证用户名密码
     * @method POST
     * @parameter string username 用户名（必须）
     * @parameter string password 密码（可选）
     * @parameter string verify 手机验证码（可选）
     *
     * @response string code 状态码（默认"200"）
     * @response array data data数组
     * @response string data.member_name 用户名
     * @response string data.member_truename 真实姓名
     * @response string data.member_nickname 昵称
     * @response string data.member_token 令牌
     * @response string message 消息内容
     */
    public function index(){

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['username', 'password']);

        $params = $this->param;

        $username = $params['username'];
        $password = $params['password'];
        $verify   = isset($params['verify']) ? $params['verify'] : '';


        $mobile = $username;
        if (check_is_mobile($username)) {
            // 手机号登录
            $mobile = $username;
            $user = MemberModel::self()->where('member_mobile', $mobile)->find();
        }else {
            // 用户名登录
            $user = MemberModel::self()->findUser(0,$username);
        }

        if(empty($user)){
            $this->wrong(404100);
        }

        if(!$password && !$verify) {
            //如果密码、验证码都没有
            $this->wrong(400100, '密码和验证码必选一个');
        }

        if(isset($password) && !empty($password)){
            if($user['member_passwd']!=make_password($password,$user['member_uniq'])){
                $this->wrong(400100);
            }
        }

        /***针对短信通知验证码的验证***/
        if(isset($verify) && !empty($verify)){
            $check = UserService::checkVerifyCode($username,$verify);  // 验证码检查
            if($check){
                $this->wrong($check);
            }
        }

        $result = LoginService::login($user);


        if(is_int($result)){
            $this->wrong($result);
        }else{
            // 获取用户信息
//            $user = MemberModel::self()->where('member_name', $username)->find();
            if(!empty($result['member_sex'])) {
                $result['member_sex'] = 3;
            }
            if (!empty($result['member_avatar'])){
                $result['member_avatar'] = get_url_with_domain($result['member_avatar']);
            }
            unset($result['member_uniq'], $result['member_passwd']);
//            $result = $user;

            // 是否签到
            $isSigned = 0;
            $punch = RedisService::redis()->switchDB(0)->get('sign_'.$result['member_id']);
            if ($punch == $result['member_id']) {
                $isSigned = 1;
            }
            $result['is_signed'] = $isSigned;
        }

        $this->response($result, 200, '登录成功！');
    }
}