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

namespace service;

/**
 * 功能:		HTTP接口 发送短信
 * 修改日期:	2011-03-04
 * 说明:		http://api.sms.cn/mt/?uid=用户账号&pwd=MD5位32密码&mobile=号码&mobileids=号码编号&content=内容
 * 状态:
 * 100 发送成功
 * 101 验证失败
 * 102 短信不足
 * 103 操作失败
 * 104 非法字符
 * 105 内容过多
 * 106 号码过多
 * 107 频率过快
 * 108 号码内容空
 * 109 账号冻结
 * 110 禁止频繁单条发送
 * 112 号码不正确
 * 120 系统升级
 * 
 * Class SmsService
 * @package service
 * @author andy <290648237@qq.com>
 * @date 2017/05/09
 */
class SmsService {
    public $http;		//短信接口
    public $uid ;		//用户账号
    public $pwd;		//密码
    public $mobile;		//号码，以英文逗号隔开
    public $mobileids	 = '';	//号码唯一编号
    public $content;			//内容
    public $time;
    public $mid;
    public $ret;
    public function __construct($mobile, $content, $mobileids,$time='',$mid='',$config) {
        $this->uid = sysconf('sms_uid');
        $this->pwd = sysconf('sms_pwd');
        $this->http = 'http://api.sms.cn/sms/?ac=send';
        $this->mobile = $mobile;
        $this->content = $content.sysconf('sms_qm');
        $this->mobileids = $mobileids;
        $this->time = $time;
        $this->mid = $mid;
        $this->sendSMS();

    }
    function sendSMS(){
        $data = array
        (
            'uid'=>$this->uid,					//用户账号
            'pwd'=>md5($this->pwd.$this->uid),			//MD5位32密码,密码和用户名拼接字符
            'mobile'=>$this->mobile,				//号码
            'content'=>$this->content,			//内容
            'mobileids'=>$this->mobileids,
        );
        $re= $this->postSMS($this->http,$data);			//POST方式提交
        $this->ret = $re;
        return $re;
    }

    function postSMS($url,$data='')
    {
        $port="";
        $post="";
        $row = parse_url($url);
        $host = $row['host'];
        $port = $row['port'] ? $row['port']:80;
        $file = $row['path'];
        while (list($k,$v) = each($data))
        {
            $post .= rawurlencode($k)."=".rawurlencode($v)."&";	//转URL标准码
        }
        $post = substr( $post , 0 , -1 );
        $len = strlen($post);
        $fp = @fsockopen( $host ,$port, $errno, $errstr, 10);
        if (!$fp) {
            return "$errstr ($errno)\n";
        } else {
            $receive = '';
            $out = "POST $file HTTP/1.1\r\n";
            $out .= "Host: $host\r\n";
            $out .= "Content-type: application/x-www-form-urlencoded\r\n";
            $out .= "Connection: Close\r\n";
            $out .= "Content-Length: $len\r\n\r\n";
            $out .= $post;
            fwrite($fp, $out);
            while (!feof($fp)) {
                $receive .= fgets($fp, 128);
            }
            fclose($fp);
            $receive = explode("\r\n\r\n",$receive);
            unset($receive[0]);
            return implode("",$receive);
        }
    }
}
