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

namespace app\home\model;

use think\Model;

/**
 * 友链模型
 * Class Links
 * @package app\home\model
 * @author andy <290648237@qq.com>
 * @date 2017/6/16
 */
class Links extends Model
{
    /**
     * 根据ID获取详情
     * @param int $id 友链ID
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataByID($id)
    {
        $result = self::find($id);
        return $result;
    }

    /**
     * 获取列表
     * @param int $type
     * @param string $sort
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($type = 0, $sort = 'sort asc')
    {

        $map = [
            'end_time' => ['gt', date(time())],
            'status' => 1,
        ];

        if($type) {
            $map['type'] = $type;
        }

        $result = self::where($map)->order($sort)->select();
        return $result;
    }
}