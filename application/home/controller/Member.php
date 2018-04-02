<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: ding <dingzhangze@qq.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use app\api\model\Jssdk;
use app\api\model\MallWorship;
use app\api\model\MemberModel;
use app\api\model\Recharge;
use app\api\model\RechargePackage;
use app\common\controller\HomeBase;

use think\Env;
use think\Validate;
use think\Request;
use think\Db;

/* TODO 调用后台模型 后期优化 前后端php代码分离 */
use app\api\model\Hall as HallModel;
use app\admin\model\Hall as AdminHallModel;
use app\admin\model\HallLingpaiStyle as AdminHallLingpaiStyle;
use app\admin\model\HallMusic as AdminHallMusic;
use app\admin\model\HallStyleCategory as AdminHallStyleCategory;
use app\api\model\HallFamousType as AdminHallFamousType;
use app\admin\model\HallLingpaiStyle;
use app\admin\model\HallMusic;
use app\admin\model\HallStyle;
use app\admin\model\HallWorshipStyle;

/**
 * 会员中心控制器
 * Class Login
 * @package app\home\controller
 * @author ding <dingzhangze@qq.com>
 * @date 2017/7/11
 */
class Member extends HomeBase {

    public function __construct(Request $request = null)
    {
        parent::__construct($request);

        if (!$this->user) {
            // 未登录状态 跳转到登录页面
//            $callbackUrl = Env::get('web.host').substr($this->request->url(), 1);
            $callbackUrl = Env::get('web.host');
            $this->redirect('http://bz.yjn100.com/member/index.php?act=login&ref_url='.$callbackUrl);
        }

        // 获取个人中心左侧菜单栏
        $userLeftMenus = [
            // 个人中心
            0 => [
                'name' => '个人中心',
                'url' => '',
                'icon' => 'glyphicon',
                'target' => '_self',
                'isDomain' => 0,
                'sub' => [
                    0 => [
                        'name' => '个人资料',
                        'url' => 'http://bz.yjn100.com/member/index.php?act=member_information&op=member',
                        'target' => '_blank',
                        'isDomain' => 1,
                    ],
                    1 => [
                        'name' => '充值记录',
                        'url' => '/home/Member/user_order',
                        'target' => '_self',
                        'isDomain' => 0,
                    ],
                    2 => [
                        'name' => '消费记录',
                        'url' => '/home/Member/user_worship_records',
                        'target' => '_self',
                        'isDomain' => 0,
                    ],
                    3 => [
                        'name' => '纪念币充值',
                        'url' => '/home/Member/user_recharge',
                        'target' => '_self',
                        'isDomain' => 0,
                    ],
                ]
            ],
            // 云纪念管理
            1 => [
                'name' => '云纪念管理',
                'url' => '',
                'icon' => 'glyphicon',
                'target' => '_self',
                'isDomain' => 0,
                'sub' => [
                    0 => [
                        'name' => '管理纪念馆',
                        'url' => '/home/Member/user_hall',
                        'target' => '_self',
                        'isDomain' => 0,
                    ]
                ]
            ],
            // 公墓管理
            2 => [
                'name' => '公墓管理',
                'url' => '',
                'icon' => 'glyphicon',
                'target' => '_self',
                'isDomain' => 0,
                'sub' => []
            ],
            // 殡葬管理
            3 => [
                'name' => '殡葬管理',
                'url' => 'http://bz.yjn100.com/shop/index.php?act=member&op=home',
                'icon' => 'glyphicon',
                'target' => '_blank',
                'isDomain' => 1,
                'sub' => []
            ],
        ];
        $this->assign('userLeftMenus', $userLeftMenus);

        list($module, $controller, $action) = [$this->request->module(), $this->request->controller(), $this->request->action()];
        // 获取当前
        $currentUserLeftMenu = "/{$module}/{$controller}/{$action}";
        $this->assign('currentUserLeftMenu', $currentUserLeftMenu);

    }

    /*
     * 会员中心首页
     */
    public function index()
    {
        $uinfo =MemberModel::self()->findUser($this->user['member_id']);
        $this->assign('uinfo',$uinfo);
        return $this->fetch('');
    }

    /*
     * 个人信息设置
     */
    public function user_info()
    {
        if(request()->isPost()){
            $data=input('post.');
            $uMap=[
                'member_avatar'=>$data['member_avatar'],
                'member_name'=>$data['member_name'],
                'member_email'=>$data['member_email'],
                'member_truename'=>$data['member_truename'],
                'member_sex'=>$data['member_sex'],
                'member_province'=>$data['member_province'],
                'member_city'=>$data['member_city'],
                'member_area'=>$data['member_area'],
                'member_areainfo'=>$data['member_areainfo']
            ];
            $rule = [
                ['member_name','require|max:16','用户名必须填写|用户名最多不能超过16个字符'],
                ['email','email','邮箱格式错误']
            ];

            $cData=[
                'member_name'=>$data['member_name'],
                'member_email'=>$data['member_email'],
            ];

            $validate = new Validate($rule);
            $result = $validate->check($cData);
            if(!$result){
               $this->error($validate->getError());
            }
            $res=Db::table('yun_member')->where('member_id',$data['member_id'])->update($uMap);
            $res !== false ? $this->success('保存成功！', url('/home/member/user_info')) : $this->error('保存失败，请稍候再试！');
        }else{
            return $this->fetch('');
        }
    }

    /*
     * 个人账号绑定
     */
    public function user_bind()
    {
        return $this->fetch('');
    }

    /*
     * 个人账号安全
     */
    public function user_safe()
    {
        return $this->fetch('');
    }

    /**
     * 个人收藏
     */
    public function user_collect()
    {
        return $this->fetch('');
    }

    /**
     * 账户充值
     */
    public function user_recharge()
    {
        $page = 1;
        $size = 20;

        $memberId = $this->user['member_id'];
        $data = RechargePackage::getDatas($page, $size, $memberId);
        $this->assign('data', $data);

        return $this->fetch('');
    }

    /**
     * Ajax 充值纪念币
     */
    public function ajaxRechargeJnb()
    {
        if ($this->request->isPost()) {

            $id = $this->request->param('id');
            $rechargeInfo = M('RechargePackage')->where('id', $id)->find();
            $rechargeTotal = $rechargeInfo['price']; // 充值金额

            // 检查用户是否登录
            if (!$this->user) {
                $this->error('未登录，请先登陆');
            }
            $memberId = $this->user['member_id'];
            $userInfo = MemberModel::self()->findUser($memberId);

            if (!$userInfo) {
                $this->error('用户不存在！');
            }

            $totalCoins = $rechargeInfo['price']*100 + $rechargeInfo['donate']; // 纪念币总数
            // 生成订单
            $data = [
                'pd_sn' => date('YmdHis').rand(1000,9999), // 订单编号
                'pd_member_id' => $memberId, // 登录用户ID
                'pd_goods_id' => $id, // 充值套餐ID
                'pd_goods_name' => $rechargeInfo['name'], // 充值套餐ID
                'pd_member_name' => $userInfo['member_nickname'], //用户名称
                'pd_amount' => $rechargeTotal, // 充值金额
                'pd_coins' => $totalCoins, // 充值纪念币总数
                'pd_add_time' => time(), // 订单添加时间
                'pd_payment_state' => 0, // 订单支付状态
            ];
            $data['pd_id'] = $order_id = M('Recharge')->insertGetId($data);
            $order = $data;

            if (!$order_id) {
                $this->error('添加订单失败');
            }
            // 记录订单操作日志
            $action_info = array(
                'order_id'        => $order_id,
                'action_user'     => $memberId,
                'action_note'     => '您提交了订单，请等待系统确认',
                'status_desc'     => '提交订单',
                'log_time'        => time(),
            );
            M('order_action')->insertGetId($action_info);


            // TODO 如果有微信公众号 则推送一条消息到用户微信
            $jssdk = new Jssdk();
            $wx_content = "你刚刚下了一笔订单:{$order['pd_sn']} 请尽快支付,过期失效!";
            $jssdk->push_msg($userInfo['member_wxopenid'], $wx_content);

//            if($userInfo['oauth'] == 'weixin')
//            {
//                $wx_user = M('wx_user')->find();
//                $jssdk = new Jssdk($wx_user['appid'],$wx_user['appsecret']);
//                $wx_content = "你刚刚下了一笔订单:{$order['pd_sn']} 尽快支付,过期失效!";
//                $jssdk->push_msg($userInfo['member_wxopenid'], $wx_content);
//            }
//            // TODO 用户下单, 发送短信给商家

            // TODO 将此处代码放到登录里面，如果是微信登录，将用户openid存入SESSION
            $_SESSION['openid'] = $userInfo['member_wxopenid'];

            // 订单提交成功 根据不同支付方式跳转支付页面
            $this->success('提交订单成功，即将跳转到支付页面', url('home/Member/orderPay', ['order_id' => $order_id]));
        }
    }

    /**
     * 订单支付
     * @return mixed
     */
    public function orderPay()
    {
        $orderId = $this->request->param('order_id', 0);
        $order = M('recharge')->where('pd_id', $orderId)->find();
        $restTime = ($order['pd_add_time'] + 3600) - time();

        if ($restTime < 0){
            // 订单超时 修改订单状态 并跳转
            update_order_status($order['pd_sn'], 5);
            redirect(url('/home/Member/user_order'));
        }

        $this->assign('order', $order);
        $this->assign('restTime', $restTime);
        $this->assign('master_order_sn', '');
        return $this->fetch('order_pay');
    }

    /**
     * 取消订单
     */
    public function cancelOrder()
    {
        if ($this->request->isPost()) {
            $orderId = $this->request->param('order_id');
            $order = M('recharge')->where('pd_id', $orderId)->find();

            if (!$order) {
                // 订单不存在
                $this->error('订单不存在');
            }
            if ($order['pd_member_id'] != $this->user['member_id']) {
                // 不是订单提交者
                $this->error('该订单不属于您');
            }

            $result = M('recharge')->where('pd_id', $orderId)->update(['pd_id' => $orderId, 'pd_order_state' => 3]);

            if(!$result) {
                $this->error('订单取消失败');
            }
            $this->success('订单取消成功');
        }

    }

    /**
     * 用户充值记录列表
     * @return mixed
     */
    public function user_order()
    {
        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);
        $payStatus = $this->request->param('pay_status', 0); // 支付状态 0 所有 1待付款 2已完成
        $pdSn = $this->request->param('pd_sn', 0); // 订单编号
        $map['pd_member_id'] = $this->user['member_id'];

        // 根据订单状态查询订单
        if ($payStatus) {
            if($payStatus == 1){
                // 待付款
                $map['pd_payment_state'] = 0;
            }elseif ($payStatus == 2){
                // 已完成
                $map['pd_payment_state'] = 1;
            }
        }

        // 根据订单编号查询订单
        if($pdSn){
            $map['pd_sn'] = $pdSn;
        }
//        $orders = M('recharge')->where($map)->page($page, $size)->select();
        $rechargeModel = new Recharge();
        $orders = $rechargeModel->where($map)->paginate(15);

        $this->assign('orders', $orders);
        $this->assign('payStatus', $payStatus);

        return $this->fetch('');
    }

    public function user_worship_records()
    {
        $mallWorshipModel = new MallWorship();
        $map = [
            'user_id' => $this->user['member_id'],
            'status' => 1
        ];
        $lists = $mallWorshipModel->where($map)->order('create_at desc')->paginate(15);

        $this->assign('lists', $lists);

        return $this->fetch('');
    }

    /**
     * 删除消费记录
     */
    public function deleteRecords()
    {
        if ($this->request->isPost()) {
            $id = $this->request->post('id');
            $result = Db::name('mall_worship')->delete($id);

            if(!$result) {
                $this->error('删除失败');
            }
            $this->success('删除成功');
        }

    }

    /**
     * 纪念馆管理
     */
    public function user_hall()
    {
        // 我的纪念馆列表
        $hallType = $this->request->param('hall_type', 1);
        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);
        $memberId = $this->user['member_id']; // 获取当前登录用户ID
        $myHallList = HallModel::getDatas($hallType, 0 ,0, 'create_at desc', $page, $size, [], $memberId)['list'];
        $this->assign('myHallList', $myHallList);
//        dump($myHallList);die;
        $this->assign('hallType', $hallType);

        return $this->fetch('');
    }

    /**
     * 纪念馆信息
     * @return mixed
     */
    public function user_hall_info()
    {

        // 获取数据
        $hallId = $this->request->param('id', 0); // 纪念馆ID
        if ($this->request->isGet()) {
            $vo = AdminHallModel::getDataById($hallId, '');
            $this->assign('vo', $vo);
            // 如果不是纪念馆创建者 返回错误提示
            if ($this->user['member_id'] != $vo['hall_member_id']) {
                $this->error('您不是该纪念馆的创建者，无法编辑！');
            }
        }
        return $this->fetch();
    }

    /**
     * 创建纪念馆
     */
    public function user_hall_add()
    {

        $hallId = $this->request->param('id', 0); // 纪念馆ID
        $hallType = $this->request->param('hall_type', 1); // 纪念馆类型 默认为1 1单人馆 2双人馆 3家族馆 4事件馆 5主题馆
        $isFamous = $this->request->param('is_famous', 0); // 是否是名人馆 默认为0 0普通馆 1名人馆


        // TODO window.env
        $env = [
            'hall_type' => $hallType
        ];
        $this->setValueInEnv($env);

        $saveData = [];
        $resPostParams = [];
        if (!empty($this->request->post()) && $this->request->isPost()) {

            $resPostParams = $this->request->post();
            $saveData = check_post_params_in_field('Hall', $resPostParams); // POST 参数过滤

            if ($hallType == 1) {
                // 单人馆 hall_name 为one_name
                $saveData['hall_name'] = empty($resPostParams['one_name']) ? '' : $resPostParams['one_name'];

                if (empty($resPostParams['one_name'])) {
                    $this->error('逝者姓名不能为空');
                }
            }elseif ($hallType == 2) {
                // 双人馆
                if (empty($resPostParams['two_name1'])) {
                    $this->error('逝者1姓名不能为空');
                }
                if (empty($resPostParams['two_name2'])) {
                    $this->error('逝者2姓名不能为空');
                }
            }

            if (empty($saveData['hall_name'])) {
                $this->error('纪念馆名称不能为空');
            }

            if (empty($resPostParams['hall_style'])) {
                $this->error('纪念馆风格不能为空');
            }

            // 纪念馆类型
            $saveData['hall_type'] = $hallType;
        }

        // 纪念馆名人类型 TODO 个人中心是否允许添加名人馆 后期完善

        if ($hallType == 1 && $isFamous) {
            // 名人馆
            $template = 'user_hall_add_one';
            $relationTable = 'hallOne';
            $res = $this->addOne($hallId, $saveData, $resPostParams);
        }elseif ($hallType == 2) {
            // 双人馆
            $template = 'user_hall_add_two';
            $relationTable = 'hallTwo';
            $res = $this->addTwo($hallId, $saveData, $resPostParams);
        }elseif ($hallType == 3) {
            // 家族馆
            $template = 'user_hall_add_family';
            $relationTable = 'hallFamily';
            $res = $this->addFamily($hallId, $saveData, $resPostParams);
        }elseif ($hallType == 4) {
            // 事件馆
            $template = 'user_hall_add_event';
            $relationTable = 'hallEvent';
            $res = $this->addEvent($hallId, $saveData, $resPostParams);
        }elseif ($hallType == 5) {
            // 主题馆
            $template = 'user_hall_add_theme';
            $relationTable = 'hallTheme';
            $res = $this->addTheme($hallId, $saveData, $resPostParams);
        }else {
            // 默认 普通馆
            $template = 'user_hall_add_one';
            $relationTable = 'hallOne';
            $res = $this->addOne($hallId, $saveData, $resPostParams);
        }

        $vo = $assignData = [];

        // POST 请求
        if ($this->request->isPost()) {

            if ($res) {

                // 更新成功
                $this->success('保存成功', 'user_hall');
            }else {
                // 更新失败
                $this->error('保存失败', 'user_hall');
            }
        }

        // GET 请求
        if ($hallId) {
            // 获取数据
            $vo = AdminHallModel::getDataById($hallId, $relationTable);

            // 如果不是纪念馆创建者 返回错误提示
            if ($this->user['member_id'] != $vo['hall_member_id']) {
                $this->error('您不是该纪念馆的创建者，无法编辑！');
            }

            $isFamous = $vo['famous_type']; // 是否名人馆

            // 纪念馆风格名称
            $vo['hall_style_name'] = HallStyle::getNameById($vo['hall_style']);
            // 纪念馆祭拜大厅风格名称
            $vo['hall_worship_style_name'] = HallWorshipStyle::getNameById($vo['hall_worship_style']);
            // 灵牌样式名称
            if (isset($vo['one_lingpai_style'])) {
                $vo['one_lingpai_style_name'] = HallLingpaiStyle::getNameById($vo['one_lingpai_style']);
            }
            if (isset($vo['two_lingpai_style1'])) {
                $vo['two_lingpai_style1_name'] = HallLingpaiStyle::getNameById($vo['two_lingpai_style1']);
            }
            if (isset($vo['two_lingpai_style2'])) {
                $vo['two_lingpai_style2_name'] = HallLingpaiStyle::getNameById($vo['two_lingpai_style2']);
            }
            if (isset($vo['family_lingpai_style'])) {
                $vo['family_lingpai_style_name'] = HallLingpaiStyle::getNameById($vo['family_lingpai_style']);
            }
            // 纪念馆音乐名称
            if (isset($vo['hall_music'])) {
                $vo['hall_music_name'] = HallMusic::getNameById($vo['hall_music']);
            }
        }

        $relationShip = HallModel::getRelationShip(); // 纪念关系
        $nationList = AdminHallModel::getNationList(); // 民族列表
        $lingpaiStyle = AdminHallLingpaiStyle::getDatas(); // 灵牌样式列表
        $hallStyle = AdminHallStyleCategory::getDataByPid($hallType, ['hall_style']); // 纪念馆风格列表
        $hallWorshipStyle = AdminHallStyleCategory::getDataByPid($hallType, ['hall_worship_style']); // 纪念馆祭拜大厅风格列表
        $hallMusic = AdminHallMusic::getDataByPid(); // 音乐列表
        $famousType = AdminHallFamousType::getDatas(); // 名人类型列表

        foreach ($hallStyle as $cKey=>$hallCat) {
            foreach ($hallCat['hall_style'] as $hKey=>$hallStyleItem) {
                $skinDirPath = get_root_url().'/static/home/hall_skins/'.$hallStyleItem['skin_hall_type'].'/'.$hallStyleItem['skin_type'].'/'.$hallStyleItem['skin_dir'].'/';
                $hallStyleItem['style_img'] = $skinDirPath.'jpg.jpg';
            }
        }

        foreach ($hallWorshipStyle as $cKey=>$hallCat) {
            foreach ($hallCat['hall_worship_style'] as $hKey=>$hallStyleItem) {
                $hallStyleItem['style_img'] = get_url_with_domain($hallStyleItem['style_img']);
            }
        }

        foreach ($hallMusic as $cKey=>$hallCat) {
            foreach ($hallCat['music_list'] as $hKey=>$hallMusicItem) {
                $hallMusicItem['music_url'] = get_url_with_domain($hallMusicItem['music_url']);
            }
        }

        foreach ($lingpaiStyle as $hKey=>$lingpaiItem) {
            $lingpaiItem['style_big_img'] = get_url_with_domain($lingpaiItem['style_big_img']);
            $lingpaiItem['style_img'] = get_url_with_domain($lingpaiItem['style_img']);
        }

//        dump($lingpaiStyle);die;
        $assignData = [
            'relationShip' => $relationShip,
            'nationList' => $nationList,
            'lingpaiStyle' => $lingpaiStyle,
            'hall_style' => $hallStyle,
            'hall_worship_style' => $hallWorshipStyle,
            'hall_music' => $hallMusic,
            'famousType' => $famousType,
            'hallType' => $hallType,
            'isFamous' => $isFamous,
            'result' => $res
        ];

        $this->assign('vo', $vo);
        return $this->fetch($template, $assignData);
    }

    public function ajax_load_style()
    {
        $params = $this->request->param();
        $hallType = $params['hall_type'];
        $styleName = $params['style_name'];

        if ($styleName == 'hall_style'){
            // 获取纪念馆风格
            $styleValue = AdminHallStyleCategory::getDataByPid($hallType, ['hall_style']); // 纪念馆风格列表
            $template = '_hall_style_list';
        }elseif($styleName == 'hall_worship_style'){
            // 获取纪念馆大厅风格
            $styleValue = AdminHallStyleCategory::getDataByPid($hallType, ['hall_worship_style']); // 纪念馆祭拜大厅风格列表
            $template = '_hall_worship_style_list';
        }elseif ($styleName == 'hall_music') {
            $styleValue = AdminHallMusic::getDataByPid(); // 音乐列表
            $template = '_hall_music_list';
        }else {
            $styleValue = [];
            $template = '';
        }


        $this->assign($styleName, $styleValue);

        return $this->fetch('member/include/'.$template);

    }


    /**
     * 编辑纪念馆
     */
    public function user_hall_edit()
    {
        return $this->user_hall_add();
    }

    /**
     * 新增/编辑单人馆
     * @param $hallId
     * @param array $hallData
     * @param array $postParams
     * @return false|int
     */
    private function addOne($hallId, $hallData = [], $postParams = [])
    {
        if($this->request->isPost()) {

            // 添加单人馆
            if (empty($hallData['id'])) {
                // 新增操作
                $hallData['hall_member_id'] = $this->user['member_id']; // todo 纪念馆创建者用户ID
                unset($hallData['id']);
            }else {
                // 编辑操作
                unset($postParams['id']);
            }

            $hallOneData = check_post_params_in_field('hallOne', $postParams);
            // 纪念馆名称
            if (!empty($hallOneData['one_name'])) {
                $hallData['hall_name'] = $hallOneData['one_name'];
            }

            $hallData['hallOne'] = $hallOneData;
            $hallModel = new AdminHallModel();

            return $hallModel->saveData($hallId, 'hallOne', $hallData);
        }

        return true;

    }

    /**
     * 新增/编辑双人馆
     * @param $hallId
     * @param array $hallData
     * @param array $postParams
     * @return false|int
     */
    private function addTwo($hallId, $hallData = [], $postParams = [])
    {
        if($this->request->isPost()) {
            // 添加双人馆
            if (empty($hallData['id'])) {
                // 新增操作
                $hallData['hall_member_id'] = $this->user['member_id']; // todo 纪念馆创建者用户ID
                unset($hallData['id']);
            }else {
                // 编辑操作
                unset($postParams['id']);
            }

            $hallTwoData = check_post_params_in_field('hallTwo', $postParams);
            $hallData['hallTwo'] = $hallTwoData;

            $hallModel = new AdminHallModel();
            return $hallModel->saveData($hallId, 'hallTwo', $hallData);
        }
        return true;
    }

    /**
     * 新增/编辑家族馆
     * @param $hallId
     * @param array $hallData
     * @param array $postParams
     * @return false|int
     */
    private function addFamily($hallId, $hallData = [], $postParams = [])
    {
        if($this->request->isPost()) {
            // 添加家族馆
            if (empty($hallData['id'])) {
                // 新增操作
                $hallData['hall_member_id'] = $this->user['member_id']; // todo 纪念馆创建者用户ID
                unset($hallData['id']);
                unset($postParams['id']);
            }else {
                // 编辑操作
                unset($postParams['id']);
            }

            $hallFamilyData = check_post_params_in_field('hallFamily', $postParams);
            $hallData['hallFamily'] = $hallFamilyData;

            $hallModel = new AdminHallModel();
            return $hallModel->saveData($hallId, 'hallFamily', $hallData);
        }
        return true;
    }

    /**
     * 纪念馆状态修改
     */
    public function user_hall_state()
    {
        // 获取数据
        $hallId = $this->request->param('id', 0); // 纪念馆ID

        if ($this->request->isPost()) {
            // POST 请求 保存数据
            $postParams = ajax_url_params_to_array($this->request->param('params'));

            $hallStatus = $postParams['hall_status'];
            $callPassword = trim($postParams['call_password']);

            $result = HallModel::modifyHallState($hallId, $hallStatus, $callPassword);
            if ($result) {
                // 更新成功
                $this->success('保存设置成功', 'user_hall');
            }else {
                // 更新失败
                $this->error('保存设置失败');
            }

        }

        $vo = AdminHallModel::getDataById($hallId, '');
        $this->assign('vo', $vo);

        // 如果不是纪念馆创建者 返回错误提示
        if ($this->user['member_id'] != $vo['hall_member_id']) {
            $this->error('您不是该纪念馆的创建者，无法编辑！');
        }

        return $this->fetch();
    }

    /**
     * 删除纪念馆
     * @param $id
     */
    public function user_hall_delete() {

        $id = $this->request->post('id');
        $hallType = $this->request->post('hall_type');

        if ($hallType == 2) {
            // 双人馆
            $relationTable = 'hallTwo';
        }elseif ($hallType == 3) {
            // 家族馆
            $relationTable = 'hallFamily';
        }elseif ($hallType == 4) {
            // 事件馆
            $relationTable = 'hallEvent';
        }elseif ($hallType == 5) {
            // 主题馆
            $relationTable = 'hallTheme';
        }else {
            // 默认 普通馆
            $relationTable = 'hallOne';
        }

        $hallModel = new AdminHallModel();
        $res =$hallModel->deleteData($id, $relationTable);

        if ($res) {
            $this->success("删除成功！", url('user_hall'));
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     *会员信息管理
     */
    public function user_news()
    {
        return $this->fetch('');
    }

    /**
     * 个人中心图片上传公共方法
     * @return mixed
     */
    public function uploadify(){

        if ($this->request->isPost()) {
            $setting = [
                'driver' => sysconf('storage_type'),
                'root_path' => './static/upload/picture/' // 图片保存路径 默认为'./static/upload/picture/'
            ];
            // 创建目录
            if(!is_dir($setting['root_path'])) {
                @mkdir($setting['root_path'], 0777);
            }

            $info = $this->request->file('file')->move($setting['root_path']);
            if($info){
                // 成功上传后 获取上传信息
                $savePath = substr($setting['root_path'], 1).date('Ymd').'/';
                $saveName = $info->getFilename();

                $data = [
                    'path' => $savePath.$saveName
                ];
                return $this->response(1, $data, '上传成功');
            }else{
                // 上传失败获取错误信息
                return $this->response(0, null, $this->request->file('file')->getError());
            }
        }

    }

}