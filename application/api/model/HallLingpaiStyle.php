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

class HallLingpaiStyle extends Model
{

    /**
     * 获取灵牌列表
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas()
    {
        $data = self::order('style_num desc, sort asc, id asc')->select();
        if ($data) {
            foreach ($data as $item) {
                $item['app_thumb_img'] = get_url_with_domain($item['style_img']);
                $item['style_img'] = get_url_with_domain($item['style_big_img']);
                unset($item['style_big_img']);
            }
        }

        return $data;
    }

    public static function getDataById($id)
    {
        return self::field('sort, status, create_at', true)->find($id);
    }

}
