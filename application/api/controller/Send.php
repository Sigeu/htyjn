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

use app\api\service\UserService;
use axios\tpr\core\Api;
use service\SmsService;

error_reporting(0);

/**
 * Class Send
 * @package app\api\controller
 */
class Send extends Api {

//    /**
//     * 发送短信验证码接口 阿里大于平台
//     * @parameter string mobile
//     * @method POST
//     */
//    public function send(){
//        $mobile = $this->param['mobile'];
//        $result = $this->sendVerify($mobile, 60*5);
//        if($result->statusCode!="000000"){
//            $this->wrong($result->statusMsg);
//        }
//        return $result;
//    }

    /**
     * andy-发送短信验证码接口
     * @desc 云信使平台
     * @parameter string mobile
     * @method POST
     */
    public function sms()
    {
        $mobile = $this->param['mobile'];
        $time = 60*5;
        $code = mt_rand(100000,999999);
        $code = UserService::logVerifyCode($mobile,$code,$time); // 记录验证码，需要redis数据库

        // 发送短信验证码
        $content = '您本次请求注册的验证码是'.$code.'。请在页面中提交验证码完成验证。';
        $result = new SmsService($mobile, $content, 100006);
//        if($result->stat != '100'){
//            return $this->response(null, $result->stat, $result->message);
//        }
        return $this->response($code, 200, '短信验证码已发送成功，请注意查收！');
    }

//    private function sendVerify($to,$time = 60){
//
//        $code = mt_rand(100000,999999);
//        $code = UserService::logVerifyCode($to,$code,$time); // 记录验证码，需要redis数据库
//
//        $Send = new Sms();
//        $result = $Send->sms([
//            'param'  => ['code'=>strval($code),'product'=>'云纪念'],
//            'mobile'  => $to,//input('post.mobile/s','','trim,strip_tags'),
//            'template'  => 'SMS_68205285 ',
//        ]);
//        if($result !== true){
//            return $this->response(null, 0,$result);
//        }
//
//        return $this->response(null, 200, '发送成功');
//    }

    /**
     * andy-发送邮件
     * @desc PHPMail
     * @parameter string to_email 接受者邮箱地址（必须）
     * @parameter string subject 邮件主题（必须）
     * @parameter string content 邮件内容（必须）
     * @parameter string to_name 接受者名称（可选）
     * @method POST
     */
    public function email()
    {
        $toemail = $this->param['to_email'];
        $toName = $this->param['to_name'];
        $subject = $this->param['subject'];
        $content = $this->param['content'];
        $result = send_mail($toemail, $toName, $subject, $content);
        if($result) {
            $this->response(null, 200, '邮件发送成功');
        }else {
            $this->response(null, 0, $result);
        }
    }
}