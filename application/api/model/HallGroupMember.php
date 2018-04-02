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

class HallGroupMember extends Model
{

    /**
     * 关联查询纪念馆群成员
     * @return mixed
     */
    public function member()
    {
        return $this->belongsTo('MemberModel', 'member_id')->field('member_id, member_name, member_avatar, member_sex, member_nickname, hx_username');
    }

    /**
     * 关联查询纪念馆群信息
     * @return \think\model\relation\BelongsTo
     */
    public function hallGroup()
    {
        return $this->belongsTo('HallGroup', 'group_id');
    }

    /**
     * 判断用户是否为此群成员
     * @param array $data 关注数据
     * @return int|string
     */
    public static function exist($data)
    {
        $result = self::where($data)->count();

        return $result;
    }

    public static function joinGroup($groupId, $memberId)
    {
        $data = [
            'group_id' => $groupId,
            'member_id' => $memberId
        ];

        if (self::exist($data)) {
            // 退出群
            $result = self::where($data)->delete();
        }else {
            // 加入群
            $data['create_at'] = time();
            $data['join_at'] = time();
            $result = self::insert($data);
        }

        return $result;
    }

    public static function forbiddenTalk($groupId, $memberId)
    {
        $data = [
            'group_id' => $groupId,
            'member_id' => $memberId
        ];

        $isForbiddenTalk = self::where($data)->value('is_forbidden_talk');

        if ($isForbiddenTalk) {
            // 已经被禁言 执行取消禁言操作
            $result = self::where($data)->update(['is_forbidden_talk' => 0]);
        }else {
            // 没有被禁言 执行禁言操作
            $result = self::where($data)->update(['is_forbidden_talk' => 1]);
        }

        return $result;

    }

    /**
     * 获取群成员总数
     * @param $groupId
     * @return int|string
     */
    public static function getGroupMemberCount($groupId)
    {
        $result = self::where('group_id', $groupId)->count();
        return $result;
    }


    /**
     * 获取群成员
     * @param $groupId
     * @param int $loginUid
     * @return mixed
     */
    public static function getGroupMembers($groupId, $loginUid = 0)
    {

//        $ownerMap['role_type'] = 1; // 群主
//        $managerMap['role_type'] = ['in', [1,2]]; // 群管理员
//        $memberMap['role_type'] = ['egt', 3]; // 群成员

//        $data['owner'] = self::groupMemberList($groupId, $loginUid, $ownerMap);
//        $data['managers'] = self::groupMemberList($groupId, $loginUid, $managerMap);
//        $data['members'] = self::groupMemberList($groupId, $loginUid, $memberMap);

        $result = self::groupMemberList($groupId, $loginUid);
        return $result;
    }

    /**
     * 获取群成员 辅助方法
     * @param $groupId
     * @param int $loginUid
     * @param array $map
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function groupMemberList($groupId, $loginUid = 0, $map = [])
    {
        $map['group_id'] = $groupId;

        $data = self::where($map)->relation('')->select();

        foreach ($data as $memberItem) {
            // 判断当前登录用户是否关注过此群成员
            $memberItem['has_followed'] = 0;
            $hasFollowed = MemberFollow::exist(['follow_who' => $memberItem['member_id'], 'who_follow' => $loginUid]);
            if ($hasFollowed) {
                $memberItem['has_followed'] = 1;
            }

            // 获取用户信息
            $memberInfo = MemberModel::self()->findUser($memberItem['member_id'], 0, 'member_id, member_name, member_avatar, member_sex, member_nickname, hx_username');
            $memberItem['member_nickname'] = $memberInfo['member_nickname'];
            $memberItem['member_avatar'] = get_url_with_domain($memberInfo['member_avatar']);
            $memberItem['member_sex'] = $memberInfo['member_sex'];
            $memberItem['hx_username'] = $memberInfo['hx_username'];
        }

        return $data;
    }

    /**
     * 创建/移除群管理员
     * @param int $groupId 群ID
     * @param int $managerId 管理员ID
     * @return $this
     */
    public static function createGroupManager($groupId, $managerId)
    {

        $saveData = [
            'group_id' => $groupId,
            'member_id' => $managerId
        ];

        $roleType = self::where($saveData)->value('role_type');

        if ($roleType == 2) {
            // 已经是群管理员 移除操作
            $result = self::where($saveData)->update(['role_type' => 3]);
        }else {
            // 不是群管理员 创建操作
            $result = self::where($saveData)->update(['role_type' => 2]);
        }

        return $result;
    }

    public static function groupRole($groupId, $memberId)
    {
        $saveData = [
            'group_id' => $groupId,
            'member_id' => $memberId
        ];

        $roleType = self::where($saveData)->value('role_type');

        return $roleType;
    }

    /**
     * 判断是否是群管理员
     * @param $groupId
     * @param $managerId
     * @return bool
     */
    public static function isGroupManager($groupId, $managerId)
    {
        $saveData = [
            'group_id' => $groupId,
            'member_id' => $managerId
        ];

        $roleType = self::where($saveData)->value('role_type');

        if ($roleType == 2) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 判断是否是群主
     * @param $groupId
     * @param $ownerId
     * @return bool
     */
    public static function isGroupOwner($groupId, $ownerId)
    {
        $saveData = [
            'group_id' => $groupId,
            'member_id' => $ownerId
        ];

        $roleType = self::where($saveData)->value('role_type');

        if ($roleType == 1) {
            return true;
        }else {
            return false;
        }
    }


    /**
     * 判断是否被禁言
     * @param $groupId
     * @param $ownerId
     * @return bool
     */
    public static function isForbiddenTalk($groupId, $ownerId)
    {
        $saveData = [
            'group_id' => $groupId,
            'member_id' => $ownerId
        ];

        $isForbiddenTalk = self::where($saveData)->value('is_forbidden_talk');

        if ($isForbiddenTalk) {
            return true;
        }else {
            return false;
        }
    }


    /**
     * 获取我参与的群 我创建的/我加入的
     * @param int $memberId
     * @param int $roleType
     * @return array
     */
    public static function getMyGroups($memberId = 0, $roleType = 0)
    {

        if ($roleType) {
            $map['role_type'] = $roleType;
        }

        $map['member_id'] = $memberId;

        $list = self::where($map)->order('role_type asc')->select();
        $total = self::where($map)->count();

        $resList = [];
        if ($list) {
            foreach ($list as $key=>$groupItem) {
                $groupInfo = HallGroup::getGroupInfoById($groupItem['group_id'], $memberId);
                if ($groupInfo) {
                    // 如果数据存在
                    $resList[] = $groupInfo;
                }
            }
        }

//        dump($list);die;
        $data = [
            'list' => $resList,
            'total' => $total
        ];

        return $data;
    }

}
