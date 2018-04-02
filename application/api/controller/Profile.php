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
use app\common\controller\ApiLogin;

/**
 * 会员信息API
 * Class Profile
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/16
 */
class Profile extends ApiLogin {

    /**
     * andy-获取用户信息接口
     * @desc 获取用户基本信息
     * @method post
     * @parameter string token 用户token
     */
    public function index(){
        $user = $this->user;
        if(isset($user['member_token'])){
            unset($user['member_token']);
        }

        $this->response($user);
    }

    /**
     * andy-更新用户信息
     * @desc 更新用户信息
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter string options[0][name] 字段名称（可选如：member_truename,member_avatar,member_sex[int_1男_2女_3保密],member_birthday[date_2017-05-27],member_nickname,etc）
     * @parameter string options[0][value] 字段值（可选）
     * @response
     */
    public function update(){
        $data = [];$user = [];

        $options = $this->param['options'];

        if(isset($options) && !empty($options)){
            foreach ($options as $key=>$option) {
                if($option['name'] != '') {
                    $data[$option['name']] = $option['value'];
                }
            }
        }

        if(!empty($data) && MemberModel::self()->updateUser($data,$this->user['member_id'])){
            $user = LoginService::doLogin($this->user['member_id'],$this->user['member_token']);
            $this->response($user, 200, '保存成功！');
        }
        if(empty($user)){
            $user = $this->user;
            unset($user['member_passwd'], $user['member_uniq']);
//            unset($user['member_id']);
//            unset($user['member_token']);
        }

        $user['member_avatar'] = get_url_with_domain($user['member_avatar']);

        $this->response($user, 200, '保存成功！');
    }

    /**
     * andy-修改密码
     * @desc 修改密码
     * @method post
     * @parameter string token 用户token
     * @parameter string old_password 旧密码（必须）
     * @parameter string new_password 新密码（必须）
     */
    public function modifyPassword(){
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['old_password', 'new_password']);

        $oldPassword = $this->param['old_password'];
        $newPassword = $this->param['new_password'];
        $memberId = $this->user['member_id'];

        if ($oldPassword == '') {
            $this->wrong(0, '旧密码不能为空');
        }
        if ($newPassword == '') {
            $this->wrong(0, '新密码不能为空');
        }

        $memberInfo = MemberModel::self()->findUser($memberId);

        if(!$memberInfo){
            $this->wrong(0,'用户不存在');
        }

        // 判断旧密码是否正确
        if ($memberInfo['member_passwd'] != make_password($oldPassword, $memberInfo['member_uniq'])) {
            $this->wrong(0, '旧密码不正确');
        }

        if ($oldPassword == $newPassword) {
            $this->wrong(0, '新密码不能与旧密码相同');
        }

        // 验证通过 执行更新密码操作
        $newPasswordStr = make_password($newPassword, $memberInfo['member_uniq']);
        $saveData = [
            'member_passwd' => $newPasswordStr
        ];
        $res = MemberModel::self()->updateUser($saveData, $memberId);

        if (!$res) {
            $this->wrong(0, '修改密码失败');
        }

        $this->response($res, 200, '修改密码成功');

    }


}