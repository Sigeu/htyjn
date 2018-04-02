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

class HallWorshipStyle extends Model
{
    public static function getDataByCid($cid = 0)
    {
        return self::where('category_id', $cid)->order('style_num desc, sort asc, id asc')->select();
    }

    /**
     * 根据风格类型获取风格列表
     * @param int $styleCid 纪念馆风格分类ID
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($styleCid)
    {
        $data = self::getDataByCid($styleCid);

        foreach ($data as $item) {
            $item['hall_type'] = HallStyleCategory::getStyleCategoryPidById($item['category_id']);
            $item['app_thumb_img'] = get_url_with_domain($item['style_img']);
            $item['style_img'] = get_url_with_domain($item['style_big_img']);
            unset($item['style_big_img']);
        }

        return $data;
    }
}
