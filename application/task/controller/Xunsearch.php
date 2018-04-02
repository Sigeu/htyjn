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

namespace app\task\controller;

use think\Controller;
use app\api\model\Hall as HallModel;
use think\Log;

/**
 * 讯搜搜索引擎索引重建
 * Class XunSearch
 * @package app\task\controller
 * @author andy <290648237@qq.com>
 * @date 2017/8/18
 */
class Xunsearch extends Controller
{
    /**
     * reset
     */
    public function reset()
    {
        $this->resetXunHall();
    }

    /**
     * reset 纪念馆搜索
     */
    public function resetXunHall()
    {
        set_time_limit(0);
        HallModel::reBuildList();
        debug('Hall xunsearch 缓存更新成功');
        Log::write('Hall xunsearch 缓存更新成功');
    }

    public function Indexer()
    {
        // 引入xunsearch入口文件
        require_once dirname(__FILE__).'/../xunsearch/sdk/lib/XS.php';
    }
}