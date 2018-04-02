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

use think\Model;

class RechargePackage extends Model
{
    //

    /**
     * 获取纪念币充值套餐列表
     * @param int $page
     * @param int $size
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($page = 1, $size = 10, $memberId)
    {
        $map = [
            'status' => 1,
            'is_sale' => 1
        ];

        $data = self::where($map)->page($page, $size)->order('id asc, sort asc')->select();

        if ($data) {
            foreach ($data as $item) {
                $isUsed = 0;
                // TODO 检查当前登录用户是否已经购买过此套餐

                $item['isUsed'] = $isUsed;

                $item['purchase'] = $item['price'] * 100; // 购买纪念币数量为套餐价格的100倍 比例是：1:100
            }
        }

        return $data;
    }

    /**
     * 根据套餐ID获取详情
     * @param $id
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getDataById($id)
    {
        $data = self::where('id', $id)->find();

        return $data;
    }

}
