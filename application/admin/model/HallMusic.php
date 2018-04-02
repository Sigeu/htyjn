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

class HallMusic extends Model
{
    /**
     * 获取音乐列表
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($type, $field = '*', $except = false)
    {
        $map = [
            'music_status' => 1,
            'music_type' => $type
        ];
        $data = self::where($map)->field($field, $except)->select();

        return $data;
    }

    public static function getDataByPid()
    {
        //1=推荐乐曲2=佛教音乐3=西方宗教
        $data = [
            0 => [
                'id' => 0,
                'name' => '推荐乐曲',
                'music_list' => self::getDatas(0)
            ],
            1 => [
                'id' => 1,
                'name' => '佛教音乐',
                'music_list' => self::getDatas(1)
            ],
            2 => [
                'id' => 2,
                'name' => '西方宗教',
                'music_list' => self::getDatas(2)
            ]
        ];

        return $data;
    }

    /**
     * 根据音乐ID获取详情
     * @param $id
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataById($id)
    {
        return self::find($id);
    }

    public static function getNameById($id)
    {
        return self::where('id', $id)->value('music_name');
    }
}
