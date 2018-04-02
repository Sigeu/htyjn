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
use app\api\validate\BaseValidate;
use axios\tpr\core\Api;
use app\api\service\UserService;
use think\Db;

/**
 * 忘记密码API
 * Class Forgot
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/17
 */
class Forgot extends Api {
    /**
     * andy-忘记密码
     * @desc 用于用户找回密码
     * @method post
     * @parameter string username 用户名（必须）
     * @parameter string password 新密码（必须）
     * @parameter string verify 手机验证码（必须）
     * @response 
     */
    public function index(){

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['username', 'password']);

        $params = $this->param;
        $username = $params['username'];
        $password = $params['password'];
        $verify   = $params['verify'];

        if(!MemberModel::self()->where('member_mobile',$username)->count()){
            $this->wrong(404100);
        }

//        // 检查手机验证码
        $check = UserService::checkVerifyCode($username,$verify);
        if($check){
            $this->wrong($check);
        }

        if($password == ''){
            $this->wrong(0, "新密码不能为空");
        }

        $user_uniq = uniqid($username);
        $password  = make_password($password,$user_uniq);

        $data = [
            'member_uniq'=>$user_uniq,
            'member_passwd'=>$password,
        ];

        $user_id = MemberModel::self()->where('member_mobile', $username)->value('member_id');
        $is_updated = MemberModel::self()->where('member_mobile', $username)->update($data);

        if($is_updated){
            $user = MemberModel::self()->find($user_id);
            $result = LoginService::login($user);
            if(is_int($result)){
                $this->wrong($result);
            }
            $this->response($result, 200, '密码修改成功！');
        }

        $this->wrong(500);
    }
}