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

return [
    // +----------------------------------------------------------------------
    // | 应用设置
    // +----------------------------------------------------------------------
    // 应用命名空间
    'app_namespace'          => 'app',
    // 应用调试模式
    // 'app_debug'              => true,
    'app_debug'              => \think\Env::get('debug.status'),
    // 应用Trace
    // 'app_trace'              => true,
    'app_trace'              => \think\Env::get('debug.trace'),
    // 应用模式状态
    'app_status'             => '',
    // 是否支持多模块
    'app_multi_module'       => true,
    // 入口自动绑定模块
    'auto_bind_module'       => false,
    // 注册的根命名空间
    'root_namespace'         => [],
    // 扩展函数文件
    'extra_file_list'        => [APP_PATH . 'time' . EXT, APP_PATH . 'image' . EXT, THINK_PATH . 'helper' . EXT, APP_PATH . 'function.php'],
    // 默认输出类型
    'default_return_type'    => 'html',
    // 默认AJAX 数据返回格式,可选json xml ...
    'default_ajax_return'    => 'json',
    // 默认JSONP格式返回的处理方法
    'default_jsonp_handler'  => 'jsonpReturn',
    // 默认JSONP处理方法
    'var_jsonp_handler'      => 'callback',
    // 默认时区
    'default_timezone'       => 'PRC',
    // 是否开启多语言
    'lang_switch_on'         => false,
    // 默认全局过滤方法 用逗号分隔多个
    'default_filter'         => '',
    // 默认语言
    'default_lang'           => 'zh-cn',
    // 应用类库后缀
    'class_suffix'           => false,
    // 控制器类后缀
    'controller_suffix'      => false,
    // +----------------------------------------------------------------------
    // | 模块设置
    // +----------------------------------------------------------------------
    // 默认模块名
    'default_module'         => 'home',
    // 禁止访问模块
    'deny_module_list'       => ['common'],
    // 默认控制器名
    'default_controller'     => 'Index',
    // 默认操作名
    'default_action'         => 'index',
    // 默认验证器
    'default_validate'       => '',
    // 默认的空控制器名
    'empty_controller'       => 'Error',
    // 操作方法后缀
    'action_suffix'          => '',
    // 自动搜索控制器
    'controller_auto_search' => true,
    // +----------------------------------------------------------------------
    // | URL设置
    // +----------------------------------------------------------------------
    // PATHINFO变量名 用于兼容模式
    'var_pathinfo'           => 's',
    // 兼容PATH_INFO获取
    'pathinfo_fetch'         => ['ORIG_PATH_INFO', 'REDIRECT_PATH_INFO', 'REDIRECT_URL'],
    // pathinfo分隔符
    'pathinfo_depr'          => '/',
    // URL伪静态后缀
    'url_html_suffix'        => 'html',
    // URL普通方式参数 用于自动生成
    'url_common_param'       => false,
    // URL参数方式 0 按名称成对解析 1 按顺序解析
    'url_param_type'         => 0,
    // 是否开启路由
    'url_route_on'           => true,
    // 路由使用完整匹配
    'route_complete_match'   => false,
    // 路由配置文件（支持配置多个）
    'route_config_file'      => ['route'],
    // 是否强制使用路由
    'url_route_must'         => false,
    // 域名部署
    'url_domain_deploy'      => true,
    // 域名根，如thinkphp.cn
    'url_domain_root'        => '',
    // 是否自动转换URL中的控制器和操作名
    'url_convert'            => true,
    // 默认的访问控制器层
    'url_controller_layer'   => 'controller',
    // 表单请求类型伪装变量
    'var_method'             => '_method',
    // 表单ajax伪装变量
    'var_ajax'               => '_ajax',
    // 表单pjax伪装变量
    'var_pjax'               => '_pjax',
    // 是否开启请求缓存 true自动缓存 支持设置请求缓存规则
    'request_cache'          => false,
    // 请求缓存有效期
    'request_cache_expire'   => null,
    // +----------------------------------------------------------------------
    // | 模板设置
    // +----------------------------------------------------------------------
    'template'               => [
        // 模板引擎类型 支持 php think 支持扩展
        'type'         => 'Think',
        // 模板路径
        'view_path'    => APP_PATH . '../theme/', // 主题路径

        // 模板后缀
        'view_suffix'  => 'html',
        // 模板文件名分隔符
        'view_depr'    => DS, //'.',
        // 模板引擎普通标签开始标记
        'tpl_begin'    => '{',
        // 模板引擎普通标签结束标记
        'tpl_end'      => '}',
        // 标签库标签开始标记
        'taglib_begin' => '{',
        // 标签库标签结束标记
        'taglib_end'   => '}',
    ],

//    // 前台主题模板配置
//    'home' => [
//        // 模快名称
//        'model_name' =>'home',
//        // 默认模板文件名称
//        'default_template' => 'default',       // 这里可以切换模块下的默认模板名称
//    ],
//
//    // 后台主题模板配置
//    'admin'=>[
//        // 模快名称
//        'model_name' =>'admin',
//        // 默认模板文件名称
//        'default_template' =>'default',        // 这里可以切换模块下的默认模板名称
//    ],
//
//    // 商家主题模板配置
//    'business'=>[
//        // 模快名称
//        'model_name' =>'business',
//        // 默认模板文件名称
//        'default_template' =>'default',        // 这里可以切换模块下的默认模板名称
//    ],
//
//    // 微信主题模板配置
//    'wechat'=>[
//        // 模快名称
//        'model_name' =>'wechat',
//        // 默认模板文件名称
//        'default_template' =>'default',        // 这里可以切换模块下的默认模板名称
//    ],

    // 视图输出字符串内容替换
    'view_replace_str'       => [],
    // 默认跳转页面对应的模板文件
    'dispatch_success_tmpl'  => THINK_PATH . 'tpl' . DS . 'dispatch_jump.tpl',
    'dispatch_error_tmpl'    => THINK_PATH . 'tpl' . DS . 'dispatch_jump.tpl',
    // +----------------------------------------------------------------------
    // | 异常及错误设置
    // +----------------------------------------------------------------------
    // 异常页面的模板文件
    'exception_tmpl'         => THINK_PATH . 'tpl' . DS . 'think_exception.tpl',
    // 错误显示信息,非调试模式有效
    'error_message'          => '页面错误！请稍后再试～',
    // 显示错误信息
    'show_error_msg'         => false,
    // 异常处理handle类 留空使用 \think\exception\Handle
//    'exception_handle'       => '',
    'exception_handle'       => 'app\lib\exception\ExceptionHandler',
    // +----------------------------------------------------------------------
    // | 日志设置
    // +----------------------------------------------------------------------
    'log'                    => [
        // 日志记录方式，内置 file socket 支持扩展
        'type'        => 'File',
//        'type'  => 'axios\\tpr\\driver\\LogMongodb',// 利用mongodb记录日志 可考虑使用
        // 日志保存目录
        'path'        => LOG_PATH,
        // 日志记录级别 log,error,info,sql,notice,alert,debug
        'level'       => ['error','log','sql','notice','alert','debug'],
        // error和sql日志单独记录
        'apart_level' => ['error', 'sql'],
//        'apart_level' => [\think\Env::get('log.database')], // 利用mongodb记录日志 可考虑使用
    ],
    // +----------------------------------------------------------------------
    // | Trace设置 开启 app_trace 后 有效
    // +----------------------------------------------------------------------
    'trace'                  => [
        // 内置Html Console 支持扩展
        'type' => 'Html',
    ],
    // +----------------------------------------------------------------------
    // | 缓存设置
    // +----------------------------------------------------------------------
    'cache'                  => [
        // 驱动方式
        'type'   => 'File',
        // 缓存保存目录
        'path'   => CACHE_PATH,
        // 缓存前缀
        'prefix' => '',
        // 缓存有效期 0表示永久缓存
        'expire' => 0,
    ],
    // +----------------------------------------------------------------------
    // | 会话设置
    // +----------------------------------------------------------------------
    'session'                => [
        'id'             => '',
        // SESSION_ID的提交变量,解决flash上传跨域
        'var_session_id' => '',
        // SESSION 前缀
        'prefix'         => 'think',
        // 驱动方式 支持redis memcache memcached
        'type'           => '',
        // 是否自动开启 SESSION
        'auto_start'     => true,
    ],
    // +----------------------------------------------------------------------
    // | Cookie设置
    // +----------------------------------------------------------------------
    'cookie'                 => [
        // cookie 名称前缀
        'prefix'    => '',
        // cookie 保存时间
        'expire'    => 0,
        // cookie 保存路径
        'path'      => '/',
        // cookie 有效域名
        'domain'    => '',
        //  cookie 启用安全传输
        'secure'    => false,
        // httponly设置
        'httponly'  => '',
        // 是否使用 setcookie
        'setcookie' => true,
    ],
    //分页配置
    'paginate'               => [
        'type'      => 'bootstrap',
        'var_page'  => 'page',
        'list_rows' => 15,
    ],

    //以下数据请不要修改
    'PSD_VERIFY' => '35hEwFkse5kgv', //密码附加码
    'PS_ENTERPRISE' =>'云纪念',


    //风格选项
    'HallStyle'   => [
        1 => '怀旧',
        2 => '文艺',
        3 => '浪漫',
        4 => '现代',
        5 => '动漫',
    ],
    //民族
    'ethnic' =>[
        1=>'汉族',2=>'回族',3=>'藏族',4=>'维吾尔族',5=>'苗族',6=>'彝族',7=>'壮族',8=>'布依族',9=>'朝鲜族',10=>'满族',11=>'侗族',12=>'瑶族',13=>'白族',14=>'土家族',15=>'哈尼族',16=>'哈萨克族',17=>'傣族',18=>'黎族',19=>'僳僳族',20=>'佤族',21=>'畲族',22=>'高山族',23=>'拉祜族',24=>'水族',25=>'东乡族',26=>'纳西族',27=>'景颇族',28=>'柯尔克孜族',29=>'土族',30=>'达斡尔族',31=>'仫佬族',32=>'羌族',33=>'布朗族',34=>'撒拉族',35=>'毛南族',36=>'仡佬族',37=>'锡伯族',38=>'阿昌族',39=>'普米族',40=>'塔吉克族',41=>'怒族',42=>'乌孜别克族',43=>'俄罗斯族',44=>'鄂温克族',45=>'德昂族',46=>'保安族',47=>'裕固族',48=>'京族',49=>'塔塔尔族',50=>'独龙族',51=>'鄂伦春族',52=>'赫哲族',53=>'门巴族',54=>'珞巴族',55=>'基诺族',56=>'蒙古族',
    ],

    // 纪念关系
    'relationship' => [
        1 => '纪念姐妹', 2 => '纪念兄弟', 3 => '纪念妻子', 4 => '纪念祖母', 5 => '纪念祖父', 6 => '纪念外婆', 7 => '纪念外公', 8 => '纪念先祖', 9 => '纪念父亲', 10 => '纪念母亲', 11 => '纪念父母', 12 => '纪念亲属', 13 => '纪念友人', 15 => '纪念同学', 16 => '纪念老师', 17 => '纪念同事', 18 => '纪念战友', 19 => '纪念儿子',20 => '纪念女儿', 21 => '纪念丈夫', 22 => '纪念岳父', 23 => '纪念岳母', 24 => '纪念幼儿', 25 => '普通市民', 26 => '纪念伯父', 27 => '纪念伯母', 28 => '纪念叔叔', 29 => '纪念婶婶', 30 => '纪念姨夫', 31 => '纪念姨妈', 32 => '纪念烈士', 33 => '纪念姑姑', 34 => '纪念姑妈',
    ],

];
