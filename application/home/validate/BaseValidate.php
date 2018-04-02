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

namespace app\home\validate;


use app\lib\exception\BaseException;
use think\Exception;
use think\Request;
use think\Validate;

/**
 * 验证基类
 * Class BaseValidate
 * @package app\api\validate
 * @author ding <dingzhangze@qq.com>
 * @date 2017/7/12
 */
class BaseValidate extends Validate
{
    protected $rule = [
        'phone' => 'require|length:11',
        'password' => 'require|length:6,16',
        'verify'=>'require',
        'mobile_code'=>'require',
    ];

    protected $message = [
        'phone.require' => '手机号码必须填写',
        'phone.length' => '手机号码必须为11位',
        'password.require' => '密码必须填写',
        'password.length' => '密码长度只能在6-16位之间',
        'verify.require' => '验证码必须填写',
        'mobile_code'=>'手机验证码必须填写',
    ];

}