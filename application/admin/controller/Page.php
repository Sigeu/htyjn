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
 * 网站单页管理
 * Class Page
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/16
 */
class Page extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'Page';

    /**
     * 单页列表
     */
    public function index()
    {
        $this->title = '单页管理';
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->table);

        // 应用搜索条件
        foreach (['title', 'content'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        parent::_list($db, false);
    }

    /**
     * 添加页面
     * @return array|string
     */
    public function add()
    {
        return $this->_form($this->table, 'form');

    }

    /**
     * 编辑页面
     * @return array|string
     */
    public function edit()
    {
        return $this->add();
    }

    /**
     * 删除页面
     */
    public function del() {
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 页面 待审核 0
     */
    public function forbid() {
        if (DataService::update($this->table)) {
            $this->success("状态改为待审核成功！", '');
        }
        $this->error("状态改为待审核失败，请稍候再试！");
    }

    /**
     * 页面 已审核 1
     */
    public function resume() {
        if (DataService::update($this->table)) {
            $this->success("状态改为已审核成功！", '');
        }
        $this->error("状态改为已审核失败，请稍候再试！");
    }

    /**
     * 文章添加/编辑 返回结果跳转处理
     * @param $result
     */
    protected function _form_result(&$result)
    {
        $result !== false ? $this->success('恭喜，保存成功哦！', url('/').'admin.html#'.url('index').'?spm='.$this->spm) : $this->error('保存失败，请稍候再试！');
    }
}
