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

class HallTwo extends Model
{


    /**
     * @param $value
     * @return false|int
     */
    public function setTwoBirthday1Attr($value)
    {
        return date_to_unixtime($value);
    }

    /**
     * @param $value
     * @return false|int
     */
    public function setTwoBirthday2Attr($value)
    {
        return date_to_unixtime($value);
    }

    /**
     * @param $value
     * @return false|int
     */
    public function setTwoDeath1Attr($value)
    {
        return date_to_unixtime($value);
    }

    /**
     * @param $value
     * @return false|int
     */
    public function setTwoDeath2Attr($value)
    {
        return date_to_unixtime($value);
    }

//    /**
//     * @param $value
//     * @return false|string
//     */
//    public function getTwoBirthday1Attr($value)
//    {
//        return unixtime_to_date($value, 'Y-m-d');
//    }
//
//    /**
//     * @param $value
//     * @return false|string
//     */
//    public function getTwoBirthday2Attr($value)
//    {
//        return unixtime_to_date($value, 'Y-m-d');
//    }
//
//    /**
//     * @param $value
//     * @return false|string
//     */
//    public function getTwoDeath1Attr($value)
//    {
//        return unixtime_to_date($value, 'Y-m-d');
//    }
//
//    /**
//     * @param $value
//     * @return false|string
//     */
//    public function getTwoDeath2Attr($value)
//    {
//        return unixtime_to_date($value, 'Y-m-d');
//    }


}
