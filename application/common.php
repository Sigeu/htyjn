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

use app\admin\model\NodeModel;
use app\business\model\NodeModel as BnodeModel;
use app\admin\service\DataService;
use think\Db;
use think\Cookie;
use Wechat\Loader;

/**
 * RBAC节点权限验证 
 * 后台相关的权限验证函数
 * @param string $node
 * @return bool
 */
function auth($node) {
    return NodeModel::checkAuthNode($node);
}

function b_auth($node) {
    return BnodeModel::checkAuthNode($node);
}

/**
 * 设备或配置系统参数
 * @param string $name 参数名称
 * @param bool $value 默认是false为获取值，否则为更新
 * @return string|bool
 */
function sysconf($name, $value = false) {
    static $config = [];
    if ($value !== false) {
        $config = [];
        $data = ['name' => $name, 'value' => $value];
        return DataService::save('SystemConfig', $data, 'name');
    }
    if (empty($config)) {
        foreach (Db::name('SystemConfig')->select() as $vo) {
            $config[$vo['name']] = $vo['value'];
        }
    }
    return isset($config[$name]) ? $config[$name] : '';
}



/**
 * 打印输出数据到文件
 * @param mixed $data
 * @param bool $replace
 * @param string|null $pathname
 */
function p($data, $replace = false, $pathname = null)
{
    is_null($pathname) && $pathname = RUNTIME_PATH . date('Ymd') . '.txt';
    $str = (is_string($data) ? $data : (is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true)) . "\n";
    $replace ? file_put_contents($pathname, $str) : file_put_contents($pathname, $str, FILE_APPEND);
}

/* TODO 函数后台、微信有用到 */
/**
 * 获取微信操作对象
 *
 * @param string $type
 * @return \Wechat\WechatReceive|\Wechat\WechatUser|\Wechat\WechatPay|\Wechat\WechatScript|\Wechat\WechatOauth|\Wechat\WechatMenu|\Wechat\WechatMedia
 */
function & load_wechat($type = '')
{
    static $wechat = [];
    $index = md5(strtolower($type));
    if (!isset($wechat[$index])) {
        $config = [
            'token'          => sysconf('wechat_token'),
            'appid'          => sysconf('wechat_appid'),
            'appsecret'      => sysconf('wechat_appsecret'),
            'encodingaeskey' => sysconf('wechat_encodingaeskey'),
            'mch_id'         => sysconf('wechat_mch_id'),
            'partnerkey'     => sysconf('wechat_partnerkey'),
            'ssl_cer'        => sysconf('wechat_cert_cert'),
            'ssl_key'        => sysconf('wechat_cert_key'),
            'cachepath'      => CACHE_PATH . 'wxpay' . DS,
        ];

        $wechat[$index] = Loader::get($type, $config);
    }
    return $wechat[$index];
}

/**
 * 获取微信商户操作对象
 * TODO 根据不同商家微信信息设置"$config"参数值，
 * @param string $type
 * @return \Wechat\WechatReceive|\Wechat\WechatUser|\Wechat\WechatPay|\Wechat\WechatScript|\Wechat\WechatOauth|\Wechat\WechatMenu|\Wechat\WechatMedia
 */
function & load_merchant_wechat($type = '', $merchantId = '')
{
    static $wechat = [];
    $index = md5(strtolower($type));
    if (!isset($wechat[$index])) {
        // 根据商家ID获取商家微信信息 如：token appid appsecret mch_id partnerkey等
        $mchWechatData = []; // 初始化商家微信信息

        if ($merchantId) {
            // 如果有商家ID传入 则获取商家微信信息
            $mchWechatData = ''; // TODO 查询商家表 返回商家微信信息字段
        }

        $config = [
            'token'          => $mchWechatData['wechat_token'],
            'appid'          => $mchWechatData['wechat_appid'],
            'appsecret'      => $mchWechatData['wechat_appsecret'],
            'encodingaeskey' => $mchWechatData['wechat_encodingaeskey'],
            'mch_id'         => $mchWechatData['wechat_mch_id'],
            'partnerkey'     => $mchWechatData['wechat_partnerkey'],
            'ssl_cer'        => $mchWechatData['wechat_cert_cert'],
            'ssl_key'        => $mchWechatData['wechat_cert_key'],
            'cachepath'      => CACHE_PATH . 'mchwxpay' . DS,
        ];

        $wechat[$index] = Loader::get($type, $config);
    }
    return $wechat[$index];
}

/**
 * 安全URL编码
 * @param array|string $data
 * @return string
 */
function encode($data) {
    return str_replace(['+', '/', '='], ['-', '_', ''], base64_encode(serialize($data)));
}

/**
 * 安全URL解码
 * @param string $string
 * @return string
 */
function decode($string) {
    $data = str_replace(['-', '_'], ['+', '/'], $string);
    $mod4 = strlen($data) % 4;
    !!$mod4 && $data .= substr('====', $mod4);
    return unserialize(base64_decode($data));
}
/* TODO 函数后台、微信有用到 */







/* api 开发 函数 */
// 应用公共文件
function is_user_login(){
    $user = \think\Session::has('user_auth');
    return  empty($user) ? false:true;
}
function user_info(){
    $user = \think\Session::get('user_auth');
    return $user;
}

//function user_info(){
//    $user = \app\api\model\MemberModel::self()->findUser(1);
//    return $user;
//}

function user_current_id(){
    $user = user_info();
    return $user['member_id'];
}
function getLastUrl(){
    return \think\Session::get('last_url');
}
function make_password($password,$auth = ''){
    // TODO 密码加密与shopnc一致 都使用MD5加密
    return md5(trim($password));
//    return md5($auth.$password);
}
function trans($message){
    return \axios\tpr\service\LangService::trans($message);
}
function makeAppVersion($app,$update_type,$version_type="release"){
    $temp_base = $app['base_version'];
    if(!empty($app['last_version'])){
        list($temp_main,$temp_next,$temp_debug) = explode(".",$app['last_version']);
    }else{
        $temp_main = $temp_base;
        $temp_next = 0;
        $temp_debug = 0;
    }
    $main = $temp_main;$next = 0;$debug=0;
    switch ($update_type){
        case 2:
            $main = ++$app['base_version'];
            break;
        case 1:
            $next = ++$temp_next;
            break;
        case 0:
            $next = $temp_next;
            $debug = ++$temp_debug;
            break;
    }
    return makeVersion($main,$next,$debug,$version_type);
}
function makeVersion($main,$next="0",$debug="0",$type="release")
{
    return $main . "." . $next . "." . $debug . "." . date("ymd") . "_" . $type;
}
function domain(){
    $domain = \axios\tpr\service\EnvService::get('web.host');
    $last_str = substr($domain,-1);
    if($last_str!= "/"){
        $domain .= "/";
    }
    return $domain;
}





////////////// andy 自定义函数 //////////////

if (!function_exists('get_banner')) {
    /**
     * 调取轮播Item返回数组
     * @param int $banner_id 轮播位置ID
     * @param int $limit 限制轮播Item条数
     * @param string $sort 排序规则
     * @return array|false|PDOStatement|string|\think\Collection|\think\Model
     * @author andy <290648237@qq.com>
     */
    function get_banner($banner_id = 0, $limit = 1, $sort = 'rand()'){

        $map['BannerItem.status'] = 1;
        if($banner_id) {
            $map['BannerItem.banner_id'] = $banner_id;
        }

        $db = Db::view('BannerItem', '*')
            ->view('Banner', 'name, status', 'Banner.id = BannerItem.banner_id', 'RIGHT')
            ->where($map)
            ->order($sort);

        if($limit > 1) {
            $ad = $db->limit($limit)->select();
        }else {
            $ad = $db->find();
        }

        return $ad;
    }
}

if (!function_exists('get_ad')) {
    /**
     * 调取广告返回数组
     * @param int $position_id 广告位id
     * @param int $limit 限制广告条数
     * @param string $sort 排序规则
     * @return array|false|PDOStatement|string|\think\Collection|\think\Model
     * @author andy <290648237@qq.com>
     */
    function get_ad($position_id = 0, $limit = 1, $sort = 'rand()'){

        
		$map = [
			'Ad.status' => 1,
			'Ad.end_time' => ['gt', date('Y-m-d', time())]
		];
        if($position_id) {
            $map['Ad.position_id'] = $position_id;
        }

        $db = Db::view('Ad', 'id, name, url, path, start_time, end_time, status, sort')
            ->view('AdPosition', 'position, width, height, status', 'AdPosition.id=Ad.position_id', 'RIGHT')
            ->where($map)
            ->order($sort);

        if($limit > 1) {
            $ad = $db->limit($limit)->select();
            if($ad) {
                foreach ($ad as $item) {
                    if (!is_file('.'.$item['path'])) {
                        $item['path'] = quick_pic_thumb($item['path'], '@'.$item['width'].'w_'.$item['height'].'h');
                    }
                }
            }
        }

        $ad = $db->find();
        if($ad && !is_file('.'.$ad['path'])) {
            $ad['path'] = quick_pic_thumb($ad['path'], '@'.$ad['width'].'w_'.$ad['height'].'h');
        }

        return $ad;
    }
}


if (!function_exists('get_ad_html')) {
    /**
     * 调取广告返回HTML
     * @param int $position_id 广告位id
     * @param int $limit 限制广告条数
     * @return null|string
     * @author andy <290648237@qq.com>
     */
    function get_ad_html($position_id,$limit = 1){
        $ad = get_ad($position_id,$limit);

        if($ad != NULL){
            return '<a href="'.$ad['url'].'" target="_blank" rel="nofollow"><img src="'.$ad['path'].'" width="'.$ad['width'].'" height="'.$ad['height'].'" /></a>';
        }else{
            return NULL;
        }
    }
}

if (!function_exists('format_bytes')) {
    /**
     * 格式化字节大小
     * @param  number $size      字节数
     * @param  string $delimiter 数字和单位分隔符
     * @return string            格式化后的带单位的大小
     * @author andy <290648237@qq.com>
     */
    function format_bytes($size, $delimiter = '') {
        $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
        for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
        return round($size, 2) . $delimiter . $units[$i];
    }
}



if (!function_exists('msubstr')) {
    /**
     * 截取中文字符串
     * 模板调用 {$str|msubstr=0,46}
     * @param $str
     * @param int $start
     * @param int $length
     * @param bool $suffix
     * @param string $charset
     * @return string
     * @author andy <290648237@qq.com>
     */
    function msubstr($str, $start=0, $length, $suffix=true, $charset="utf-8"){
        if(mb_strlen($str,$charset)>$length)
        {
            if(function_exists("mb_substr")){
                if($suffix)
                    return mb_substr($str, $start, $length, $charset)."...";
                else
                    return mb_substr($str, $start, $length, $charset);
            }elseif(function_exists('iconv_substr')) {
                if($suffix)
                    return iconv_substr($str,$start,$length,$charset)."...";
                else
                    return iconv_substr($str,$start,$length,$charset);
            }
            $re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
            $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
            $re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
            $re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
            preg_match_all($re[$charset], $str, $match);
            $slice = join("",array_slice($match[0], $start, $length));
            if($suffix) return $slice."…";
            return $slice;
        }
        else
        {
            return $str;
        }
    }
}

if (!function_exists('send_mail')) {
    /**
     * 系统邮件发送函数
     * @param string $tomail 接收邮件者邮箱
     * @param string $name 接收邮件者名称
     * @param string $subject 邮件主题
     * @param string $body 邮件内容
     * @param string $attachment 附件列表
     * @return boolean
     * @author andy <290648237@qq.com>
     */
    function send_mail($tomail, $name, $subject = '', $body = '', $attachment = null) {
        $mail = new \PHPMailer();           //实例化PHPMailer对象

        $mail->CharSet = 'UTF-8';           //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
        $mail->IsSMTP();                    // 设定使用SMTP服务
        $mail->SMTPDebug = 0;               // SMTP调试功能 0=关闭 1 = 错误和消息 2 = 消息
        $mail->SMTPAuth = true;             // 启用 SMTP 验证功能
        $mail->SMTPSecure = 'ssl';          // 使用安全协议
        $mail->Host = sysconf('smtp_host'); // SMTP 服务器
        $mail->Port = sysconf('smtp_port');                  // SMTP服务器的端口号
        $mail->Username = sysconf('smtp_username');    // SMTP服务器用户名
        $mail->Password = sysconf('smtp_password');     // SMTP服务器密码
        $mail->SetFrom(sysconf('smtp_username'), sysconf('smtp_sender_name'));
        $replyEmail = '';                   //留空则为发件人EMAIL
        $replyName = '';                    //回复名称（留空则为发件人名称）
        $mail->AddReplyTo($replyEmail, $replyName);
        $mail->Subject = $subject;
        $mail->MsgHTML($body);
        $mail->AddAddress($tomail, $name);

        if (is_array($attachment)) { // 添加附件
            foreach ($attachment as $file) {
                is_file($file) && $mail->AddAttachment($file);
            }
        }
        return $mail->Send() ? true : $mail->ErrorInfo;
    }
}

if (!function_exists('request_post')) {
    /**
     * ajax 采集列表
     * @param string $url 请求的url
     * @param array $post_data 提交的数据
     * @return bool|mixed
     * @author andy <290648237@qq.com>
     */
    function request_post($url = '', $post_data = array()) {
        if (empty($url) || empty($post_data)) {
            return false;
        }

        $o = "";
        foreach ( $post_data as $k => $v )
        {
            $o.= "$k=" . urlencode( $v ). "&" ;
        }
        $post_data = substr($o,0,-1);

        $postUrl = $url;
        $curlPost = $post_data;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$postUrl);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }
}

if (!function_exists('get_image')) {
    /**
     * 采集图片到本地
     * @param $url
     * @param string $save_dir
     * @param string $filename
     * @param int $type
     * @return array
     * @author andy <290648237@qq.com>
     */
    function get_image($url,$save_dir='',$filename='',$type=0){
        if(trim($url)==''){
            return array('file_name'=>'','save_path'=>'','error'=>1);
        }
        if(trim($save_dir)==''){
            $save_dir='/';
        }
        if(trim($filename)==''){//保存文件名
            $ext=strrchr($url,'.');
            if($ext!='.gif'&&$ext!='.jpg'&&$ext!='.png'&&$ext!='.jpeg'){
                return array('file_name'=>'','save_path'=>'','error'=>3);
            }
            $filename=time().rand(0,10000).$ext;
        }
        if(0!==strrpos($save_dir,'/')){
            $save_dir.='/';
        }
        //创建保存目录
        if(!file_exists('.'.$save_dir)&&!mkdir('.'.$save_dir,0777,true)){
            return array('file_name'=>'','save_path'=>'','error'=>5);
        }
        //获取远程文件所采用的方法
        if($type){
            $ch=curl_init();
            $timeout=5;
            curl_setopt($ch,CURLOPT_URL,$url);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);
            $img=curl_exec($ch);
            curl_close($ch);
        }else{
            ob_start();
            readfile($url);
            $img=ob_get_contents();
            ob_end_clean();
        }
        //$size=strlen($img);
        //文件大小
        $fp2=@fopen('.'.$save_dir.$filename,'a');
        fwrite($fp2,$img);
        fclose($fp2);
        unset($img,$url);
        return array('file_name'=>$filename,'save_path'=>$save_dir.$filename,'error'=>0);
    }
}

if (!function_exists('admin_md5')) {
    /**
     * 后台MD5加密算法
     * @param string $password 密码
     * @return string
     * @author andy <290648237@qq.com>
     */
    function admin_md5($password){
        return md5(substr(md5(substr(md5($password),5,30).config("PSD_VERIFY")),2,25).config("PS_ENTERPRISE"));
    }
}

if (!function_exists('get_level_data')) {
    /**
     * 获取联动数据
     * @param string $table 表名
     * @param  integer $pid 父级ID
     * @param  string $pid_field 父级ID的字段名
     * @return false|PDOStatement|string|\think\Collection
     * @author andy <290648237@qq.com>
     */
    function get_level_data($table = '', $pid = 0, $pid_field = 'pid')
    {

        if ($table == '') {
            return '';
        }

        $data_list = Db::name($table)->where($pid_field, $pid)->select();

        if ($data_list) {
            return $data_list;
        } else {
            return '';
        }
    }
}

if (!function_exists('get_level_pid')) {
    /**
     * 获取联动等级和父级id
     * @param string $table 表名
     * @param int $id 主键值
     * @param string $id_field 主键名
     * @param string $pid_field pid字段名
     * @return mixed
     * @author andy <290648237@qq.com>
     */
    function get_level_pid($table = '', $id = 1, $id_field = 'id', $pid_field = 'pid')
    {
        return Db::name($table)->where($id_field, $id)->value($pid_field);
    }
}

if (!function_exists('get_level_key_data')) {
    /**
     * 反向获取联动数据
     * @param string $table 表名
     * @param string $id 主键值
     * @param string $id_field 主键名
     * @param string $name_field name字段名
     * @param string $pid_field pid字段名
     * @param int $level 级别
     * @return array
     * @author andy <290648237@qq.com>
     */
    function get_level_key_data($table = '', $id = '', $id_field = 'id', $name_field = 'name', $pid_field = 'pid', $level = 1)
    {
        $result = [];
        $level_pid = get_level_pid($table, $id, $id_field, $pid_field);
        $level_key[$level] = $level_pid;
        $level_data[$level] = get_level_data($table, $level_pid, $pid_field);

        if ($level_pid != 0) {
            $data = get_level_key_data($table, $level_pid, $id_field, $name_field, $pid_field, $level + 1);
            $level_key = $level_key + $data['key'];
            $level_data = $level_data + $data['data'];
        }
        $result['key'] = $level_key;
        $result['data'] = $level_data;

        return $result;
    }
}



/**
 * 获取网站的根Url
 * @return string
 */
function get_root_url() {
    $request = request();
    $base = $request->root();
    $root = strpos($base, '.') ? ltrim(dirname($base), DS) : $base;
    if ('' != $root) {
        $root = '/' . ltrim($root, '/');
    }

    return ($request->isSsl() ? 'https' : 'http') . '://' . $request->host() . "{$root}";
}

/**
 * 获取带有域名的完整路径
 * @param $path
 * @return string
 */
function get_url_with_domain($path) {

    $isContainsDomain = url_contains_domain($path);
    $isContainsIp = url_contains_ip($path);
    if ($path == '' || $isContainsDomain || $isContainsIp) {
        // 包含域名
        return $path;
    }else {
        // 不包含域名 加上域名
        return get_root_url().$path;
    }
}

/**
 * 判断url是否包含域名
 * @param $url
 * @return mixed
 */
function url_contains_domain($url) {
    preg_match("/^(http:\/\/)?([^\/]+)/i", $url, $result);

    return $result;
}

/**
 * 判断url是否包含ip地址或ip+端口
 * @param $url
 * @return bool|int
 */
function url_contains_ip($url) {
    preg_match("/^(http:\/\/)?([^\/]+)/i", $url, $result);
    if(isset($result[2])) {
        $match = preg_match("/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|[0-9]{1,3}$/", $result[2]);
        return $match;
    }else {
        return false;
    }


}


/**
 * 判断是否是手机
 * @return bool
 */
function is_mobile() {
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset($_SERVER['HTTP_X_WAP_PROFILE']))
        return true;
    //此条摘自TPM智能切换模板引擎，适合TPM开发
    if (isset($_SERVER['HTTP_CLIENT']) && 'PhoneClient' == $_SERVER['HTTP_CLIENT'])
        return true;
    //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset($_SERVER['HTTP_VIA']))
        //找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
    //判断手机发送的客户端标志,兼容性有待提高
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array(
            'nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile'
        );
        //从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    //协议法，因为有可能不准确，放到最后判断
    if (isset($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}

/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 */
function is_login()
{
    $user = session('user_auth') ? session('user_auth') : cookie('user_auth');

    if (empty($user)) {
        return '';
    } else {
        return $user['member_id'];
    }
}

//function is_login()
//{
//    $user = \app\api\model\MemberModel::self()->findUser(1);
//    return $user['member_id'];
//}

/**
 * 数据签名认证
 * @param  array $data 被认证的数据
 * @return string       签名
 */
function data_auth_sign($data)
{
    //数据类型检测
    if (!is_array($data)) {
        $data = (array)$data;
    }
    $data = array_filter($data);
    ksort($data); //排序

    $code = serialize($data); //url编码并生成query字符串
    $sign = sha1($code); //生成签名

    return $sign;
}


/**
 * 系统非常规MD5加密方法
 * @param  string $str 要加密的字符串
 * @return string
 */
function think_ucenter_md5($str, $key = 'think_center')
{
    return '' === $str ? '' : md5(sha1($str) . $key);
}

/**
 * 正则表达式验证email格式
 *
 * @param string $str 所要验证的邮箱地址
 * @return boolean
 */
function check_is_email($str)
{
    if (!$str) {
        return false;
    }
    return preg_match('#[a-z0-9&\-_.]+@[\w\-_]+([\w\-.]+)?\.[\w\-]+#is', $str) ? true : false;
}

/**
 * 用正则表达式验证手机号码(中国大陆区)
 * @param integer $num 所要验证的手机号
 * @return boolean
 */
function check_is_mobile($num)
{
    if (!$num) {
        return false;
    }
    return preg_match('#^13[\d]{9}$|14^[0-9]\d{8}|^15[0-9]\d{8}$|^18[0-9]\d{8}$#', $num) ? true : false;
}

/**
 * 获取当前页面完整URL地址
 */
function get_url() {
    $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
    $php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
    $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
    $relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
    return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
}

/**
 * 获取文件后缀
 * @param $file
 * @return mixed
 */
function get_extension($file) {
    $res = explode('.', $file);
    return array_pop($res);
}

/* 读取文件后缀并删除带问号后面的字符串 */
function get_extension2($file) {
    $res = explode('.', $file);
    $res = array_pop($res);
    $domain = strstr($res, '?');
    if ($domain) {
        $st = strpos($res, "?");
        $res = substr($res, 0, $st);
    }
    return $res;
}

/**
 * 公共分页函数
 * @param array $settings
 * @return string
 */
function pagination($settings = []) {
    $settings = [
        'page_total' => $settings['page_total'],
        'base_url' => isset($settings['base_url']) ? $settings['base_url'] : 'news/column',
        'cid_field' => isset($settings['cid_field']) ? $settings['cid_field'] : 'cid',
        'cid_value' => isset($settings['cid_value']) ? $settings['cid_value'] : 0,
        'page_field' => isset($settings['page_field']) ? $settings['page_field'] : 'page',
        'page_value' => isset($settings['page_value']) ? $settings['page_value'] : 1,
    ];

    $category_id = $settings['cid_value'];
    $page = $settings['page_value'];
    $pageTotal = $settings['page_total'];

    //分页
    $num = 7; //需要显示的最多页数
    $num = min($pageTotal, $num); //处理显示的页码数大于总页数的情况
    $end = $page + floor($num/2) <= $pageTotal ? $page + floor($num/2) : $pageTotal; //计算结束页号
    $start = $end - $num + 1; //计算开始页号
    if($start < 1) { //处理开始页号小于1的情况
        $end -= $start - 1;
        $start = 1;
    }

    $pageHtml = '<div class="page">';
    if($pageTotal > 1){
        if($page > 1) {
            $pageHtml .="<a href='".url($settings['base_url'], [$settings['cid_field'] => $category_id, $settings['page_field'] => ($page - 1)])."'>上一页</a>";
        }

        for($i = $start; $i <= $end; $i++){
            if($i == $page){
                $pageHtml .= '<span class="current">'.$i.'</span>';
            }else{
                $pageHtml .= '<a href="'.url($settings['base_url'], [$settings['cid_field'] => $category_id, $settings['page_field'] => $i]).'">'.$i.'</a>';
            }
        }

        if($page < $pageTotal) {
            $pageHtml .='<a href="'.url($settings['base_url'], [$settings['cid_field'] => $category_id, $settings['page_field'] => ($page + 1)]).'">下一页</a>';
        }
    }
    $pageHtml .= '</div>';

    return $pageHtml;
}

/**
 * 获取指定字符串之间的字符串内容
 * @param $input
 * @param $start
 * @param $end
 * @return bool|string
 */
function get_between($input, $start, $end) {
    $substr = substr($input, strlen($start)+strpos($input, $start),
        (strlen($input) - strpos($input, $end))*(-1));
    return $substr;
}

/**
 * 判断远程文件是否存在
 * @param string $url 远程文件url
 * @return bool
 */
function check_remote_file_exists($url)
{
    $curl = curl_init($url);
    // 不取回数据
    curl_setopt($curl, CURLOPT_NOBODY, true);
    // 发送请求
    $result = curl_exec($curl);
    $found = false;
    // 如果请求没有发送失败
    if ($result !== false) {
        // 再检查http响应码是否为200
        $statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($statusCode == 200) {
            $found = true;
        }
    }
    curl_close($curl);

    return $found;
}

/**
 * 过滤 post 请求参数 并返回数据库表中存在字段的参数值对象
 * @param string $table 表名称 不带前缀
 * @param array $postParams 请求参数
 * @return array
 */
function check_post_params_in_field($table, $postParams = [])
{
    $db = Db::name($table);
    $fields = $db->getTableFields(['table' => $db->getTable()]);


    $_params = [];
    foreach ($postParams as $key=>$item) {
        if (in_array($key, $fields)) {
            $_params[$key] = $item;
        }
    }
//    dump($_params);die;
    return $_params;
}

/**
 * 将ajax请求中表单中参数url转换成键值对数组
 * @param string $url 格式：&param1=value1&param2=value2&...
 * @return array
 */
function ajax_url_params_to_array($url)
{
    $resPostParams = [];

    $postParams = explode('&', urldecode($url));
    foreach ($postParams as $item) {
        $paramsItem = explode('=', $item);
        $resPostParams[$paramsItem[0]] = $paramsItem[1];
    }

    return $resPostParams;
}

function remove_empty_params($postParams = []) {

    if ($postParams) {
        foreach ($postParams as $key=>$param) {
            if ($param == '') {
                unset($postParams[$key]);
            }
        }
    }

    return $postParams;
}

/**
 * 获取汉字的首字母
 * @param string $str 汉字字符串
 * @return null|string
 */
function getinitial($str)
{
    if (empty($str)) {
        return '';
    }

    $fchar = ord($str{0});

    if ($fchar >= ord('A') && $fchar <= ord('z'))
        return strtoupper($str{0});

    $s1 = iconv('UTF-8', 'gb2312//TRANSLIT//IGNORE', $str);

    $s2 = iconv('gb2312', 'utf-8//TRANSLIT//IGNORE', $s1);

    $s = $s2 == $str ? $s1 : $str;

    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;

    if ($asc >= -20319 && $asc <= -20284)
        return 'A';

    if ($asc >= -20283 && $asc <= -19776)
        return 'B';

    if ($asc >= -19775 && $asc <= -19219)
        return 'C';

    if ($asc >= -19218 && $asc <= -18711)
        return 'D';

    if ($asc >= -18710 && $asc <= -18527)
        return 'E';

    if ($asc >= -18526 && $asc <= -18240)
        return 'F';

    if ($asc >= -18239 && $asc <= -17923)
        return 'G';

    if ($asc >= -17922 && $asc <= -17418)
        return 'H';

    if ($asc >= -17417 && $asc <= -16475)
        return 'J';

    if ($asc >= -16474 && $asc <= -16213)
        return 'K';

    if ($asc >= -16212 && $asc <= -15641)
        return 'L';

    if ($asc >= -15640 && $asc <= -15166)
        return 'M';

    if ($asc >= -15165 && $asc <= -14923)
        return 'N';

    if ($asc >= -14922 && $asc <= -14915)
        return 'O';

    if ($asc >= -14914 && $asc <= -14631)
        return 'P';

    if ($asc >= -14630 && $asc <= -14150)
        return 'Q';

    if ($asc >= -14149 && $asc <= -14091)
        return 'R';

    if ($asc >= -14090 && $asc <= -13319)
        return 'S';

    if ($asc >= -13318 && $asc <= -12839)
        return 'T';

    if ($asc >= -12838 && $asc <= -12557)
        return 'W';

    if ($asc >= -12556 && $asc <= -11848)
        return 'X';

    if ($asc >= -11847 && $asc <= -11056)
        return 'Y';

    if ($asc >= -11055 && $asc <= -10247)
        return 'Z';

    return null;

}

/**
 * 从redis获取登录缓存信息
 * @return mixed
 */
function get_redis_session() {
    $redisKey = Cookie::get('PHPSESSID');
    $redis = new redis();
    $redis->connect('127.0.0.1', 6379);
    $redis->select(1);

//    $redis->set($redisKey, '');
    $session = unserialize($redis->get($redisKey));

    return $session;
}


/**
 * 设置url中的参数
 * @param $url
 * @param $params
 * @return string
 */
function set_url($url, $params){
    $arr = parse_url($url);
    $arr_query = isset($arr['query'])?convert_url_query($arr['query']):[];
    foreach($params as $key=>$value){
        if($value){
            $arr_query[$key] = $value;
        }else{
            unset($arr_query[$key]);
        }
    }

    return $arr['scheme'].'://'.$arr['host'].$arr['path'].(get_url_query($arr_query)?'?':'').get_url_query($arr_query);
}

/**
 * 将URL数组参数变为字符串
 * @param $array_query
 * @return string string 'm=content&c=index&a=lists&catid=6&area=0&author=0&h=0&region=0&s=1&page=1' (length=73)
 */
function get_url_query($array_query)
{
    $tmp = array();
    foreach($array_query as $k=>$param)
    {
        $tmp[] = $k.'='.$param;
    }
    $params = implode('&',$tmp);
    return $params;
}

/**
 * 将URL字符串参数变为数组
 * @param $query
 * @return array array (size=10)
 */
function convert_url_query($query)
{
    $queryParts = explode('&', $query);
    $params = array();
    foreach ($queryParts as $param) {
        $item = explode('=', $param);
        $params[$item[0]] = $item[1];
    }
    return $params;
}

/**
 * 数组分页函数  核心函数  array_slice
 * 用此函数之前要先将数据库里面的所有数据按一定的顺序查询出来存入数组中
 * $count   每页多少条数据
 * $page   当前第几页
 * $array   查询出来的所有数组
 * order 0 - 不变     1- 反序
 */

function page_array($size,$page,$array,$order){
    global $countpage; #定全局变量
    $page=(empty($page))?'1':$page; #判断当前页面是否为空 如果为空就表示为第一页面
    $start=($page-1)*$size; #计算每次分页的开始位置
    if($order==1){
        $array=array_reverse($array);
    }
    $totals=count($array);
    $countpage=ceil($totals/$size); #计算总页面数
    $pagedata=array();
    $pagedata=array_slice($array,$start,$size);
    return $pagedata;  #返回查询数据
}

/**
 * 过滤字符串敏感词汇
 *
 * @param string $str
 * @return mixed|string
 */
function filter_sensitive_word($str = '') {

    $str = urldecode($str);
    $content = file_get_contents(APP_PATH . "../mingan.txt") ;
    $sensitiveWords = explode("\r\n",$content);


    for($i=0;$i < count($sensitiveWords); $i++)
    {
        preg_match('/'.$sensitiveWords[$i].'/', $str, $mnt);
        if(!empty($mnt)){
            $strLen = utf8_strlen($mnt[0]);
            $str = str_replace($mnt, str_repeat('*', $strLen), $str);
        }
    }

    return $str;
}

/**
 * 计算中文字符串长度
 *
 * @param null $string
 * @return int
 */
function utf8_strlen($string = null) {
    // 将字符串分解为单元
    preg_match_all("/./us", $string, $match);
    // 返回单元个数
    return count($match[0]);
}