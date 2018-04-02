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

namespace app\home\model;

use think\Model;

/**
 * 单页模型
 * Class Page
 * @package app\home\model
 * @author andy <290648237@qq.com>
 * @date 2017/6/25
 */
class Page extends Model
{

    /**
     * 根据ID获取详情
     *
     * @param int $id 单页ID
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataByID($id)
    {
        $result = self::find($id);
        return $result;
    }

    /**
     * 根据特殊单页类型获取单页内容
     *
     * @param string $pageType 单页类型
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataByType($pageType)
    {
        $result = self::where('page_type', $pageType)->find();
        return $result;
    }
}
