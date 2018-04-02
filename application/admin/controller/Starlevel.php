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
 * 商家后台菜单管理
 * @package app\admin\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/07/28
 */
class Starlevel extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'CemeteryTomb';

    public function index()
    {
        // 设置页面标题
        $this->title = '陵园星级评定';
        $db = Db::name($this->table)->where(['pid'=>0,'is_deleted'=>0]);
        // 实例化并显示
        parent::_list($db);
    }

    public function edit()
    {
        return $this->_form($this->table, '');
    }
}