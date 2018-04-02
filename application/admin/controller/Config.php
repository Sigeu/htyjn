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
 * 后台配置管理
 * Class Config
 * @package app\admin\controller
 * author andy <290648237@qq.com>
 * @date 2017/05/22
 */
class Config extends BasicAdmin {

    /**
     * 当前默认数据模型
     * @var string
     */
    protected $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    protected $title = '配置管理';

    /**
     * 配置列表
     */
    public function index()
    {

        // 设置页面标题
        $this->title = '配置管理';
        // 获取到所有GET参数
        $get = $this->request->get();

        // 配置分组信息
        $list_group = sysconf('config_group');
        $list_group = preg_split('/\s+/', $list_group);
        $tab_list   = [];
        foreach ($list_group as $key => $value) {
            $values = explode(':',$value);
            $tab_list[$key]['name'] = $values[0];
            $tab_list[$key]['title'] = $values[1];
            // 分组配置列表
            $db = Db::name($this->table)->where('group', $values[0])->order('sort asc, id asc');
            // 应用搜索条件
            if (isset($get['name']) && $get['name'] !== '') {
                $db->where('name', 'like', "%{$get['name']}%");
            }
            if (isset($get['title']) && $get['title'] !== '') {
                $db->where('title', 'like', "%{$get['title']}%");
            }

            // 配置分组信息
            $data = parent::_list($db, false, false);
            
            $tab_list[$key]['list'] = $data['list'];
        }
        $this->assign('tab_list', $tab_list);
        return $this->fetch('');
    }

    /**
     * 添加配置
     */
    public function add() {
        return $this->_form($this->table, 'form');
    }

    /**
     * 编辑配置
     */
    public function edit() {
        return $this->_form($this->table, 'form');
    }

    /**
     * 配置分组 表单数据前缀方法
     * @param array $vo
     */
    protected function _form_filter(&$vo) {
        if ($this->request->isGet()) {
            // 配置分组信息
            $list_group = sysconf('config_group');
            $list_group = preg_split('/\s+/', $list_group);
            $tab_list   = [];
            foreach ($list_group as $key => $value) {
                $values = explode(':',$value);
                $tab_list[$key]['name'] = $values[0];
                $tab_list[$key]['title'] = $values[1];
                $tab_list[$key]['url']   = url('/')."admin.html#".url('index')."?group=".$values[0]."&spam=".$this->spm;
            }
            $this->assign('tab_list', $tab_list);

            // 配置表单元素类型信息
            $list_type = sysconf('form_item_type');

            $list_type = preg_split('/\s+/', $list_type);
            $type_list   = [];
            foreach ($list_type as $key => $value) {
                $values = explode(':',$value);
                $type_list[$key]['name'] = $values[0];
                $type_list[$key]['title'] = $values[1];
            }
            $this->assign('type_list', $type_list);

        }
    }

    /**
     * 删除配置
     */
    public function del() {
        if (DataService::update($this->table)) {
            $this->success("配置删除成功！", '');
        }
        $this->error("配置删除失败，请稍候再试！");
    }

    /**
     * 配置禁用
     */
    public function forbid() {
        if (DataService::update($this->table)) {
            $this->success("配置禁用成功！", '');
        }
        $this->error("配置禁用失败，请稍候再试！");
    }

    /**
     * 配置启用
     */
    public function resume() {
        if (DataService::update($this->table)) {
            $this->success("配置启用成功！", '');
        }
        $this->error("配置启用失败，请稍候再试！");
    }



}
