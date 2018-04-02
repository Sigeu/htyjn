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
 * 百家姓管理
 * Class Surnames
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/8/3
 */
class Surnames extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'HallSurnames';



    /**
     * Surnames 列表
     */
    public function index()
    {
        // 设置页面标题
        $this->title = '百家姓管理';
        // 获取到所有GET参数
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->table)->order('sort asc, id asc');
        // 应用搜索条件
        foreach (['username', 'phone'] as $key) {
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
    public function add() {
        $this->title = '新增姓氏';
        return $this->_form($this->table, 'form');
    }

    /**
     * 编辑
     */
    public function edit() {
        $this->title = '编辑姓氏';
        return $this->_form($this->table, 'form');
    }

    /**
     * 删除
     */
    public function del() {
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 禁用
     */
    public function forbid() {
        if (DataService::update($this->table)) {
            $this->success("禁用成功！", '');
        }
        $this->error("禁用失败，请稍候再试！");
    }

    /**
     * 启用
     */
    public function resume() {
        if (DataService::update($this->table)) {
            $this->success("启用成功！", '');
        }
        $this->error("启用失败，请稍候再试！");
    }






}
