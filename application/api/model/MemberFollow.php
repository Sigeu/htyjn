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
 * 用户关注模型
 * Class MemberFollow
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/7/18
 */
class MemberFollow extends Model
{

    /**
     * 判断用户是否关注过该用户
     * @param array $data 关注数据
     * @return int|string
     */
    public static function exist($data)
    {
        $result = self::where($data)->count();
        return $result;
    }

    /**
     * 用户关注 / 取消关注
     * @param int $followWho 关注谁
     * @param int $whoFollow 谁关注
     * @return int|string
     */
    public static function follow($followWho, $whoFollow)
    {
        $data = [
            'follow_who' => $followWho,
            'who_follow' => $whoFollow,
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


    /**
     * 获取我关注的人
     * @param $whoFollow
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getMyFollowingPerson($whoFollow)
    {
        $list = self::where('who_follow', $whoFollow)->order('create_at desc')->select();

        if ($list) {
            foreach ($list as $key=>$item) {
                $fields = 'member_id, member_avatar, member_sex, member_nickname, hx_username';
                $memberInfo = MemberModel::self()->findUser($item['follow_who'], '', $fields);
                $memberInfo['member_avatar'] = get_url_with_domain($memberInfo['member_avatar']);
                $memberInfo['has_followed'] = 1; // 是否关注
                $list[$key] =$memberInfo;
            }
        }

        return $list;
    }

}
