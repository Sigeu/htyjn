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

namespace app\lib\exception;

use axios\tpr\service\EnvService;
use Exception;
use think\Env;
use think\exception\Handle;
use think\Response;

/**
 * 接管系统异常处理类
 * Class ExceptionHandler
 * @package app\lib\exception
 * @author andy <290648237@qq.com>
 * @date 2017/6/14
 */
class ExceptionHandler extends Handle
{
    private $code;
    private $msg;
    private $errorCode;

    public function render(Exception $e)
    {

        if($e instanceof BaseException) {
            // 如果是自定义的异常
            $this->code = $e->code;
            $this->msg = $e->msg;
            $this->errorCode = $e->errorCode;
        }else {
            //TODO::开发者对异常的操作
            if(Env::get('global.status',false)) {
                // 如果Env 中global.status配置true（调试模式）时，调用系统异常
                return parent::render($e);
            }else {
                //否则，调用自定义异常
                $this->code = 500;
                $this->msg = '服务器内部错误';
                $this->errorCode = '999';
            }
        }

        $req = [
            'code' => $this->errorCode,
            'data' => null,
            'message' => $this->msg
        ];

        $return_type = Env::get('api.return_type','json');
        if(empty($return_type)){
            $return_type = "json";
        }

        Response::create($req,$return_type,"500")->send();
        die();
    }
}