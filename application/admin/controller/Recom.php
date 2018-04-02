<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: ding <dingzhangze@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\NodeModel;
use app\admin\service\DataService;
use app\admin\service\ToolsService;
use think\Db;

/**
 * 公墓商城文章推荐
 * @package app\admin\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/08/01
 */
class Recom extends BasicAdmin
{
    /**
     * 指定当前数据表
     * @var string
     */
    protected $table = 'cemetery_article';

    public function index()
    {
        // 设置页面标题
        $this->title = '公墓商城文章推荐管理';
        // 获取到所有GET参数
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->table)->where('is_deleted', '0');
        // 应用搜索条件
//        foreach (['username', 'phone'] as $key) {
//            if (isset($get[$key]) && $get[$key] !== '') {
//                $db->where($key, 'like', "%{$get[$key]}%");
//            }
//        }
        // 实例化并显示
        parent::_list($db);
    }

    /**
     * 文章推荐
     */
    public function recom()
    {
        if (DataService::update($this->table)) {
            $this->success("文章推荐成功！", '');
        }
        $this->error("推荐失败，请稍候再试！");
    }

    /**
     * 文章取消推荐
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("文章推荐成功！", '');
        }
        $this->error("推荐失败，请稍候再试！");
    }

}