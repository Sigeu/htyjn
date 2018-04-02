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

namespace app\api\model;

use think\Model;

/**
 * 意见反馈模型
 * Class Feedback
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/8/3
 */
class Feedback extends Model
{

    /**
     * 创建反馈信息
     * @param $data
     * @return int|string
     */
    public static function createData($data)
    {
        $res = self::insertGetId($data);

        return $res;
    }
}
