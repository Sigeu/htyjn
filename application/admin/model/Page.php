<?php

namespace app\admin\model;

use think\Model;

class Page extends Model
{

    public static function getDataById($id)
    {
        return self::get($id);
    }
}
