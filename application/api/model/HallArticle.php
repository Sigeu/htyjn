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

use think\Db;
use think\Model;

/**
 * 纪念馆追思文选模型
 * Class HallArticle
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/7/12
 */
class HallArticle extends Model
{

    /**
     * 纪念馆追思文选列表
     * @param int $hallId 纪念馆ID
     * @param int $page 页码
     * @param int $size 数量
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function hallArticle($hallId = 0, $page = 1, $size = 20)
    {

        $map = 'WHERE a.status = 1';
        if ($hallId) {
            $map = 'WHERE h.id = '.$hallId;
        }

        $query = "SELECT a.id,a.hall_id,a.article_title,a.create_at,h.hall_name FROM tp_hall_article AS a
                                   LEFT JOIN tp_hall AS h ON a.hall_id = h.id
                                   ".$map;

        $data['list'] = Db::query($query." ORDER BY a.create_at desc LIMIT ".($page-1) * $size.", $size");
        $total = count(Db::query($query));
        $data['total'] = $total;
        $data['page'] = $page;
        $data['size'] = $size;

        return $data;
    }
    


}
