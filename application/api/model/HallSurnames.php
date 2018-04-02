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

/**
 * 纪念馆百家姓模型
 * Class HallSurnames
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/8/2
 */
class HallSurnames extends Model
{

    /**
     * 获取百家姓列表
     * @param int $page
     * @param int $size
     * @param string $sort
     * @return array
     */
    public static function getDatas($page = 1, $size = 20, $sort = 'create_at desc')
    {
        $map['status'] = 1;
        $list = self::where($map)->order($sort)->page($page, $size)->select();
        $total = self::where($map)->count();

        $data = [
            'list' => $list,
            'total' => $total
        ];

        return $data;
    }

    /**
     * 根据ID获取详情
     * @param $id
     * @return static
     */
    public static function getSurnamesInfoById($id)
    {
        $data = self::get($id);

        return $data;
    }
}
