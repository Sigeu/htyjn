<?php
// +----------------------------------------------------------------------
// | TPR [ Design For Api Develop ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://hanxv.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: axios <axioscros@aliyun.com>
// +----------------------------------------------------------------------

namespace axios\tpr\core;

use axios\tpr\service\EnvService;
use axios\tpr\service\ForkService;
use axios\tpr\service\LangService;
use think\Response;

final class Result{
    public static $instance;

    public static $return_type;

    public static $toString = true;

    public function __construct($return_type,$toString=true)
    {
        // TODO: Implement __call() method.
        if(empty($return_type)){
            self::initReturnType();
        }else{
            self::$return_type = $return_type;
        }
        self::$toString = $toString;
    }

    public static function instance($return_type = "",$toString=true){
        if (is_null(self::$instance)) {
            self::$instance = new static($return_type,$toString);
        }

        return self::$instance;
    }

    public static function wrong($code,$message=''){
        return self::rep([],$code,$message);
    }

    public static function rep($data=[],$code=200,$message='',array $header=[]){
        if(self::$toString){
            if(is_object($data)){
                $data = object_to_array($data);
            }
            if(is_array($data)){
                $data = check_data_to_string($data);
            }
        }
        $req['code'] = strval($code);
        $req['data'] = $data;
        $req['message'] = !empty($message)?LangService::trans($message):LangService::message($code);
        self::send($req,$header);
        return $req;
    }

    public static function send($req,$header=[]){
        if(empty(self::$return_type)){
            self::initReturnType();
        }
        Response::create($req,  self::$return_type, "200")->header($header)->send();
        if(function_exists('fastcgi_finish_request')){
            fastcgi_finish_request();
        }
        $queue = ForkService::$queue;
        // todo 报错，有bug 后面再调试 应该是php版本问题
//        ForkService::fork(true);
//        ForkService::doFork($queue);
    }

    private static function initReturnType(){
        $return_type = EnvService::get('api.return_type','json');
        self::$return_type = $return_type;
    }
}