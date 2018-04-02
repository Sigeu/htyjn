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
 * Class Member
 * @package app\admin\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/06/01
 */
class Business extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'business_menu';
    protected $categoryTable = 'CemeteryCategory';
    protected $cemeterySnTable = 'cemeterySn';
    protected $tables = 'CemeteryTomb';

    /*
     * 节点管理
     */
    public function node()
    {
        $alert = [
            'type'    => 'danger',
            'title'   => '安全警告',
            'content' => '结构为系统自动生成，状态数据请勿随意修改！'
        ];
        $needle = [
            'business'
        ];
        $this->assign('alert', $alert);
        $this->assign('title', '公墓系统节点管理');
        $this->assign('nodes', ToolsService::arr2table(NodeModel::getNeedle($needle), 'node', 'pnode'));

        return view();
    }

    /**
     * 保存节点变更
     */
    public function save() {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            if (isset($post['name']) && isset($post['value'])) {
                $nameattr = explode('.', $post['name']);
                $field = array_shift($nameattr);
                $data = ['node' => join(',', $nameattr), $field => $post['value']];
                DataService::save('BusinessNode', $data, 'node');
                $this->success('参数保存成功！', '');
            }
        } else {
            $this->error('访问异常，请重新进入...');
        }
    }

    /*
     * 菜单管理
     */
    public function menu()
    {
        $this->title = '商家后台菜单管理';
        $db = Db::name($this->table)->order('sort asc,id asc');
        parent::_list($db, false);
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _menu_data_filter(&$data) {
        foreach ($data as &$vo) {
            ($vo['url'] !== '#') && ($vo['url'] = url($vo['url']));
            $vo['ids'] = join(',', ToolsService::getArrSubIds($data, $vo['id']));
        }
        $data = ToolsService::arr2table($data);
    }

    /**
     * 添加栏目
     * @return array|string
     */
    public function add()
    {
        return $this->_form($this->table, 'menu_form');
    }

    /**
     * 编辑栏目
     * @return array|string
     */
    public function edit()
    {
        return $this->add();
    }

    /**
     * 表单数据前缀方法
     * @param array $vo
     */
    protected function _form_filter(&$vo)
    {
        if($this->request->isGet()) {
            // 上级栏目处理
            $_menus = Db::name($this->table)->where('status', '1')->order('sort desc,id desc')->select();
            $_menus[] = ['title' => '顶级菜单', 'id' => '0', 'pid' => '-1'];
            $menus = ToolsService::arr2table($_menus);
            foreach ($menus as $key => &$menu) {
                if (substr_count($menu['path'], '-') > 3) {
                    unset($menus[$key]);
                    continue;
                }
                if(isset($vo['pid'])) {
                    $current_path = "-{$vo['pid']}-{$vo['id']}";
                    if($vo['pid'] !== '' && (stripos("{$menu['path']}-", "{$current_path}-") !== false || $menu['path'] === $current_path)) {
                        unset($menus[$key]);
                    }
                }
            }
            //读取系统功能节点 todo

            $this->assign('menus', $menus);
        }
    }

    /**
     * 删除栏目
     */
    public function del()
    {
        if(DataService::update($this->table)) {
            $this->success("菜单删除成功！", '');
        }
        $this->error("菜单删除失败，请稍后再试！");
    }

    /**
     * 栏目禁用
     */
    public function forbid()
    {
        if(DataService::update($this->table)) {
            $this->success("菜单禁用成功！", '');
        }
        $this->error("菜单禁用失败，请稍后再试！");
    }

    public function resume()
    {
        if(DataService::update($this->table)) {
            $this->success("菜单启用成功！", '');
        }
        $this->error("菜单启用失败，请稍后再试！");
    }


    /**
     *陵园管理
     */
    public function cemetery()
    {
        // 设置页面标题
        $this->title = '陵园管理';
        // 获取到所有GET参数
        $get = $this->request->get();
        // 实例Query对象
        $map=[
            'pid'=>0,
            'is_deleted'=>0,
        ];
        $db = Db::name("cemetery_tomb")->where($map);
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
     * 墓穴管理
     */
    public function tomb()
    {    $this->title = '公墓管理';
        $get = $this->request->get();
        $map = [
            'is_deleted' => 0,
        ];

        // 根据分类搜索
        if (isset($get['cid']) && $get['cid'] !== '' && $get['cid'] != '-1') {
            $cateIds = $this->_searchByCategory($get['cid']);
            if ($cateIds !== '') {
                $db = Db::name($this->cemeterySnTable)->where('area_id', 'in', $cateIds)->where($map);
            } else {
                $db = Db::name($this->cemeterySnTable)->where('area_id', $get['cid'])->where($map);
            }
        } else {
            // 实例Query对象
            $db = Db::name($this->cemeterySnTable)->where($map);
        }
        // 应用搜索条件
        foreach (['name', 'cemetery_sn'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        // 分类名称
        $data = parent::_list($db, true, false);
        foreach ($data['list'] as $key => $list) {
            $data['list'][$key]['order_state'] = Db::name('cemetery_order')->where('cemetery_sn', $list['cemetery_sn'])->value('order_state');
        }

        return $this->fetch('', $data);
    }

    /**
     * 订单管理
     */
    public function order()
    {

        $this->title = '订单管理';
        $get = $this->request->get();

        $map=[
            'type'=>2
        ];
        $db = Db::name('CemeteryOrder')->where($map);
        // 应用搜索条件
        foreach (['phone', 'buyer_name','dead_id_card'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }
        $data = parent::_list($db, true, false);
        foreach ($data['list'] as $key => $list) {
            $data['list'][$key]['seller'] = Db::name('business_staff')->where('id', $list['seller'])->value('name');
        }
        return $this->fetch('', $data);


    }


}