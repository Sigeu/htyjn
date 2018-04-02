<?php

// +----------------------------------------------------------------------
// | Think.Admin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/Think.Admin
// +----------------------------------------------------------------------

/*  测试环境禁止操作路由绑定 */
//think\Route::post([
//    'admin/config/index' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁修改系统配置操作！']);
//    },
//    'admin/config/file' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁修改文件配置操作！']);
//    },
//    'admin/menu/add' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁添加菜单操作！']);
//    },
//    'admin/menu/edit' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁编辑菜单操作！']);
//    },
//    'admin/menu/forbid' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止禁用菜单操作！']);
//    },
//    'admin/menu/del' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止删除菜单操作！']);
//    },
//    'wechat/config/index' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改微信配置操作！']);
//    },
//    'wechat/config/pay' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改微信支付操作！']);
//    },
//    'wechat/menu/edit' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改微信菜单操作！']);
//    },
//
//    'admin/column/forbid' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改栏目菜单操作！']);
//    },
//    'admin/column/edit' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改栏目菜单操作！']);
//    },
//    'admin/column/del' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改栏目菜单操作！']);
//    },
//
//    'admin/config/forbid' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁修改系统配置操作！']);
//    },
//
//    'admin/config/edit' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁修改系统配置操作！']);
//    },
//
//    'admin/config/del' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁修改系统配置操作！']);
//    },
//
//
//
//    'admin/document/editmodel' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改文章模型菜单操作！']);
//    },
//    'admin/document/delmodel' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止修改文章模型菜单操作！']);
//    },
//]);
//think\Route::get([
//    'wechat/menu/cancel' => function() {
//        return json(['code' => 0, 'msg' => '测试环境禁止删除微信菜单操作！']);
//    }
//]);

use think\Route;
// 注册路由到api模块的Goods控制器的read操作
//Route::rule('api/goods/:id','api/Goods/read'); // 获取商品详情
//
//Route::post('api/login/username/password','api/Login/index'); // 用户登录
//Route::rule('api/profile','api/Profile/index'); // 获取用户信息


Route::get('links', 'home/Links/index'); // 友情链接

Route::get('paper/:id', 'home/Paper/detail'); // 单页

Route::get('about', 'home/Paper/detail'); // 关于我们
Route::get('private', 'home/Paper/detail'); // 隐私协议
//Route::get('cooperation', 'home/Paper/detail'); // 合作伙伴

Route::get('g/:id', 'home/Hall/detail'); // 纪念馆详情首页

//Route::get('nl/:cid', 'home/News/column'); // 资讯列表

Route::get('n/:id', 'home/News/detail'); // 资讯详情


//Route::get('api/goods/jnGetDurationMaterial', function () {
//    return json(['code' => 0, 'data' => null, 'message' => '非法请求']);
//});

// 域名部署
Route::domain([
//    'news.yjn100.com'   =>  'home/News',
//    'admin.yjn100.com'  =>  'admin',
//    'blog'              =>  'home/blog',
//    '*'                 =>  'home',
//    '*.user'            =>  'home/Member'
]);


