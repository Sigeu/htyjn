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

/**
 * 纪念馆关注模型
 * Class Hall
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/7/5
 */
class HallFollow extends Model
{

    /**
     * 判断用户是否关注过该纪念馆
     * @param array $data 关注数据
     * @return int|string
     */
    public static function exist($data)
    {
        $result = self::where($data)->count();
        return $result;
    }

    /**
     * 纪念馆关注 / 取消关注
     * @param int $memberId 用户ID
     * @param int $hallId 纪念馆ID
     * @return int|string
     */
    public static function follow($memberId, $hallId)
    {
        $data = [
            'member_id' => $memberId,
            'hall_id' => $hallId
        ];

        if (self::exist($data)) {
            // 取消关注
            $result = self::where($data)->delete();
        }else {
            // 关注
            $data['create_at'] = time();
            $result = self::insert($data);
        }

        return $result;
    }
}
