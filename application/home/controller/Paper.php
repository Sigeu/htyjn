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

namespace app\home\controller;

use app\common\controller\HomeBase;
use app\home\model\Page as PageModel;

/**
 * 单页控制器
 * Class Ad
 * @package app\home\controller
 * @author andy <290648237@qq.com>
 * @date 2017/6/15
 */
class Paper extends HomeBase
{
    /**
     * 单页详情
     */
    public function detail() {

        $param = $this->param;
        $template = 'detail'; // 设置默认文章模板

        if($this->module == 'about') {
            // 如果是特殊单页
            $data = PageModel::getDataByType($this->module);
            $template = 'about';
            $title = '关于我们';
        }elseif($this->module == 'contact') {
            $data = PageModel::getDataByType($this->module);
            $template = 'contact';
            $title = '联系我们';
        }elseif($this->module == 'private') {
            $data = PageModel::getDataByType($this->module);
            $template = 'detail';
            $title = '隐私协议';
        }else {
            // 常规单页
            $data = PageModel::getDataByID($param['id']);
            $title = $data['title'];
        }

        $this->assign('article', $data);

        // SEO
        $this->assign('seo_title', $title . ' - ' . sysconf('seo_title'));
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));
        return $this->fetch($template);
    }


}
