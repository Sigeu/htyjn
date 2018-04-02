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

use app\api\model\MallWorship;
use app\api\validate\BaseValidate;
use app\common\controller\ApiLogin;
use app\lib\exception\BaseException;
use think\Db;
use app\api\model\Goods as GoodsModel;

/**
 * 商品API
 * Class Goods
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/16
 */
class Goods extends ApiLogin
{


    /***************************** 纪念馆祭拜大厅接口 *****************************/

    /**
     * andy-获取有效祭祀商品列表详情
     * @desc 获取祭拜大厅祭祀商品列表详情信息
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆id（必须）
     * @parameter int user_id 用户id（可选）
     * @response
     */
    public function jnGetMemorialMaterial()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $hallId = $this->param['hall_id'];
        if(isset($this->param['user_id'])) {
            $userId = $this->param['user_id'];
        }else {
            $userId = 0;
        }

        $userMaterialDb = Db::view(['tp_mall_worship' => 'w'], 'user_id, hall_id')
            ->view(['yun_member' => 'm'], 'member_nickname, member_avatar', 'm.member_id = w.user_id', 'RIGHT')
            ->order('w.create_at desc');
        if($userId) {
            $map = [
                'hall_id' => $hallId,
                'user_id' => $userId
            ];
            $userMaterial = $userMaterialDb->where($map)->find();
            $resMaterial = $this->_getMaterial($hallId, $userId);

            if(!$resMaterial) {
                $userMaterial = null;
            }else {
                $userMaterial['material'] = $resMaterial;
            }
        }else {
            $userMaterial = $userMaterialDb->where('hall_id', $hallId)->group('w.user_id')->select();
            foreach ($userMaterial as $key=>$user) {
                $resMaterial = $this->_getMaterial($hallId, $user['user_id']);
                if(!$resMaterial) {
                    unset($userMaterial[$key]);
                }else {
                    $userMaterial[$key]['material'] = $resMaterial;
                }
            }
        }

        $this->response($userMaterial);
    }

    /**
     * andy-获取祭拜大厅祭祀商品 辅助方法
     * @param int $hallId 纪念馆id
     * @param int $userId 用户id
     * @return array
     */
    private function _getMaterial($hallId, $userId = 0) {
        $map['w.hall_id'] = $hallId;
        if($userId) {
            $map['w.user_id'] = $userId;
        }
        $materials = Db::view(['tp_mall_worship' => 'w'], 'user_id, hall_id, duration, goods_id, goods_num')
            ->view(['tp_mall_goods' => 'g'], 'image, btn_id, user_integral', 'g.id = w.goods_id', 'RIGHT')
            ->where($map)->order('w.create_at desc')->select();

        $resMaterial = [];
        $totalGoods = 0;
        $totalIntegral = 0;
        foreach ($materials as $material) {
            $duration = $material['duration'] - time();
            if($duration > 0) {
                $totalGoods += $material['goods_num'];
                $totalIntegral += $material['user_integral'];
                $material['duration'] = $duration;
                $material['image'] = get_url_with_domain($material['image']);
                $resMaterial['total_goods'] = $totalGoods;
                $resMaterial['total_integral'] = $totalIntegral;
                $resMaterial[] = $material;
            }
        }
        return $resMaterial;
    }

    /**
     * andy-祭拜
     * @desc 祭拜大厅中进行祭拜
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int user_id 用户id（必须）
     * @parameter int goods_id 祭祀商品id（必须）
     * @parameter int goods_num 祭祀商品数量（可选默认为“1”）
     * @parameter int hall_id 纪念馆id（必须）
     * @response
     */
    public function addAction()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id', 'user_id', 'goods_id'])->MustBePostiveInt(['hall_id', 'user_id', 'goods_id']);

        $params = $this->param;
        $hallId = $params['hall_id'];
        $userId = $params['user_id'];
        $goodsId = $params['goods_id'];
        $goodsNum = isset($params['goods_num']) && !empty($params['goods_num']) ? $params['goods_num'] : 1; // 初始化祭拜商品数量为1

        // 获取祭祀商品信息
        $goodsInfo = Db::name('MallGoods')
            ->field('name, summary, price, user_integral, memorial_integral, duration, btn_id, image')
            ->find(['id' => $goodsId]);
        if(!$goodsInfo) {
            $this->wrong(0, '祭祀商品id无效！');
        }

        // 获取用户信息
        $user = Db::table('yun_member')->field('coins, memorial_value')->find(['member_id' => $userId]);
        // todo bug 判断用户传入的token是否与用户id一致
        if(!$user || $userId != $this->user['member_id']) {
            $this->wrong(0, '用户id无效！');
        }

        // 判断用户余额是否足够
        if(!$user['coins'] || $user['coins'] < $goodsInfo['price']*$goodsNum) {
            $this->wrong(250, '您的余额不足，请充值！');
        }

        // 开始祭拜 插入数据
        $duration = $goodsInfo['duration']*3600; // 祭祀商品有效期 单位：秒
        $saveData = [
            'worship_sn' => uniqid(), // 生成唯一字符串
            'hall_id' => $hallId,
            'user_id' => $userId,
            'goods_id' => $goodsId,
            // TODO 是否有必要存储？ 祭祀商品信息
            'goods_name' => $goodsInfo['name'],
            'goods_price' => $goodsInfo['price'],
            'goods_user_integral' => $goodsInfo['user_integral'],
            'goods_memorial_integral' => $goodsInfo['memorial_integral'],
            'goods_image' => $goodsInfo['image'],


            'goods_num' => $goodsNum,
            'duration' => $duration + time(),
            'create_at' => time()
        ];
        $result_id = Db::name('MallWorship')->insertGetId($saveData);
        if(!$result_id) {
            $this->wrong(0, '写入数据库出错！');
        }

        // 更新用户纪念值、纪念币字段
        $usedCoins = $goodsInfo['price']*$goodsNum; // 消耗金币
        $incIntegral = intval($usedCoins / 10); // 增加纪念值

        Db::table('yun_member')->where('member_id', $userId)->setDec('coins', $usedCoins); // 更新纪念币字段
        Db::table('yun_member')->where('member_id', $userId)->setInc('memorial_value', $incIntegral); // 更新用户纪念值字段
        Db::name('hall')->where('id', $hallId)->setInc('memorial_value', $incIntegral); // 更新纪念馆纪念值字段
        $this->_memberWorship($userId, $hallId, $incIntegral); // 更新/新增用户纪念表(member_worship)

        $data = [
//            'result_id' => $result_id, // 祭拜成功 存入数据返回的主键id值
//            'price' => $goodsInfo['price'], // 纪念币 -10
////            'userIntegral' => 0,
//            'memorial_value' => $goodsInfo['user_integral'], // 纪念值 +1
//            'btn_id' => $goodsInfo['btn_id'] // 祭祀商品位置id
            'coins' => $user['coins'] - $goodsInfo['price'], // 纪念币 -10
        ];

        if($data) {
            $this->response($data);
        }else {
            $this->wrong(0, '参数无效');
        }
    }

    /**
     * 用户祭拜 辅助方法
     *
     * member_worship 用户祭拜表
     * 主要存储用户祭拜的纪念馆ID和对某个纪念馆祭拜的总积分
     * 数据库字段设计 id(主键) member_id(用户ID) hall_id(纪念馆ID) hall_integral(纪念馆总积分)
     *
     * @param int $userId 用户ID
     * @param int $hallId 纪念馆ID
     * @param int $incIntegral 增加纪念值
     * @return int|string
     */
    private function _memberWorship($userId, $hallId, $incIntegral)
    {
        $data = [
            'member_id' => $userId,
            'hall_id'   => $hallId
        ];
        $saveData = [
            'member_id' => $userId,
            'hall_id'   => $hallId,
            'hall_integral' => $incIntegral,
            'member_integral' => $incIntegral
        ];

        if(Db::name('member_worship')->where($data)->count()){
            // 有祭拜记录 则更新字段
            Db::name('member_worship')->where($data)->setInc('hall_integral', $incIntegral);
            $result = Db::name('member_worship')->where($data)->setInc('member_integral', $incIntegral);
        }else {
            // 无祭拜记录 则插入数据
            $result = Db::name('member_worship')->insert($saveData);
        }
        return $result;
    }

    /**
     * andy-用户充值消费
     * @desc 用户充值消费纪念币
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“10”）
     * @response
     */
    public function userRechargeCost()
    {

        // 初始化数组
        $worshipData = $rechargeData = [];

        $map = [
            'user_id' => $this->user['member_id'],
            'status' => 1
        ];
        $worshipRecords = Db::name('mall_worship')->where($map)->order('create_at desc')->select(); // 消费记录
        if ($worshipRecords){
            foreach ($worshipRecords as $item){
                $worshipData[] = [
                    'name' => $item['goods_name'],
                    'coins' => $item['goods_price'],
                    'create_at' => $item['create_at'],
                    'type' => 1 // 类型 消费纪念币
                ];
            }
        }

        $rechargeRecords = Db::name('recharge')->where('pd_member_id', $this->user['member_id'])->order('pd_add_time desc')->select();
        if ($rechargeRecords){
            foreach ($rechargeRecords as $item){
                $rechargeData[] = [
                    'name' => $item['pd_goods_name'],
                    'coins' => $item['pd_coins'],
                    'create_at' => $item['pd_add_time'],
                    'type' => 2 // 类型 充值纪念币
                ];
            }
        }
        $records = array_merge($worshipData, $rechargeData);

        foreach($records as $val){
            $key_arrays[] = $val['create_at'];
        }

        array_multisort($key_arrays, SORT_DESC, SORT_NUMERIC, $records);

        $this->response($records);

    }


}
