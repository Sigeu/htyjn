###  **1. 合作开发数据库相关注意事项** 

> 在 /application/database.php 中添加你的项目数据库配置：

```
// andy
if (APP_PATH == 'D:\Program Files\Ampps\www\ht-memorial\public/../application/') {
    $host = '127.0.0.1';
    $db = 'ht-memorial';
    $user = 'root';
    $pwd = 'mysql';
}
```
> 开发人员在开发过程中将新增的数据表结构放在/data/目录下upgrade.sql里面

###  **2. layui 页面组件模块js调用注意事项** 
> 在模板文件表单后面添加js代码：

    <script>window.form.render();</script>

> 弹出框开启最大小化功能，修改 /public/static/admin/plugs.js 代码：

    maxmin:true, //开启最大小化功能
    
> 弹出框开启点击遮罩关闭功能，修改 /public/static/admin/plugs.js 代码：
    
    shadeClose:true, // 是否点击遮罩关闭
    
> 图片上传 data-type 上传图片类型 data-file (one/mtl) 是否多图上传 data-uptype (local/qiniu) 本地/七牛存储 data-field 文件存储字段

    <button data-file="one" data-type="pem" data-field="wechat_cert_cert_md5" data-uptype="local"
        type="button" class="layui-btn layui-btn-primary">

> 图片上传 保存到picture表，通过图片id读取图片路径并显示

    <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="{:get_pic_by_id($vo.image_id,-4)}"/>
    <input type="hidden" name="image_id" onchange="$(this).prev('img').attr('src', $(this).attr('data-url'))" value="{$vo.image_id|default=''}" class="layui-input">
    <a class="btn btn-link" data-file="one" data-type="ico,png,jpg" data-field="image_id">上传图片</a>
        
> 图片上传 修复多图上传时，无法选择多张图片的bug
    修改文件：/admin/plugs/upfile.html 
    // 实例化
        uploader = WebUploader.create({
            pick: {
                id: '#filePicker',
                label: '点击选择文件',
                /*{if $mode === 'one'}*/
                multiple: false,
                /* {else /} */
                multiple: true
                /* {/if} */
            },

> 图片上传，可存储图片地址或图片id

    {if isset($vo.image_id)}
    <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="{:get_pic_by_id($vo.image_id,-4)}"/>
    {else /}
    <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="{:get_pic_by_id(-4)}"/>
    {/if}
                            
    {// 存储图片地址}
    <!--<input type="hidden" name="image" onchange="$(this).prev('img').attr('src', $(this).attr('data-url'));$(this).val($(this).attr('data-url'))" value="{$vo.image_id|default=''}" class="layui-input">-->
    {// 存储图片id}
    <input type="hidden" name="image_id" onchange="$(this).prev('img').attr('src', $(this).attr('data-url'));" value="{$vo.image_id|default=''}" class="layui-input">
    <a class="btn btn-link" data-file="one" data-type="ico,png,jpg" data-field="image_id">上传图片</a>



###  **3. 程序开发规范** 
> 设置 phpstorm php类文件自动注释
   File -> Settings -> Editor -> File and Code Templates -> Files 找到 PHP class 修改其内容：
   
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
    #if (${NAMESPACE})
    
    namespace ${NAMESPACE};
    
    #end
    /**
    * 
    * Class ${NAME}
    * @package ${NAMESPACE}
    * @author andy <290648237@qq.com>
    * @date ${DATE}
    */
    class ${NAME} {
       
    }
   
> 文件注释

    // +----------------------------------------------------------------------
    // | Ht.Memorial
    // +----------------------------------------------------------------------
    // | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
    // +----------------------------------------------------------------------
    // | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
    // +----------------------------------------------------------------------
    // | Author: andy <290648237@qq.com>
    // +----------------------------------------------------------------------

> 类注释

    /**
     * 文章管理
     * Class Article
     * @package app\admin\controller
     * @author andy <290648237@qq.com>
     * @date 2017/05/08
     */
 
> Api接口方法注释
 
    /**
     * 登陆接口
     * @desc 验证用户名密码
     * @method POST
     * @parameter string username 用户名（必须）
     * @parameter string password 密码（必须）
     *
     * @response string code 状态码（默认"200"）
     * @response array data data数组
     * @response string data.member_name 用户名
     * @response string data.member_truename 真实姓名
     * @response string data.member_nickname 昵称
     * @response string data.member_token 令牌
     * @response string message 消息内容
     */
     
> 代码规范（请参照以下规范进行代码书写）
    
 * 目录和文件
 
     ~~~
     1. 目录使用小写+下划线；
     2. 类库、 函数文件统一以 .php 为后缀；
     3. 类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致；
     4. 类文件采用驼峰法命名（首字母大写），其它文件采用小写+下划线命名；
     5. 类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）；
     ~~~
 * 函数和类、 属性命名
 
    ~~~
    1. 类的命名采用驼峰法（首字母大写），例如 User 、 UserType ，默认不需要添加后缀，例如 UserController 应该直接命名为 User ；
    2. 函数的命名使用小写字母和下划线（小写字母开头）的方式，例如 get_client_ip ；
    3. 方法的命名使用驼峰法（首字母小写），例如 getUserName ；
    4. 属性的命名使用驼峰法（首字母小写），例如 tableName 、 instance ；
    5. 以双下划线“__” 打头的函数或方法作为魔法方法，例如 `__call 和 __autoload`；
    ~~~
 * 常量和配置
 
    ~~~
    1. 常量以大写字母和下划线命名，例如 APP_PATH 和 THINK_PATH ；
    2. 配置参数以小写字母和下划线命名，例如 url_route_on 和 url_convert ；
    ~~~
    
 * 数据表和字段
 
    ~~~
    数据表和字段采用小写加下划线方式命名，并注意字段名不要以下划线开头，例如 think_user 表和 user_name 字段，不建议使用驼峰和中文作为数据表字段命名。
    ~~~
 * 应用类库命名空间规范
    
    ~~~
    应用类库的根命名空间统一为app（可以设置 app_namespace 配置参数更改）；
    例如： app\index\controller\Index 和 app\index\model\User 。
    ~~~

> 第三方类库文件
 
 * 功能型类库 
    
    ~~~
    请放到对应模块service目录下
    ~~~

### **4. api接口生成文档说明（此内容已作废）**
> 生成文档命令
 
     $ apidoc -i ../application/ -o ../public/apidoc/
     
生成api文档注释规范：http://www.jianshu.com/p/bb5a4f5e588a
 
### **5. Redis启动命令**
> Redis 启动命令 
 
    $ redis-server.exe redis.windows.conf
    requrepass ht_memorial20170531
 
### **6. 怀恩Api地址** 
    进入祭拜大厅回调api
    http://a.jinian.huaien.com:9001/jinian/jnGetMaterialList.do?params={%22materialTypeApp%22:30} 
    http://a.jinian.huaien.com:9001/jinian/jnGetMaterialList.do?params={%22materialTypeApp%22:50}
    http://a.jinian.huaien.com:9001/jinian/jnGetMemorialPrimeInfoByID.do?params={%22huaienID%22:0,%22memorialID%22:1000279}
    http://www.huaien.com/AjaxFlash/GetUserCode.do?_=944095825
    http://a.jinian.huaien.com:9001/jinian/MemorialInfo.do?params={%22huaienID%22:0,%22memorialID%22:1000279}
    http://a.jinian.huaien.com:9001/jinian/jnGetUserInfoByID.do?params={%22huaienID%22:1282242}
    http://a.jinian.huaien.com:9001/jinian/jnGetMemorialMaterial.do?params={"keyID":1000279} 获取祭拜大厅中有效祭品
    
    祭拜动作回调api
    http://www.huaien.com/AjaxFlash/GetUserCode.do?_=945773690
    http://a.jinian.huaien.com:9001/jinian/jnGetUserInfoByID.do?params={%22huaienID%22:1282242}
    http://jn.huaien.com/AjaxJn/GetUserLoginID.do
    http://a.jinian.huaien.com:9001/jinian/addAction.do?params={"huaienID":1282242,"materialID":22,"keyID":1000279,"userLoginID":5653} 祭拜动作
    
    
### **7. 配置Phpstorm断点调试**
> 下载php_xdebug扩展并将扩展文件放入./php/ext/目录下
   修改 php.ini 最后加入以下代码：
   
    [Xdebug]
    zend_extension = D:\xampp\php\ext\php_xdebug-2.5.4-5.6-vc11.dll
    xdebug.remote_enable=1
    xdebug.remote_handler=dbgp
    xdebug.remote_mode=req
    xdebug.remote_host=localhost
    xdebug.idekey="PHPSTORM"

> 修改Phpstorm 配置

    配置过程详见百度
    
    
### **8. 接口相关**
#### 如果有涉及到请调用，也可以对基类进行优化更改

> 接口状态码
    
    999 未知错误
    1 开头为通用错误
    2 商品类错误
    3 主题类错误
    4 用户类错误
    5 类目类错误
    6 Banner类错误
    8 订单类错误
    
    10000 通用参数错误
    10001 资源未找到
    10002 未授权（令牌不合法）
    10003 尝试非法操作（自己的令牌操作其他人的数据）
    10004 授权失败（第三方应用账号登录失败）
    10005 授权失败（服务器缓存异常）
    10006 缺少必要参数
    
    
    20000 请求商品不存在
    
    30000 请求主题不存在
    
    40000 请求用户不存在
    
    50000 类目不存在
    
    60000 Banner不存在
    
    80000 订单不存在
    80001 订单中的商品不存在，可能已被删除
    80002 订单未支付，却尝试发货
    80003 订单已支付过
    
> 异常处理基类 
    
    代码位置：\application\lib\exception\BaseException.php
   
> 验证器基类   

    代码位置：\application\api\validate\BaseValidate.php


### **9. 图片生成缩略图方法**
> 使用方法说明

    /* 缩略图相关常量定义 */
        const THUMB_SCALING   = 1; //常量，标识缩略图等比例缩放类型
        const THUMB_FILLED    = 2; //常量，标识缩略图缩放后填充类型
        const THUMB_CENTER    = 3; //常量，标识缩略图居中裁剪类型
        const THUMB_NORTHWEST = 4; //常量，标识缩略图左上角裁剪类型
        const THUMB_SOUTHEAST = 5; //常量，标识缩略图右下角裁剪类型
        const THUMB_FIXED     = 6; //常量，标识缩略图固定尺寸缩放类型

    {:quick_pic_thumb($vo.image, '@110w_80h')}
    // 拼接style地址说明：
        @100w 只指定图片宽度 裁剪成正方形 默认裁剪方式是3（居中裁剪）
        @100w_200h 指定宽、高 裁剪成长方形 默认裁剪方式是3（居中裁剪）
        @100w_200h__1e_1c 指定宽、高、裁剪类型 按裁剪类型裁剪成长方形 裁剪方式为3（居中裁剪）
        注：其他类型暂时不考虑使用

> 模板中调用方法

    {:quick_pic_thumb($pathToImage, '@110w_80h')}

> PHP代码中调用方法

    quick_pic_thumb($pathToImage, '@110w_80h')
    
    
### **10. 微信开放平台使用方法**
> 函数调用说明
    
    // 初始化微信公众号及微信支付商家信息 需要传入商家ID
    $wechat = load_merchant_wechat('Menu', $merchantId);

     