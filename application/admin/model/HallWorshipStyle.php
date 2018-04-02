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

class HallWorshipStyle extends Model
{
    public static function getDataByCid($cid = 0)
    {
        return self::where('category_id', $cid)->order('style_num desc, sort asc, id asc')->select();
    }

    public static function getNameById($id)
    {
        return self::where('id', $id)->value('style_name');
    }

}
