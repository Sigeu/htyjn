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

use app\api\model\AppVersion;
use app\api\validate\BaseValidate;
use app\home\model\Document;
use app\home\model\Page;
use app\lib\exception\BaseException;
use axios\tpr\core\Api;
use app\api\model\Goods as GoodsModel;
use app\api\model\Hall as HallModel;
use think\Db;

/**
 * 不需要登录验证的接口
 * Class NoAuthApi
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/7/7
 */
class Noauthapi extends Api
{
    /**
     * 民族列表
     * @desc 民族列表
     * @method post
     * @response
     */
    public function ethnicList()
    {
        $ethnic = config('ethnic');
        $ethnicList = [];
        foreach ($ethnic as $key=>$item) {
            $ethnicList[] = [
                'id' => $key,
                'name' => $item
            ];
        }
        $this->response($ethnicList);
    }

    /***************************** 纪念馆祭拜大厅接口 *****************************/

    /**
     * andy-获取纪念馆详情_无需登录验证
     * @desc 根据具体页面参数获取纪念馆详情
     * @method post
     * @parameter int hall_id 纪念馆ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallDetail()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $hallId = $this->param['hall_id'];
        $info = HallModel::getInfoById($hallId, ['hall_style', 'hall_music', 'hall_worship_style'], 0);

        if(!$info) {
            $this->wrong(0, '请求的纪念馆不存在');
        }
        $this->response($info);

    }

    /**
     * andy-获取商品列表
     * @desc 获取商品列表
     * @method post
     * @parameter int pid 祭祀商品分类父ID（必须）
     * @parameter int is_relate_path 图片是否返回相对路径（可选）默认“0”
     * @parameter string return_type 数据返回类型（可选）
     * @response
     */
    public function getMaterialList($pid = 0, $is_relate_path = 0)
    {
        if (!$pid) {
            $pid = $this->request->param('pid');
        }

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['pid'])->MustBePostiveInt(['pid']);

        $category = Db::name('MallGoodsCategory')->where('pid', $pid)->order('sort desc,id desc')->select();
        if(!$category) {
            throw new BaseException('请求的分类不存在', 404, 20000);
        }

        foreach ($category as $ckey=>$cate) {
            $goods = GoodsModel::getGoodsByCategoryID($cate['id']);
            foreach ($goods as $gkey=>$material) {
                if(!$is_relate_path) {
                    // 图片路径为绝对路径
                    $material['image'] = get_url_with_domain($material['image']);
                    $material['menu_url'] = get_url_with_domain($material['menu_url']);
                }else {
                    // 图片路径为相对路径
                    $material['image'] = '.'.$material['image'];
                    $material['menu_url'] = '.'.$material['menu_url'];
                }
                $goods[$gkey] = $material;
            }
            $category[$ckey]['goods'] = $goods;
        }

        // 写入txt文件
        file_put_contents(ROOT_PATH.'goods_local_files/c'.$pid.'.txt', json_encode($category));
        // 从txt文件读取数据
        $filesArray = json_decode(file_get_contents(ROOT_PATH.'goods_local_files/c'.$pid.'.txt'));

        if($is_relate_path) {
            // 如果获取的图片路径为相对路径，则将json数据写入txt文件
            file_put_contents(ROOT_PATH.'goods_local_files/c'.$pid.'.txt', json_encode($category));
            // 读取文件中的数据
            $filesArray = json_decode(file_get_contents(ROOT_PATH.'goods_local_files/c'.$pid.'.txt'));
        }


        $this->response($filesArray);
    }

    /**
     * andy-获取商品详情
     * @desc 获取商品信息
     * @method post
     * @parameter int id 商品id（必须）
     * @response
     */
    public function read()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['id'])->MustBePostiveInt(['id']);

        $id = $this->param['id'];
        $data = GoodsModel::getGoodsByID($id);
        if(!$data) {
//            throw new BaseException('请求的商品不存在', 404, 20000);
            $this->wrong('请求的商品不存在');
        }
        $this->response($data);
    }

    /**
     * andy-获取大厅桌面显示的有效祭祀商品
     * @desc 获取大厅桌面显示的祭祀商品列表信息
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆id（必须）
     * @response
     */
    public function jnGetDurationMaterial()
    {

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $hallId = $this->request->param('hall_id');

        // 有效祭祀品分类返回
        // 总共有4个大位置，15个小位置
        // 1. 上香 （1个位置 中间香炉） 位置标识：middle 分类ID：3001
        // 2. 【供品】、鲜花 （10个位置 除中间香炉、左右、中间左右的其他10个位置） 位置标识：random
        //     分类ID：3004 5001 5002 5003 5004 5005 5006 5007 5008 5009 5010 5011
        //             5012 5013 5014 5015 5016 5017 5018
        // 3. 花圈（2个位置 左右） 位置标识：left_right 分类ID：3003
        // 4. 点烛（2个位置 中间左右） middle_left_right 分类ID：3002
        $middle = 3001; // 中间
        $random = [3004,5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018];  // 随机位置
        $leftRight = 3003; // 左右
        $middleLeftRight = 3002; // 中间左右

        // 获取中间位置祭祀品
        $middleData = $this->_getDurationMaterials($hallId, $middle, 1);


        // 获取随机位置祭祀品
        $randomData = $this->_getDurationMaterials($hallId, $random, 10);

        // 获取左右位置祭祀品
        $leftRightData = $this->_getDurationMaterials($hallId, $leftRight, 2);

        // 获取中间左右位置祭祀品
        $middleLeftRightData = $this->_getDurationMaterials($hallId, $middleLeftRight, 2);

        $resMaterial = [
            'middle' => $middleData,
            'random' => $randomData,
            'left_right' => $leftRightData,
            'middle_left_right' => $middleLeftRightData
        ];

        $this->response($resMaterial);
    }

    /**
     * 获取祭拜大厅有效祭祀品 辅助方法
     * @param int $hallId 纪念馆ID
     * @param int|array $categoryID 祭祀商品分类ID
     * @param int $limit 数量
     * @return array
     */
    private function _getDurationMaterials($hallId, $categoryID, $limit = 20) {

        if(is_array($categoryID)) {
            $map['g.cid'] = ['in', $categoryID];
        }else {
            $map['g.cid'] = $categoryID;
        }

        $map['w.hall_id'] = $hallId;

        $materials = Db::view(['tp_mall_worship' => 'w'], 'duration, goods_id')
            ->view(['tp_mall_goods' => 'g'], 'name, image, cid, btn_id', 'g.id = w.goods_id', 'RIGHT')
            ->where($map)->order('w.create_at desc')->limit($limit)->select();

        $resMaterial = [];
        $init = 0; // 初始化祭祀品数量

        foreach ($materials as $material) {
            $duration = $material['duration'] - time();
            if ($duration > 0) {
                $material['duration'] = $duration;
                $material['image'] = get_url_with_domain($material['image']);
                $resMaterial[$init] = $material;
                $init ++;
            }
        }

        // 处理祭拜大厅中有效祭祀品为空时的情况 当剩余位置为空时，用默认信息补空
        if($init < $limit) {
            while ($init < $limit) {
                $resMaterial[$init] = [
                    'duration' => 0,
                    'image' => get_root_url() . '/static/upload/picture/default/hall_default_material.png'
                ];
                $init++;
            }
        }

        return $resMaterial;
    }


    /**
     * andy-获取Android最新版本
     * @desc 获取Android最新版本
     * @method post
     * @parameter int version 版本号（必须）
     * @response
     */
    public function androidAppLatestVersion()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['version'])->MustBePostiveInt(['version']);

        $version = $this->param['version'];

        $data = AppVersion::getLatestVersion($version);

        if (!$data) {
            $this->response(null, 0, '当前版本已经是最新版本');
        }

        $this->response($data, 200, '获取版本信息成功');
    }

    /**
     * 检查订单状态
     */
    public function check_order_pay_status()
    {
        $order_id = I('order_id/d');
        if(empty($order_id)){
            $this->response(null, -1, '参数错误');
        }
        $order = M('recharge')->field('pd_payment_state')->where(['pd_id'=>$order_id])->find();
        if($order['pd_payment_state'] != 0){
            $message = '已支付';
            $status = 1;
        }else{
            $message = '未支付';
            $status = 0;
        }
        $this->response($order, $status, $message);
    }



    /**
     * andy-获取公墓合作说明
     * @desc 获取公墓合作说明
     * @method post
     * @parameter int id 分类ID（必须）
     * @response
     */
    public function getGmArticleList()
    {

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['id'])->MustBePostiveInt(['id']);
        $data = Document::getArticleList(1, 10, 'create_at desc', $this->param['id']);
        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        if($data){
            foreach ($data as $key=>$item) {
                $data[$key]['content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($item['content'])); //过滤html标签
            }
        }

        $this->response($data);
    }

    /**
     * andy-获取单页详情
     * @desc 获取单页详情
     * @method post
     * @parameter int id 单页ID（必须）
     * @response
     */
    public function getPaperView()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['id'])->MustBePostiveInt(['id']);

        $data = Page::getDataByID($this->param['id']);
        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        $data['content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($data['content'])); //过滤html标签

        $this->response($data);
    }


}
