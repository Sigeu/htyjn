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

class HallStyleCategory extends Model
{
    /**
     * 关联查询 纪念馆风格
     * @return \think\model\relation\HasMany
     */
    public function hallStyle()
    {
        return $this->hasMany('HallStyle', 'category_id')->order('style_num, sort asc, id asc');
    }

    /**
     * 关联查询 纪念馆大厅风格
     * @return \think\model\relation\HasMany
     */
    public function hallWorshipStyle()
    {
        return $this->hasMany('HallWorshipStyle', 'category_id')->order('style_num, sort asc, id asc');
    }

    public static function getDataByCid($cid = 0)
    {
        return self::get($cid);
    }

    public static function getDataByPid($pid, $relationStyle, $type = 1)
    {
        $map = [
            'pid' => $pid,
            'status' => $type
        ];
        return self::relation($relationStyle)->where($map)->order('sort asc, id asc')->select();
    }

    public static function getStyleCategoryPidById($cid)
    {
        return self::where('id', $cid)->value('pid');
    }
}
