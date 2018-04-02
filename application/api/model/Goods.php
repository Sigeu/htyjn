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

namespace app\api\model;
use think\Exception;
use think\Model;

/**
 * 祭祀商品模型
 * Class Goods
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/6/14
 */
class Goods extends Model {

    protected $name = 'mall_goods';

    /**
     * 根据商品id获取商品详情
     * @param int $id 商品id
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getGoodsByID($id)
    {
        $result = self::find($id);
        return $result;
    }

    public static function getGoodsByCategoryID($categoryID)
    {
        $map = [
            'cid'           => $categoryID,
            'is_deleted'    => 0
        ];
        $goods = self::where($map)->order('id desc')->select();
        return $goods;
    }




}
