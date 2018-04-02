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

namespace app\admin\model;

use think\Model;

class HallGroup extends Model
{

    // 新增自动完成列表
    protected $insert = ['status' => 1];

    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
//    protected $autoWriteTimestamp = true;

    // 创建时间字段
//    protected $createTime = 'create_at';

    /**
     * 关联查询
     * @return \think\model\relation\HasOne
     */
    public function hallGroupMember()
    {
        return $this->hasOne('hallGroupMember', 'group_id');
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
}
