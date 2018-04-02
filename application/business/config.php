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

if(is_mobile()){
    $view_path=APP_PATH . '../application/business/theme/wap/';
}else{
    $view_path=APP_PATH . '../application/business/theme/default/';
}



return [
    // 模板配置
    'template'               => [
        // 模板路径
        'view_path'    => $view_path,
    ],
];
