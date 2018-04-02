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
 * 纪念馆追思留言模型
 * Class HallLeaveMessage
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/7/11
 */
class HallLeaveMessage extends Model
{

    /**
     * 纪念馆追思留言列表
     * @param int $hallId 纪念馆ID
     * @param int $page 页码
     * @param int $size 数量
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function hallLeaveMessage($hallId = 0, $page = 1, $size = 20)
    {
//        config('database.prefix', '');
//        $map = [];
//        if ($hallId){
//            $map = [
//                'l.hall_id' => $hallId
//            ];
//        }
//
//        $data = Db::name("tp_hall_leave_message")
//            ->where($map)
//            ->alias("l")
//            ->join('yun_member m','l.member_id = m.member_id')
//            ->join('tp_hall h','l.hall_id = h.id')
//            ->field("l.*, m.member_id, m.member_name, m.member_nickname, m.member_avatar, h.hall_name")
//            ->order("l.create_at desc")
//            ->page($page,$size)
//            ->select();
//        $total = Db::name("tp_hall_leave_message")
//            ->where($map)
//            ->alias("l")
//            ->join('yun_member m','l.member_id = m.member_id')
//            ->join('tp_hall h','l.hall_id = h.id')
//            ->field("l.*, m.member_id, m.member_name, m.member_nickname, m.member_avatar, h.hall_name")
//            ->count();
        $map = '';
        if ($hallId) {
            $map = 'WHERE h.id = '.$hallId;
        }

        $query = "SELECT l.*,m.member_name,m.member_avatar,m.member_nickname,h.hall_name FROM tp_hall_leave_message AS l
                                   LEFT JOIN yun_member AS m ON l.member_id = m.member_id
                                   LEFT JOIN tp_hall AS h ON l.hall_id = h.id
                                   ".$map;

        $data['list'] = Db::query($query." ORDER BY l.create_at desc LIMIT ".($page-1) * $size.", $size");
        $total = count(Db::query($query));
        $data['total'] = $total;
        $data['page'] = ceil($total / $size);;
        $data['size'] = $size;
//        dump($data);die;
        return $data;
    }
    


}
