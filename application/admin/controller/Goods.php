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
use app\admin\service\ToolsService;
use think\Db;

/**
 * 商品管理
 * Class Goods
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/03
 */
class Goods extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'MallGoods';

    /**
     * 指定当前商品分类数据表
     * @var string
     */
    protected $categoryTable = 'MallGoodsCategory';

    /**
     * 指定当前产品套餐数据表
     * @var string
     */
    protected $packageTable = 'MallGoodsPackage';

    /**
     * 指定当前祭拜表
     * @var string
     */
    protected $worshipTable = 'MallWorship';
    /**
     * 商品列表
     */
    public function index()
    {
        $this->title = '商品管理';
        $get = $this->request->get();

        // 根据分类搜索祭祀商品
        if(isset($get['cid']) && $get['cid'] !== '' && $get['cid'] != '-1') {
            $cateIds = $this->_searchByCategory($get['cid']);
            if($cateIds !== '') {
                $db = Db::name($this->table)->where('cid', 'in', $cateIds)->where('is_deleted', '0');
            }else {
                $db = Db::name($this->table)->where('cid', $get['cid'])->where('is_deleted', '0');
            }
        }else {
            // 实例Query对象
            $db = Db::name($this->table)->where('is_deleted', '0');
        }

        // 应用搜索条件
        foreach (['name', 'summary'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        // 商品分类名称
        $data = parent::_list($db, true, false);
        foreach($data['list'] as $key=>$list) {
            $data['list'][$key]['cname'] = Db::name($this->categoryTable)->where('id', $list['cid'])->value('name');
        }

        // 获取商品分类
        $menus = $this->_getGoodsCategory();
        $this->assign('menus', $menus);

        return $this->fetch('', $data);
    }

    /**
     * 根据商品分类搜索
     * @param int $cid 商品分类id
     * @return array|string
     */
    private function _searchByCategory($cid) {
        $cateData = Db::name($this->categoryTable)->where('pid', $cid)->field('id')->select();
        $cateIds = [];
        foreach ($cateData as $cate) {
            $cateIds[] = $cate['id'];

        }
        $cateIds = implode(',', $cateIds);
        return $cateIds;
    }

    /**
     * 获取商品分类 辅助方法
     * @return array
     */
    private function _getGoodsCategory() {
        // 商品分类处理
        $_menus = Db::name($this->categoryTable)->order('sort asc,id asc')->select();
//        $_menus[] = ['name' => '顶级分类', 'id' => '0', 'pid' => '-1'];
        $menus = ToolsService::arr2table($_menus);
        foreach ($menus as $key => &$menu) {
            if (substr_count($menu['path'], '-') > 3) {
                unset($menus[$key]);
                continue;
            }
            if (isset($vo['pid'])) {
                $current_path = "-{$vo['pid']}-{$vo['id']}";
                if ($vo['pid'] !== '' && (stripos("{$menu['path']}-", "{$current_path}-") !== false || $menu['path'] === $current_path)) {
                    unset($menus[$key]);
                }
            }
        }
        return $menus;
    }

    /**
     * 添加商品
     * @return array|string
     */
    public function add()
    {
        $result = $this->_form($this->table);

        if(isset($result['id'])){
            $this->title = '编辑商品';
        }else {
            $this->title = '添加商品';
        }

        return $this->_form($this->table, 'form');
    }

    /**
     * 编辑商品
     * @return array|string
     */
    public function edit()
    {
        return $this->add();
    }

    /**
     * 文章添加/编辑 返回结果跳转处理
     * @param $result
     */
    protected function _form_result(&$result)
    {
        $result !== false ? $this->success('恭喜，保存成功哦！', url('/').'admin.html#'.url('index').'?spm='.$this->spm) : $this->error('保存失败，请稍候再试！');
    }

    /**
     * 删除商品
     */
    public function del() {
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 商品下架
     */
    public function forbid() {
        if (DataService::update($this->table)) {
            $this->success("商品下架成功！", '');
        }
        $this->error("商品下架失败，请稍候再试！");
    }

    /**
     * 商品上架
     */
    public function resume() {
        if (DataService::update($this->table)) {
            $this->success("商品上架成功！", '');
        }
        $this->error("商品上架失败，请稍候再试！");
    }

    /**
     * 商品分类列表
     */
    public function category()
    {
        $this->title = '商品分类管理';
        $db = Db::name($this->categoryTable)->order('sort asc, id asc');
        parent::_list($db, false);

    }

    /**
     * 商品分类 列表数据处理
     * @param array $data
     */
    protected function _category_data_filter(&$data)
    {
        foreach ($data as &$vo) {
            $vo['ids'] = join(',', ToolsService::getArrSubIds($data, $vo['id']));
        }
        $data = ToolsService::arr2table($data);
    }

    /**
     * 添加商品分类
     */
    public function addCategory() {
        return $this->_form($this->categoryTable, 'categoryform');
    }

    /**
     * 编辑商品分类
     */
    public function editCategory() {
        return $this->addCategory();
    }

    /**
     * 商品分类 表单数据前缀方法
     * @param array $vo
     */
    protected function _form_filter(&$vo) {
        if ($this->request->isGet()) {
            // 上级分类处理
            $menus = $this->_getGoodsCategory();
            $this->assign('menus', $menus);

            //动画前缀设置
            if(isset($vo['btn_id'])){
                $btnId = explode('_', $vo['btn_id']);
                $vo['btn_id_prefix'] = $btnId[0];
            }
        }
    }

    /**
     * 删除商品分类
     */
    public function delCategory() {
        if (DataService::update($this->categoryTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }
    
    /**
     * 商品套餐列表
     */
    public function package()
    {

        $this->title = '套餐列表';
        $get = $this->request->get();

        // 实例Query对象
        $db = Db::name($this->packageTable);

        // 应用搜索条件
        foreach (['name', 'summary'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        parent::_list($db);
    }

    /**
     * 添加商品套餐
     */
    public function addPackage()
    {
        $result = $this->_form($this->packageTable);

        if(isset($result['id'])){
            $this->title = '编辑套餐';
        }else {
            $this->title = '添加套餐';
        }

        $category = Db::name($this->categoryTable)->order('sort desc,id desc')->select();
        $category = ToolsService::arr2tree($category);
        foreach ($category as $ckey=>$cate){
            foreach ($cate['sub'] as $skey=>$sub){
                $goods = $this->_filterGoods($sub['id']);
                $category[$ckey]['sub'][$skey]['goods'] = $goods;
            }
        }
        $this->assign('category', $category);

        return $this->_form($this->packageTable, 'packageform', null, []);
//        return $this->_form($this->packageTable, 'packageform');
        /*

        // 对post参数进行处理
        $params = $this->request->param();

        $data = [];

        if($this->request->isPost()){
            $goodsIds = $params['goods_ids'];
            $gids = [];
            foreach ($goodsIds as $gkey=>$number) {
                if((int)$number){
                    $gids[] = [
                        'goods_id'  => $gkey,
                        'number'    => (int)$number
                    ];
                }
            }

            $gids = serialize($gids);
            $data = [
                'goods_ids' => $gids
            ];
        }
        return $this->_form($this->packageTable, 'packageform', null, [], $data);*/
    }

    protected function _filterGoods($cid = 0) {

        $map = [];
        if($cid){
            $map['cid'] = $cid;
            $map['is_deleted'] = 0;
        }
        $db = Db::name($this->table)->where($map)->order('id desc')->select();
        return $db;
    }

    /**
     * 编辑商品套餐
     */
    public function editPackage() {
        return $this->addPackage();
    }

    public function selectGoods()
    {
        $category = Db::name($this->categoryTable)->order('sort desc,id desc')->select();
        $category = ToolsService::arr2tree($category);
        foreach ($category as $ckey=>$cate){
            foreach ($cate['sub'] as $skey=>$sub){
                $goods = $this->_filterGoods($sub['id']);
                $category[$ckey]['sub'][$skey]['goods'] = $goods;
            }
        }
        $this->assign('category', $category);
        return $this->fetch('selectgoods');
    }

    /**
     * 商品套餐 表单处理
     * @param $data
     */
//    protected function _editpackage_form_filter(&$data) {
//        if ($this->request->isGet()) {
//            $goodsIds = unserialize($data['goods_ids']);
//
//            $res = [];
//            $gIds = [];
//            foreach ($goodsIds as $key=>$goodsId) {
//                $goodsData = Db::name($this->table)->where('is_deleted', 0)->find($goodsId['goods_id']);
//                $goodsData['number'] = $goodsId['number'];
//                $res[] = $goodsData;
//                $gIds[] = $goodsId['goods_id'];
//            }
//            $data['goods_ids'] = $gIds;
//            $data['goods'] = $res; // 套餐产品
//        }
//    }



    /**
     * 删除商品套餐
     */
    public function delPackage() {
        if (DataService::update($this->packageTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 商品套餐下架
     */
    public function forbidPackage() {
        if (DataService::update($this->packageTable)) {
            $this->success("商品套餐下架成功！", '');
        }
        $this->error("商品套餐下架失败，请稍候再试！");
    }

    /**
     * 商品套餐上架
     */
    public function resumePackage() {
        if (DataService::update($this->packageTable)) {
            $this->success("商品套餐上架成功！", '');
        }
        $this->error("商品套餐上架失败，请稍候再试！");
    }

    /*****************************祭拜记录管理*****************************/

    /**
     * 祭拜记录列表
     */
    public function worshipRecords()
    {
        $this->title = '祭拜记录管理';
        $get = $this->request->get();

        $db = Db::name($this->worshipTable)->order('create_at desc');

        // 应用搜索条件
        foreach (['user_id', 'hall_id'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, '=',  $get[$key]);
            }
        }

        parent::_list($db, true, true, false, 100);
    }

    /**
     * 删除祭拜记录
     */
    public function delWorship()
    {
        if (DataService::update($this->worshipTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 清除无效祭祀记录
     */
    public function cleanWorship()
    {
        $hallId = $this->request->param('hall_id');

        $map = [
            'create_at' => ['elt', time() - 6*3600],
        ];
        if ($hallId) {
            $map['hall_id'] = $hallId;
        }
        $result = Db::name($this->worshipTable)->where($map)->delete();

        if ($result) {
            $this->success("清除无效祭祀记录成功！", '');
        }
        $this->error("已经很干净了！");
    }
}
