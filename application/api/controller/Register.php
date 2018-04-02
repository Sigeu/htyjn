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
use think\Db;

/**
 * 会员注册API
 * Class Register
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/17
 */
class Register extends Api {

    /**
     * andy-注册接口
     * @desc 注册用户
     * @method post
     * @parameter string username 用户名（必须）
     * @parameter string password 密码（必须）
     * @parameter string verify 手机验证码（必须）
     * @parameter string nickname 昵称（可选）
     * @response
     */
    public function index(){

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['username', 'password']);

        $params = $this->param;
//        $username = $params['username'];
        $password = $params['password'];
        $verify   = isset($params['verify']) ? $params['verify'] : '';
        $mobile = $params['username'];

        if (!check_is_mobile($mobile)) {
            $this->wrong(0, '手机号码格式错误');
        }

        if(MemberModel::self()->where('member_mobile',$mobile)->count()) {
            $this->wrong(402100,"User name already exists");
        }

        /***针对短信通知验证码的验证 测试环境隐藏 上线后打开注释***/
//        $check = UserService::checkVerifyCode($mobile,$verify);  // 验证码检查
//        if($check){
//            $this->wrong($check);
//        }
        $num = substr($mobile,-4);
        $username = MemberModel::self()->getMemberName('yun', $num);

        $user_uniq = uniqid($username);
        $password  = make_password($password,$user_uniq);

        $data = [
            'member_uniq' => $user_uniq,
            'member_name' => $username,
            'member_passwd' => $password,
            'member_mobile' => $mobile,
            'member_time' => time(),
            'coins' => 1000 // 新注册会员赠送1000纪念币
        ];

        if(isset($this->param['nickname']) && !empty($this->param['nickname'])){
            $data['member_nickname']  = $this->param['nickname'];
        }

//        dump($data);die;
        $user_id = MemberModel::self()->insertGetId($data);
        if($user_id){



            $user = MemberModel::self()->find($user_id);

            // 用户注册成功 将其注册到环信用户
            $easemod = new Easemob();
            $easemod->emchatRegisterUser($username, $user);

            $result = LoginService::login($user);
            if(is_int($result)){
                $this->wrong($result);
            }




            $this->response($result, 200, '注册成功，请登录！');
        }

        $this->wrong(500);

    }


}