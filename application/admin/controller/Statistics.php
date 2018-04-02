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

/**
 * 数据统计管理
 * Class Statistics
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/8/23
 */
class Statistics extends BasicAdmin
{

    public function index()
    {
        return $this->fetch('index');
    }
}