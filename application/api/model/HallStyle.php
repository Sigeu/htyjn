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

class HallStyle extends Model
{

    /**
     * 根据分类ID获取纪念馆风格列表
     * @param int $cid 纪念馆风格分类ID
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDataByCid($cid = 0)
    {
        return self::where('category_id', $cid)->order('style_num desc, sort asc, id asc')->select();
    }

    /**
     * 根据风格类型获取风格列表
     * @param int $styleCategoryId 纪念馆风格分类ID
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($styleCategoryId)
    {

        $data = self::getDataByCid($styleCategoryId);

        foreach ($data as $item) {
            $item['hall_type'] = HallStyleCategory::getStyleCategoryPidById($item['category_id']);

            // TODO 暂未找到纪念馆详情风格图片 用缩略图替代
//            $item['style_img'] = get_root_url().$item['style_img'];
            $skinDirPath = get_root_url().'/static/home/hall_skins/'.$item['skin_hall_type'].'/'.$item['skin_type'].'/'.$item['skin_dir'].'/';

            $item['style_img'] = $skinDirPath.'guan_bg.jpg';

            if ($item['hall_type'] > 1) {
                // 多人馆
                $item['style_img'] = $skinDirPath.'yuan_bg_6.jpg';
            }

            if ($item['hall_type'] == 3) {
                // 家族馆
                $item['yuan_title_img'] = $skinDirPath.'yuan_title.jpg';
                $item['yuan_txt_img'] = $skinDirPath.'yuan_txt.jpg';
            }

            $item['app_thumb_img'] = $skinDirPath.'jpg.jpg';
            $item['pc_thumb_img'] = $skinDirPath.'big.jpg';
        }

        return $data;
    }

}
