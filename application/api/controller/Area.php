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

namespace app\api\controller;

use axios\tpr\core\Api;
use think\Db;

/**
 * 地区API
 * Class Article
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/06/01
 */
class Area extends Api
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'yun_area';


    /**
     * andy-地区列表
     * @desc 获取地区列表
     * @method post
     * @parameter int pid 父级ID（可选默认为“0”）
     * @parameter int pid_field 父级ID的字段名（可选默认为“pid”）
     * @response
     */
    public function getAreaData()
    {
        $pid = isset($this->param['pid']) && !empty($this->param['pid']) ? $this->param['pid'] : 0;
        $pid_field = $this->param['pid_field'] ? $this->param['pid_field'] : 'area_parent_id';
        $data = get_level_data($this->table, $pid, $pid_field);
        $this->response($data);
    }

    /**
     * andy-反向获取联动数据
     * @desc 反向获取联动数据
     * @method post
     * @response
     */
    public function getLevelKeyData()
    {

        $data = get_level_key_data($this->table, '', 'area_id', 'area_name', 'area_parent_id', 2);
        $this->response($data);
    }

}
