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

use app\admin\service\DataService;
use think\Db;

/**
 * 会员管理
 * Class Member
 * @package app\admin\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/05/17
 */
class Member extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'yun_member';


    public function _initialize()
    {
        parent::_initialize();
        config('database.prefix', '');
    }

    /*
     * 会员列表
     */
    public function index()
    {
        // 设置页面标题
        $this->title = '会员管理';
        // 获取到所有GET参数
        $get = $this->request->get();

        // 实例Query对象
        $db = Db::name($this->table)->where('is_deleted', '0');
        // 应用搜索条件
        foreach (['member_name', 'member_mobile'] as $key) {
            if (isset($get[$key]) &&  $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }
        // 实例化并显示
         parent::_list($db);
    }

    /**
     * 用户添加
     */
    public function add() {
        return $this->_form($this->table, 'form');
    }

    /**
     * 用户编辑
     */
    public function edit() {

        return $this->_form($this->table, 'form');
    }

    /**
     * 用户密码修改
     */
    public function pass() {
        if ($this->request->isGet()) {
            $this->assign('verify', false);
            return $this->_form($this->table, 'pass');
        }
        $data = $this->request->post();

        if ($data['password'] !== $data['repassword']) {
            $this->error('两次输入的密码不一致！');
        }
//        if (DataService::save($this->table, ['id' => $data['id'], 'password' => md5($data['password'])], 'id')) {
        if (DataService::save($this->table, ['member_id' => $data['member_id'], 'member_passwd' => make_password($data['password'])], 'member_id')) {
            $this->success('密码修改成功，下次请使用新密码登录！', '');
        }
        $this->error('密码修改失败，请稍候再试！');
    }




    /**
     * 删除用户
     */
    public function del() {
        if (DataService::update($this->table)) {
            $this->success("用户删除成功！", '');
        }
        $this->error("用户删除失败，请稍候再试！");
    }

    /**
     * 用户禁用
     */
    public function forbid() {
        if (DataService::update($this->table)) {
            $this->success("用户禁用成功！", '');
        }
        $this->error("用户禁用失败，请稍候再试！");
    }

    /**
     * 用户启用
     */
    public function resume() {
        if (DataService::update($this->table)) {
            $this->success("用户启用成功！", '');
        }
        $this->error("用户启用失败，请稍候再试！");
    }

    protected function _form_filter(&$vo) {
        if ($this->request->isPost()) {
            //
            if(isset($vo['member_passwd'])){
                $vo['member_passwd'] = make_password($vo['member_passwd']);
            }
        }

        if ($this->request->isGet()) {
            // 获取会员组列表
            $memberGroupList = Db::name('tp_member_group')->where('status', 1)->select();
            $this->assign('memberGroupList', $memberGroupList);
//            dump($memberGroupList);die;
        }
    }


}