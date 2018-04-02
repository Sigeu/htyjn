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

namespace app\admin\model;

use think\Model;

class HallFamousType extends Model
{

    /**
     * 获取名人馆类型列表
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($field = '*', $except = false)
    {
        $data = self::order('sort asc, id asc')->where('status', 1)->field($field, $except)->select();

        return $data;
    }

    /**
     * 根据ID获取详情
     * @param $id
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataById($id)
    {
        return self::find($id);
    }

}
