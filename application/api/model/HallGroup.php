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

class HallGroup extends Model
{

    // 新增自动完成列表
    protected $insert = ['status' => 1];

    /**
     * 关联查询
     * @return \think\model\relation\HasOne
     */
    public function hallGroupMember()
    {
        return $this->hasOne('hallGroupMember', 'group_id');
    }

    /**
     * 判断群是否存在
     * @param int $groupId
     * @return int|string
     */
    public static function exist($groupId)
    {
        $result = self::get($groupId);
        return $result;
    }

    /**
     * 判断群是否已满
     * @param int $groupId 群ID
     * @return bool
     */
    public static function isGroupFull($groupId)
    {
        $data = self::get($groupId);

        // 群成员总数
        $memberCount = HallGroupMember::getGroupMemberCount($groupId);
        $result = false;
        if ($memberCount >= $data['max_users']) {
            // 如果群成员总数等于该群最大限制人数 则此群已满
            $result = true;
        }

        return $result;
    }

    /**
     * 创建纪念馆群
     * @param $data
     * @return int|string
     */
    public static function createGroup($data)
    {

        // 插入数据
        $hallModel = new self();

        //自动更新时间字段
        $hallData = $data;
        $hallData['hallGroupMember'] = [
            'member_id' => $data['create_by'],
            'role_type' => 1, // 群角色 默认是创建者
            'join_at' => time(),
            'create_at' => time()
        ];

        $res = $hallModel->together('hallGroupMember')->save($hallData);

        return $res;
    }

    /**
     * 更新纪念馆群信息
     * @param int $groupId 群ID
     * @param array $data
     * @return $this
     */
    public static function updateGroup($groupId, $data)
    {
        $data['update_at'] = time();
        $result = self::where('id', $groupId)->update($data);

        return $result;
    }

    /**
     * 获取纪念馆群列表
     * @param int $hallId
     * @param int $loginUid
     * @param int $page
     * @param int $size
     * @return array
     */
    public static function getGroupList($hallId = 0, $loginUid = 0, $page = 1, $size = 10)
    {
        $map = [];
        if ($hallId) {
            $map['hall_id'] = $hallId;
        }

        $list = self::where($map)->order('create_at desc')->page($page, $size)->select();
        $total = self::where($map)->count();

        if ($list) {
            foreach ($list as $key=>$groupItem) {
                $list[$key] = self::getGroupInfoById($groupItem['id'], $loginUid);
            }
        }

        $data = [
            'list' => $list,
            'total' => $total
        ];

        return $data;
    }

    /**
     * 获取纪念馆群总数
     * @param $hallId
     * @return int|string
     */
    public static function getHallGroupCount($hallId)
    {
        $result = self::where('hall_id', $hallId)->count();

        return $result;
    }



    /**
     * 根据群ID获取群详情
     * @param int $groupId 群ID
     * @param int $loginUid 当前登录用户ID
     * @return bool|static
     */
    public static function getGroupInfoById($groupId, $loginUid)
    {
        $data = self::get($groupId);

        if ($data) {
            // 群成员总数
            $data['member_count'] = HallGroupMember::getGroupMemberCount($groupId);

            // 群头像图片
            $data['avatar'] = get_url_with_domain($data['avatar']);

            // 获取当前用户的群角色
            $data['login_role_type'] = 4;
            $groupRole = HallGroupMember::groupRole($data['id'], $loginUid);

            if ($groupRole) {
                $data['login_role_type'] = $groupRole;
            }
        }

        return $data;
    }

    public static function getHallIdByGroupId($groupId)
    {
        $result = self::where('id', $groupId)->find();

        return $result ? $result['hall_id'] : false;
    }

    /**
     * 获取环信群组ID
     * @param $groupId
     * @return mixed
     */
    public static function getHxGroupId($groupId)
    {
        $result = self::where('id', $groupId)->value('hx_group_id');

        return $result;
    }

}
