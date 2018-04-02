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

use app\api\validate\IDMustBePostiveInt;
use axios\tpr\core\Api;
use think\Controller;
use think\Db;
use think\Exception;
use think\Image;
use think\Request;

require ROOT_PATH.'/vendorQueryList/autoload.php';

use QL\QueryList;

class Test extends Api
{

    public function api()
    {
        $this->response('Hello', 200, '获取数据成功');
    }

    public function image()
    {
        $image = Image::open('./static/test/img_01.jpg');

        $savePath = './static/test/crop.jpg';
        // 裁剪图片
//        $image->crop(500, 500)->save($savePath);

        // 等比缩放
//        $image->thumb(600,600)->save($savePath);
        $image->thumb(300,300,Image::THUMB_CENTER)->save($savePath);

        // 图像翻转
//        $image->flip(Image::FLIP_Y)->save($savePath);

        // 图像旋转
//        $image->rotate()->save($savePath);

        // 添加图片水印
//        $image->water('./static/test/11.jpg', Image::WATER_NORTHEAST, 30)->save($savePath);

        //添加文字水印
        $image->text('Hello 十年', './static/plugs/bootstrap/fonts/glyphicons-halflings-regular.ttf', 20, '#eeaeee')->save($savePath);

        echo "<img src='/ht-memorial/public/static/test/crop.jpg' />";


        /*
        公墓管理
        公墓列表   名称  分类  价格  状态  供应商  产品编号（SN）
        公墓分类
        订单列表   公墓SN   订单号  成交价   销售人员  成交日期  云纪念馆SN   售后服务单  客户信息


        添加公墓产品：
        1、单个公墓产品添加，按库存批量生成N个公墓SN，可对任何SN产品进行内容编辑描述。



        公墓企业系统：后台菜单


        公墓列表
        公墓分类
        订单列表
        客户信息
        客户回访
        基本信息（类似宗正堂）
        */

    }



    public function test()
    {

        // 纪念馆等级制度



        // 获取动画id为g（供品）的所有祭祀商品ID
        $map = [
            'cid' => ['between', [5001,5018]]
        ];
        $data = \db('mall_goods')->where($map)->update(['btn_id' => 'gpClass']);
        dump($data);die;

//        http://img.mp.itc.cn/upload/20170326/c9ea5e92367d40a58b539c4e40993c48.jpeg
        $url = 'http://img.mp.itc.cn/upload/20170326/c9ea5e92367d40a58b539c4e40993c48a.jpeg';

        $savePath = './static/upload/picture/'.date('Ymd').'/';
        // 创建目录
        if(!is_dir('./'.$savePath)) {
            @mkdir('./'.$savePath, 0777);
        }

        $path = $savePath.md5(microtime(true)).'.jpg';
        $saveName = curl_get_img($url,$path);
        echo $saveName;die;



    }

}
