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

namespace app\common\controller;

use app\api\model\AppVersion;
use app\api\model\MemberModel;
use app\api\service\LoginService;
use Endroid\QrCode\QrCode;
use think\Controller;
use think\Cookie;
use think\Session;
use think\Request;
use think\Config;
use think\Cache;
use think\Env;
use think\Db;

/**
 * 前端基类
 * Class HomeBase
 * @package app\common\controller
 * @author andy <290648237@qq.com>
 * @date 2017/6/14
 */
class HomeBase extends Controller{
    protected $param;

    protected $user;

    protected $themes;

    protected $template_dir;

    protected $method;

    protected $menu;

    protected $menu_path;

    protected $footerMenu;

    protected $footerMenuPath;

    protected $aboutSideMenu;

    protected $aboutSideMenuPath;

    protected $debug;

    protected $config;

    protected $windowEnv; // js 全局变量设置

    protected $action = ''; // 页面body元素的id值

    protected $module = ''; // 页面module

    protected $androidAppUrl = ''; // Android App 下载url

    function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->config = Config::get('setting.home');
        $this->param = $request->param();
        $this->method = $request->method();

        // TODO 初始化检查登录状态
        if (empty(\session('user_auth'))) {
            $session = get_redis_session();

//            dump($session);
//            dump(\session('user_auth'));
//            dump($_SESSION);die;
            if ($session && !empty($session['is_login'])) {
                // success 写入session cookie
                $user = MemberModel::self()->findUser($session['member_id']);
                // TODO 登录成功 执行api登录 保存token供接口调用
                $result = LoginService::login($user);
                $resUser = MemberModel::self()->findUser($user['member_id']);

                $resUser['member_token'] = $result['member_token'];

                session('user_auth', $resUser);
                cookie('user_auth', $resUser, 60*60*24*7);
            }else {
                // fail 删除session cookie
                session('user_auth', null);
                cookie('user_auth', null);
//            session_unset();
//            session_destroy();
            }
        }else {
            // session不为空 判断session是否正确
            $session = get_redis_session();
            if ($session['member_id'] != \session('user_auth')['member_id']) {
                // session不正确 删除session cookie
                session('user_auth', null);
                cookie('user_auth', null);
            }
        }


        $this->user = user_info();

        // 获取访问url路径
        $requesPath = explode('/', $this->request->path());
        if(empty($requesPath[0]) && empty($requesPath[1])) {
            // 首页
            $module = 'index';
            $action = 'index';
        }else if(!empty($requesPath[0]) && empty($requesPath[1])) {
            // 栏目页首页
            $module = $requesPath[0];
            $action = 'index';
        }else {
            // 栏目详情页
            $module = $requesPath[0];
            $action = $requesPath[1];
        }

        $this->module = $module;
        $this->action = $action;

        $this->assign('module', $module); // 页面中的模型名称
        $this->assign('action', $action); // 页面中的控制器名称

        // TODO 顶部公共菜单和底部公共菜单
        if(Env::get("debug.status")){
            // 顶部导航菜单
            $this->makeMenuTree(2,$this->menu);
            Cache::set('menu',$this->menu,3600);
            $this->makePathMenu();
            Cache::set('path_menu',$this->menu_path,3600);

            // 底部导航菜单
            $this->makeMenuTree(11,$this->footerMenu);
            Cache::set('footer_menu',$this->footerMenu,3600);
            $this->makePathMenu();
            Cache::set('path_footer_menu',$this->footerMenuPath,3600);

            // 关于我们侧边栏导航菜单
            $this->makeMenuTree(32,$this->aboutSideMenu);
            Cache::set('about_side_menu',$this->aboutSideMenu,3600);
            $this->makePathMenu();
            Cache::set('path_about_side_menu',$this->aboutSideMenuPath,3600);
        }else{

            // 顶部导航菜单
            $this->menu = Cache::get("menu");
            if(empty($this->menu)){
                $this->makeMenuTree(2,$this->menu);
                Cache::set('menu',$this->menu,3600);
            }

            $this->menu_path = Cache::get("path_menu");
            if(empty($this->menu_path)){
                $this->makePathMenu();
                Cache::set('path_menu',$this->menu_path,3600);
            }

            // 底部导航菜单
            $this->footerMenu = Cache::get("footer_menu");
            if(empty($this->footerMenu)) {
                $this->makeMenuTree(11, $this->footerMenu);
                Cache::set('footer_menu', $this->footerMenu, 3600);
            }

            $this->footerMenuPath = Cache::get("path_footer_menu");
            if (empty($this->footerMenuPath)) {
                $this->makePathMenu();
                Cache::set('path_footer_menu', $this->footerMenuPath, 3600);
            }

            // 关于我们侧边栏导航菜单
            $this->aboutSideMenu = Cache::get("about_side_menu");
            if(empty($this->aboutSideMenu)) {
                $this->makeMenuTree(32, $this->aboutSideMenu);
                Cache::set('about_side_menu', $this->aboutSideMenu, 3600);
            }

            $this->footerMenuPath = Cache::get("path_about_side_menu");
            if (empty($this->aboutSideMenuPath)) {
                $this->makePathMenu();
                Cache::set('path_about_side_menu', $this->aboutSideMenuPath, 3600);
            }

        }

//        dump($this->aboutSideMenuPath);die;



        // 如果在控制器中没有自定义主题 则使用下面的设置
        if(!$this->themes) {
            // 设置PC端模板
            $this->themes = 'default';

            // 设置手机模板
//            if($this->request->isMobile()) {
//                // 手机端模板
//                $this->themes = 'mobile';
//            }
        }

        $this->theme(); //模板初始化

        $this->assign('title',isset($this->menu_path[$this->request->path()]['title'])?$this->menu_path[$this->request->path()]['title']:"");
        $this->assign('menu',$this->menu);
        $this->assign('footerMenu',$this->footerMenu);
        $this->assign('aboutSideMenu',$this->aboutSideMenu);
    }

    /**
     * 设置js全局变量
     * @param $data
     */
    public function setValueInEnv($data){
        foreach($data as $k => $v){
            $this->windowEnv[$k] = $v;
        }
        $this->assign('windowEnv',json_encode($this->windowEnv,JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK));
    }

    /**
     * ajax 返回
     * @param int $result
     * @param array $data
     * @param string $msg
     * @return mixed
     */
    protected function response($result = 0, $data = [], $msg = ''){
        return json(['result' => $result, 'data' => $data, 'msg' => $msg]);
    }

    protected function makeMenuTree($parent_id=0,&$parent_menu=[],$all=false){
        $db = Db::name("site_column")->alias('menu')->where('menu.pid',$parent_id);
        if(!$all){
            $db->where('status',1);
        }

        $menu = $db->order('sort asc')->select();
        foreach ($menu as $m){
            $parent_menu[$m['id']] = $m;
            $this->makeMenuTree($m['id'],$parent_menu[$m['id']]['sub'],$all);
        }
        return $menu;
    }

    private function makePathMenu(){
        $menu = Db::name("site_column")->where('pid','neq',0)->order('sort asc')->select();
        foreach ($menu as $m){
            $key = strval($m['url']);
            $this->menu_path[$key] = $m;
        }
        return $menu;
    }


    /*模板相关*/
    protected function theme(){

        $uid = 0;
//        $logoutHash = '';
        if ($this->user) {
            $uid = $this->user['member_id'];
//            $logoutHash = session('logout_hash');
        }

//        $this->assign('logoutHash', $logoutHash);

        $this->assign('uid', $uid);
        $this->assign('user', $this->user);
        $this->windowEnv['UID'] = $uid;
        $this->windowEnv['token'] = !empty($this->user) ? $this->user['member_token'] : '';
        $this->windowEnv['domain'] = Env::get('web.host');

        $keyword = $this->request->param('keyword', '');
        $this->assign('keyword', $keyword);

        $this->assign('windowEnv',json_encode($this->windowEnv));

        // 获取Android APP最新下载地址并生成二维码
        $downloadUrl = '';
        $latestVersion = AppVersion::getLatestVersion();
        if ($latestVersion && isset($latestVersion['url'])) {
            // 有最新版本 生成二维码图片
            $downloadUrl = $latestVersion['url'];
        }
        $this->androidAppUrl = $downloadUrl;
        $this->assign('androidAppUrl', $downloadUrl);

        $this->assign('web_title', sysconf('web_title'));
        $this->assign('seo_title', sysconf('seo_title'));
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

    }

    protected function fetch($template = '', $vars = [], $replace = [], $config = [])
    {
        if($template == '') {
            // 如果传入的模板为空则调用当前action方法
            $template = strtolower($this->request->action());
        }
        $this->template_dir = $this->themes.":".strtolower($this->request->module()).":".strtolower($this->request->controller()).":".$template;
        $config['view_path'] = Config::get("template.view_path") . $this->themes . "/";

        return parent::fetch($this->template_dir, $vars, $replace, $config); // TODO: Change the autogenerated stub
    }

    public function _empty(){
        echo __FUNCTION__;
        return "the function not exits";
    }

    public function __destruct()
    {
        // TODO: Implement __destruct() method.
        Session::set('last_url',$this->request->url());
    }
}