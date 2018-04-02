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

namespace app\home\controller;

use app\common\controller\HomeBase;
use app\home\model\Links as LinksModel;

/**
 *
 * Class Links
 * @package app\home\controller
 * @author andy <290648237@qq.com>
 * @date 2017/6/16
 */
class Links extends HomeBase
{

    /**
     * 友链首页
     * @return mixed
     */
    public function index()
    {

        $fLinks = LinksModel::getDatas(1); // 获取友情链接
        $hLinks = LinksModel::getDatas(2); // 获取合作单位链接

        return $this->fetch('index', ['fLinks' => $fLinks, 'hLinks' => $hLinks]);
    }
}