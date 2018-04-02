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

class HallFamousType extends Model
{
    //

    /**
     * 获取名人纪念馆类型列表
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas()
    {
        $map['status'] = 1;

        $data = self::where($map)->order('id asc, sort asc')->select();
        return $data;
    }

    /**
     * 根据名人类型ID获取名人类型名称
     * @param $typeId
     * @return mixed
     */
    public static function getTypeNameById($typeId)
    {
        $data = self::where('id', $typeId)->value('name');
        return $data;
    }
}
