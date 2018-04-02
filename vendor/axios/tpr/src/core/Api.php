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

use think\Controller;
use think\Request;

class Api extends Controller{
    protected $param;

    protected $return_type;

    protected $toString = false;

    function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->param = $this->request->param();
    }

    protected function wrong($code,$message=''){
        $this->rep(null,$code,$message);
    }

    /**
     * @param null $data
     * @param int $code
     * @param string $message
     * @param array $header todo 设置默认所有域名可访问，上线后要更改成限制域名访问
     */
    protected function rep($data=null,$code=200,$message='',array $header=['Access-Control-Allow-Origin' => '*']){
        $req = Result::instance($this->return_type,$this->toString)->rep($data,$code,$message,$header);
        $this->request->req = $req;
        Cache::set($req,$this->request);
        die; // todo
    }

    /**
     * 回调的每个数据全部转为string类型
     * @param array $data
     * @param int $code
     * @param string $message
     * @param array $header
     * @return array|null|string
     */
    protected function response($data=null,$code=200,$message='',array $header=['Access-Control-Allow-Origin' => '*']){

        /* 请求头 */
        header('content-type:application:json;charset=utf8');
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:POST');
        header('Access-Control-Allow-Headers:x-requested-with,content-type');

        $this->toString = false; // 是否强制转换为字符串
        // 如果返回数据为空数组 则改为 null
        if(!$data) {
            $data = null;
        }
        // 从参数中获取数据返回类型
        $return_type = $this->request->param('return_type');
        if ($return_type == 'html') {
            return $data;
        }
        $this->rep($data,$code,$message,$header);
    }

    /**
     * Todo 空方法是否有bug
     * @return array|null|string
     */
    public function __empty(){
        list($module, $controller, $action, $method) = explode('/', $this->request->path() . '///');
        if (!empty($module) && !empty($controller) && !empty($action) && !empty($method)) {
            $action = ucfirst($action);
            $Api = "app\\{$module}\\{$controller}\\{$action}Api";
            if (method_exists($Api, $method)) {
                return $Api::$method($this);
            }
            $this->wrong(404, '访问的接口不存在！');
        }
        $this->wrong(404, '不符合标准的接口！');
    }
}