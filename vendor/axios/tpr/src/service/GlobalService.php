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

namespace axios\tpr\service;

use axios\tpr\core\Api;

class GlobalService extends Api{

    public static function api(){
        return new self();
    }

    public static function set($name,$value){
        // todo debug serialize 如果常量值为数组，将其serialize
        $value = serialize($value);

        define($name,$value);
    }

    public static function get($name=''){
        if(!defined($name)){
            return false;
        }
        $defined = get_defined_constants(true);

        // todo debug unserialize 如果常量值为数组，unserialize
        $defined = unserialize($defined);

        if(isset($defined['user'][$name])){
            return $defined['user'][$name];
        }
        return "";
    }

    private static function name($name=''){
        return "TPR_".strtoupper($name);
    }

    public function __invoke($name='')
    {
        // TODO: Implement __invoke() method.
        return self::get(self::name($name));
    }
}