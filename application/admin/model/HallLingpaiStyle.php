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

class HallLingpaiStyle extends Model
{

    /**
     * 获取灵牌列表
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($field = '*', $except = false)
    {
        $data = self::order('style_num desc, sort asc, id asc')->where('status', 1)->field($field, $except)->select();

        return $data;
    }

    /**
     * 根据灵牌ID获取详情
     * @param $id
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataById($id)
    {
        return self::find($id);
    }

    public static function getNameById($id)
    {
        return self::where('id', $id)->value('style_name');
    }
}
