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

namespace app\admin\controller;

use app\admin\service\DataService;
use think\Db;

/**
 * 充值管理
 * Class Recharge
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/8/21
 */
class Recharge extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'Recharge';

    /**
     * 指定当前充值套餐数据表
     * @var string
     */
    protected $packageTable = 'RechargePackage';



    /**
     * 充值记录 列表
     */
    public function rechargeOrder()
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

    /**
     * 删除订单
     */
    public function delOrder() {
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 纪念币套餐 列表
     */
    public function package()
    {
        // 设置页面标题
        $this->title = '纪念币套餐管理';
        // 获取到所有GET参数
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->packageTable)->order('sort asc, id asc');
        // 应用搜索条件
        foreach (['name'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }
        // 实例化并显示
        parent::_list($db);
    }

    /**
     * 添加
     */
    public function addPackage() {
        $this->title = '新增充值套餐';
        return $this->_form($this->packageTable, 'packageform');
    }

    /**
     * 编辑
     */
    public function editPackage() {
        $this->title = '编辑充值套餐';
        return $this->_form($this->packageTable, 'packageform');
    }

    /**
     * 删除
     */
    public function delPackage() {
        if (DataService::update($this->packageTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 禁用
     */
    public function forbidPackage() {
        if (DataService::update($this->packageTable)) {
            $this->success("禁用成功！", '');
        }
        $this->error("禁用失败，请稍候再试！");
    }

    /**
     * 启用
     */
    public function resumePackage() {
        if (DataService::update($this->packageTable)) {
            $this->success("启用成功！", '');
        }
        $this->error("启用失败，请稍候再试！");
    }






}
