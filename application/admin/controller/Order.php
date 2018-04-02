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
 * 订单管理
 * Class Order
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/12
 */
class Order extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'MallOrder';

    /**
     * 订单列表
     */
    public function index()
    {
        $this->title = '订单管理';
        $get = $this->request->get();

        $db = Db::name($this->table);
        parent::_list($db);

    }

    /**
     * 查看订单
     */
    public function orderGoods()
    {
        $this->assign('title', '订单详情');
        $orderId = $this->request->param('order_id');
        $orderInfo = Db::name('MallOrder')->where('order_id', $orderId)->find();
        $orderGoods = Db::name('MallOrderGoods')->where('order_id', $orderId)->select();

        $this->assign('orderInfo', $orderInfo);
        $this->assign('orderGoods', $orderGoods);
        return $this->fetch('ordergoods');
    }


    /**
     * 删除订单
     */
    public function del() {
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 取消订单
     */
    public function cancelOrder() {
        if (DataService::update($this->table)) {
            $this->success("订单取消成功！", '');
        }
        $this->error("订单取消失败，请稍候再试！");
    }

}
