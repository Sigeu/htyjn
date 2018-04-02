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

class HallLevel extends Model
{

    /**
     * 根据纪念馆祭拜值获取该纪念馆等级
     * @param int $exp 纪念馆祭拜值
     * @return mixed
     */
    public static function getHallLevelByExp($exp = 0)
    {
        $map = [
            'exp' => ['elt', $exp],
            'max_exp' => ['egt', $exp]
        ];
        $hallLevel = self::where($map)->value('level');

        return $hallLevel;
    }
}
