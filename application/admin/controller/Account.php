<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: ding <dingzhangze@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Db;

/**
 * 流水管理
 * Class Member
 * @package app\admin\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/05/24
 */
class Account extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'recharge';
    protected $table1 = 'consume';

    public function index()
    {
        // 设置页面标题
        $this->title = '充值管理';
        // 获取到所有GET参数
        $get = $this->request->get();

        // 实例Query对象
        $db = Db::name($this->table);
        // 应用搜索条件
        foreach (['pd_member_name', 'pd_sn'] as $key) {
            if (isset($get[$key]) &&  $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }
        // 实例化并显示
        parent::_list($db);
    }

    public function consume()
    {
        // 设置页面标题
        $this->title = '消费流水';
        // 获取到所有GET参数
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->table1);
        // 应用搜索条件
        foreach (['cs_member_name', 'cs_sn'] as $key) {
            if (isset($get[$key]) &&  $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }
        // 实例化并显示
        parent::_list($db);
    }
}