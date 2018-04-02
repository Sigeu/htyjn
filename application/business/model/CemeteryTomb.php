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

namespace app\business\model;

use think\Model;

/**
 * 单页模型
 * Class Page
 * @package app\home\model
 * @author andy <290648237@qq.com>
 * @date 2017/6/25
 */
class CemeteryTomb extends Model
{

    public static function getList($map, $size)
    {
        $data = self::where($map)->paginate($size);
        return $data;
    }
}
