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

class MallWorship extends Model
{
    /**
     * 纪念馆大厅祭拜记录列表
     * @param int $hallId 纪念馆ID
     * @param int $isFamous 是否查询名人馆
     * @param int $page 页码
     * @param int $size 数量
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function mallWorshipList($hallId = 0, $isFamous = 0, $page = 1, $size = 20)
    {
        $map = '';
        if ($hallId) {
            $map = 'WHERE w.hall_id = '.$hallId;
        }

        if ($isFamous) {
            // 查询名人馆祭拜记录
            $map = 'WHERE h.famous_type > 0';
        }

        $query = "SELECT w.worship_id,w.hall_id,w.create_at,m.member_name,m.member_avatar,m.member_nickname,h.famous_type,h.hall_name FROM tp_mall_worship AS w
                                   LEFT JOIN yun_member AS m ON w.user_id = m.member_id
                                   LEFT JOIN tp_hall AS h ON w.hall_id = h.id
                                   ".$map;

        $data['list'] = Db::query($query." ORDER BY w.create_at desc LIMIT ".($page-1) * $size.", $size");
        $total = count(Db::query($query));
        $data['total'] = $total;
        $data['page'] = $page;
        $data['size'] = $size;

        return $data;
    }
}
