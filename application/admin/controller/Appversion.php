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
 * App版本管理
 * Class Appversion
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/8/10
 */
class Appversion extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'AppVersion';

    /**
     * 列表
     */
    public function index()
    {
        $this->title = 'App版本管理';
        $db = Db::name($this->table);

        parent::_list($db);
    }

    /**
     * 获取Ajax表格数据
     */
    public function ajaxIndex()
    {

//        $db = Db::name($this->table);
//        $get = $this->request->get();
//
//        // 应用搜索条件
//        $keyArr = !empty($get['key']) ? $get['key'] : [];
//        foreach (['name', 'description'] as $key) {
//
//            if (isset($keyArr[$key]) && $keyArr[$key] !== '') {
//                $db->where($key, 'like', "%{$keyArr[$key]}%");
//            }
//        }
//
//        $count = $db->count();

        return parent::_ajaxData($this->table, ['name', 'description']);
    }

    /**
     * 添加
     */
    public function add() {
        return $this->_form($this->table, 'form');
    }

    /**
     * 编辑
     */
    public function edit() {
        return $this->add();
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
