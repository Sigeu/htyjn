vendor TP5 API接口管理 (axios)  更改内容 - 2017/5/5
---
#### 将vendor里面的插件固定到此目录下，不允许composer install 否则更改过的代码会丢失
#### 新增配置文件：/application/extra/code.php filter.php mail.php middleware.php mongo.php redis.php setting.php
#### 新增测试API代码：/application/example/
#### 新增公共函数：/application/common.php 中添加api接口管理相关函数
#### 修改代码：/vendor/axios/tpr/src/service/GlobalService.php
```
public static function set($name,$value){
    // debug serialize 如果常量值为数组，将其序列化 serialize
    $value = serialize($value);

    define($name,$value);
}
```
```
public static function get($name=''){
    if(!defined($name)){
        return false;
    }
    $defined = get_defined_constants(true);
    
    // debug unserialize 如果常量值为数组，反序列化 unserialize
    $defined = unserialize($defined);

    if(isset($defined['user'][$name])){
        return $defined['user'][$name];
    }
    return "";
}
```


HT-memorial 系统
---
#### 将shopnc的会员表（member）复制到tp项目，新增字段如下：
```
member_nickname(会员昵称)、member_uniq(会员uniq)、member_token(会员token)
```
#### 将所有的时间存储格式改为时间戳格式 2017/5/20

#### 将后台与前端代码分离
*删除 extend/controller/BasicAdmin.php 将其移动到admin模块 application/admin/controller/BasicAdmin.php
*刪除 extend/service/DataService.php  将其移动到admin模块 application/admin/service/DataService.php
*刪除 extend/service/LogService.php  将其移动到admin模块 application/admin/service/LogService.php
*刪除 extend/service/FileService.php  将其移动到admin模块 application/admin/service/FileService.php
*刪除 extend/service/ToolsService.php  将其移动到admin模块 application/admin/service/ToolsService.php
*刪除 extend/util/Database.php  将其移动到admin模块 application/admin/service/DatabaseService.php

#### 公墓管理系统逻辑分析 2017/6/28

##### 寄存管理

> 寄存逻辑

    顺序：信息登记->选位->收费->存放
    后续操作：续存、移位、位置查看
    管理：格位、安息堂、人员

> 数据表设计 
    
    骨灰盒型表（storage_urn_type） ok
    寄存位置分类表（storage_category）
    寄存位置排位表（storage_row） ID 分类ID
    寄存位平面图（骨灰盒）主表（storage_urn）ID 分类ID 排位ID 位置编号 状态 
    寄存客户登记表（storage_register） ID 寄存登记编号 寄存位置主键ID 逝者ID 寄存人ID 寄存费用 与逝者关系 开始日期 结束日期
                                        寄存取走：| 取走人 取走日期 经办人 位置标记为空
                                        寄存续费：| 重置开始日期及结束日期
                                        到期提醒：| 寄存位置标记到期提醒警告并发送短信到寄存人手机 管理人员联系寄存人
    寄存订单表（storage_order） ID 订单编号 寄存人ID 开始时间 结束时间 价格 
   
   
    
    


##### 碑文管理

> 数据表设计


##### ShopNC 代码功能修改记录

> 程序代码修改

    date：2017-07-31 
    新增功能：两个站点单点登录
    修改代码：/core/framework/function/core.php 在最好增加函数

    /**
     * 设置登录缓存信息
     * TODO 待优化
     * @param null $key
     * @param null $value
     * @param null $minute
     * @return bool
     */
    function vbao_session($key=null,$value = null,$minute=null)
    {
    
        $redisKey = Cookie::get('PHPSESSID');
    
        $redis = new redis();
        $redis->connect('127.0.0.1', 6379);
        $redis->select(1);
    
        $session = unserialize($redis->get($redisKey));
    
        if ($key == 'logout') {
            if (!empty($session['logout_hash']) && $session['logout_hash'] == $value) {
                // 退出登录操作
                //注销session
                session('user_auth', null);
                session('user_auth_sign', null);
                session('member_login_ip', null);
                session('logout_hash',null);
    
                //注销cookie
                cookie('user_auth', null);
                cookie('user_auth_sign', null);
    
                // 清理Shopnc COOKIE
                cookie('msgnewnum'.'','',-3600);
                cookie('auto_login', '', -3600);
                cookie('cart_goods_num','',-3600);
                session_unset();
                session_destroy();
                $redis->set($redisKey, '');
                return true;
            }else {
                return false;
            }
        }
    
        if(!$value){
            if(!$key){
                return $session;
            }else{
                $keyArr = explode('.',$key);
                $res = $session;
                foreach($keyArr as $v){
                    if(isset($res[$v])){
                        $res = $res[$v];
                    }else{
                        $res = null;
                    }
                }
                return $res;
            }
    
        }else{
    
            $keyArr = array_reverse(explode('.',$key));
    
            $res = $value;
            foreach($keyArr as $keyy=>$v){
                $value = $res;
                $res = [];
                $res[$v]=$value;
            }
            $session = $session ? $session : [];
    
            if ($res) {
                $newSession[$key] = $res[$key];
            }else {
                $newSession[$key] = $session[$key];
            }
    
            $resSession = array_merge($session, $newSession);
    
            return $redis->set($redisKey,serialize($resSession),$minute);
        }
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
    
    修改代码：/shop/control/control.php 在showLayout() 方法中新增代码：如下
    
    // TODO 登录成功 设置SESSION
    // @author andy date 2017-07-31
    $setLogin = $this->setLogin();
    
    /**
     * 登录设置SESSION
     * TODO 设置主站SESSION
     * @author andy date 2017-07-31
     */
    protected function setLogin(){

        $uid = is_login();
        $login = [];

        $loginUrl = 'http://www.yunjn.cc/home/login/login.html';
        $registerUrl = 'http://www.yunjn.cc/home/login/register.html';

        $params = ['site'=>'bz','callback'=>urlencode(get_url())];
        $login['login_url'] = set_url($loginUrl,$params);
        $login['register_url'] = set_url($registerUrl,$params);

        // 已经登录
        if($uid){
            $logoutUrl = 'http://www.yunjn.cc/home/login/out.html';

            $params = [
                'site'=>'bz',
                'callback'=>urlencode(get_url()),
                'logout_hash' => vbao_session('logout_hash')
            ];
            $login['logout_url'] = set_url($logoutUrl, $params);
            $userInfo = user_auth_session('user_auth');
            $login['user'] = $userInfo['member_id'];


            Model('member')->createSession($userInfo); // TODO 创建shopnc SESSION
        }

        return $login;
    }
    
