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

use think\Exception;

/**
 * 异常处理基类
 * Class BaseException
 * @package app\lib\exception
 * @author andy <290648237@qq.com>
 * @date 2017/6/14
 */
class BaseException extends Exception
{
    // HTTP 状态码 404 200
    public $code;

    // 错误具体信息
    public $msg; // TODO 最好定义成英文

    // 自定义的错误码
    public $errorCode;

    /**
     * 异常处理基类构造函数
     * BaseException constructor.
     * @param string $msg
     * @param int $code
     * @param int $errorCode
     */
    public function __construct($msg = '参数错误', $code = 400, $errorCode = 10000)
    {
        $this->msg = $msg;
        $this->code = $code;
        $this->errorCode = $errorCode;
    }
}