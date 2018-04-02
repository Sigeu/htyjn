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

namespace app\admin\model;

use think\Model;

class HallOne extends Model
{

    /**
     * @param $value
     * @return false|int
     */
    public function setOneBirthdayAttr($value)
    {
//        dump(date_to_unixtime($value));die;
        return date_to_unixtime($value);
    }

    /**
     * @param $value
     * @return false|int
     */
    public function setOneDeathAttr($value)
    {
        return date_to_unixtime($value);
    }

//    /**
//     * @param $value
//     * @return false|string
//     */
//    public function getOneBirthdayAttr($value)
//    {
//        return unixtime_to_date($value, 'Y-m-d');
//    }
//
//    /**
//     * @param $value
//     * @return false|string
//     */
//    public function getOneDeathAttr($value)
//    {
//        return unixtime_to_date($value, 'Y-m-d');
//    }




}
