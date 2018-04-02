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

use app\admin\model\NodeModel;
use app\admin\service\DataService;
use app\admin\service\ToolsService;
use think\Db;

/**
 * 公墓商城首页搜索价格区间设置
 * @package app\admin\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/08/03
 */
class Ceset extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'CemeteryPrice';

    public function index()
    {
        // 设置页面标题
        $this->title = '首页搜索价格区间';
        $db = Db::name($this->table);
        // 实例化并显示
        parent::_list($db);
    }

    /**
     * @return array|string
     * 添加
     */
    public function add()
    {
        return $this->_form($this->table, 'form');
    }

    /**
     * @return array|string
     * 编辑
     */
    public function edit()
    {
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
}