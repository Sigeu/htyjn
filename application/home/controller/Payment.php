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
use app\common\controller\HomeBase;
use think\Request;

/**
 * 支付控制器
 * Class Payment
 * @package app\home\controller
 * @author @author andy <290648237@qq.com>
 * @date 2017/8/25
 */
class Payment extends HomeBase {
    
    public $payment; //  具体的支付类
    public $pay_code; //  具体的支付code
 
    /**
     * 析构流函数
     */
    public function  __construct(Request $request = null) {
        parent::__construct($request);


        // tpshop 订单支付提交
//        $resPostParams = ajax_url_params_to_array($this->param['params']);

//        $pay_radio = !empty($request['pay_radio']) ? $request['pay_radio'] : '';
        $pay_radio = $this->request->param('pay_radio', 0);

        if($pay_radio)
        {
            $pay_radio = parse_url_param($pay_radio);
            $this->pay_code = $pay_radio['pay_code']; // 支付 code
        }
        else // 第三方 支付商返回
        {
            //file_put_contents('./a.html',$_GET,FILE_APPEND);
            $this->pay_code = $this->request->param('pay_code');
            unset($_GET['pay_code']); // 用完之后删除, 以免进入签名判断里面去 导致错误
        }


        //获取通知的数据
//        $xml = $GLOBALS['HTTP_RAW_POST_DATA'];
        
        if(empty($this->pay_code))
            exit('pay_code 不能为空');
        // 导入具体的支付类文件
        //             include(PLUGIN_PATH.$k.'/'.$v2.'/config.php');
        include_once  PLUGIN_PATH.'payment/'.$this->pay_code.'/'.$this->pay_code.'.class.php';
        $code = '\\'.$this->pay_code; // \alipay
        $this->payment = new $code();
    }
   
    /**
     * tpshop 提交支付方式
     */
    public function getCode(){
        //C('TOKEN_ON',false); // 关闭 TOKEN_ON
        header("Content-type:text/html;charset=utf-8");
//        $resPostParams = ajax_url_params_to_array($this->param['params']);
//        $order_id = $resPostParams['order_id']; // 订单id
        $order_id = I('order_id/d'); // 订单id
        session('order_id',$order_id); // 最近支付的一笔订单 id
        // 修改订单的支付方式
        $payment_arr = M('Plugin')->where('type', 'payment')->column("code, name");

        M('Recharge')->where("pd_id", $order_id)->update(array('pd_payment_code'=>$this->pay_code,'pd_payment_name'=>$payment_arr[$this->pay_code]));

        $order = M('Recharge')->where("pd_id", $order_id)->find();

//        if($this->request->isPost()){
//            // 订单已经完成
//            if($order['pd_payment_state'] == 1){
//                return $this->error('此订单，已完成支付!', url('/home/Member/user_order'));
//            }
//            // 如果订单创建时间小于当前时间减去1小时，则订单已超时，关闭订单
//            if($order['pd_add_time'] + 3600 < time()){
//                update_order_status($order['pd_sn'], 5); // 5 订单已作废（订单超时）
//                return $this->error('订单因超时未支付，已自动关闭', url('/home/Member/user_order'));
//            }
//        }


        $config_value = $this->pay_code;

        //微信JS支付
        if($this->pay_code == 'weixin' && $_SESSION['openid'] && strstr($_SERVER['HTTP_USER_AGENT'],'MicroMessenger')){
           $code_str = $this->payment->getJSAPI($order,$config_value);
           exit($code_str);
        }else{
            $code_str = $this->payment->get_code($order,$config_value);
        }
        $this->assign('code_str', $code_str);
        $this->assign('order_id', $order_id);
        $this->assign('master_order_sn', '');

        return $this->fetch('payment');  // 分跳转 和不 跳转
    }

//    public function getPay(){
//    	//C('TOKEN_ON',false); // 关闭 TOKEN_ON
//    	header("Content-type:text/html;charset=utf-8");
//    	$order_id = I('order_id/d'); // 订单id
//        session('order_id',$order_id); // 最近支付的一笔订单 id
//    	// 修改充值订单的支付方式
//    	$payment_arr = M('Plugin')->where("`type` = 'payment'")->getField("code,name");
//
//    	M('recharge')->where("order_id", $order_id)->save(array('pay_code'=>$this->pay_code,'pay_name'=>$payment_arr[$this->pay_code]));
//    	$order = M('recharge')->where("order_id", $order_id)->find();
//    	if($order['pay_status'] == 1){
//    		$this->error('此订单，已完成支付!');
//    	}
//    	$pay_radio = $_REQUEST['pay_radio'];
//    	$config_value = parse_url_param($pay_radio); // 类似于 pay_code=alipay&bank_code=CCB-DEBIT 参数
//        $order['order_amount'] = $order['account'];
//    	$code_str = $this->payment->get_code($order,$config_value);
//    	//微信JS支付
//    	if($this->pay_code == 'weixin' && $_SESSION['openid'] && strstr($_SERVER['HTTP_USER_AGENT'],'MicroMessenger')){
//    		$code_str = $this->payment->getJSAPI($order,$config_value);
//    		exit($code_str);
//    	}
//    	$this->assign('code_str', $code_str);
//    	$this->assign('order_id', $order_id);
//    	return $this->fetch('recharge'); //分跳转 和不 跳转
//    }
    
    // 服务器点对点 // http://www.tp-shop.cn/index.php/Home/Payment/notifyUrl        
    public function notifyUrl(){            
        $this->payment->response();            
        exit();
    }

    // 页面跳转 // http://www.tp-shop.cn/index.php/Home/Payment/returnUrl        
    public function returnUrl(){

        $result = $this->payment->respond2(); // $result['order_sn'] = '201512241425288593';

        $order = M('recharge')->where("pd_sn", $result['order_sn'])->find();
        if(empty($order)) // order_sn 找不到 根据 order_id 去找
        {
            $order_id = session('order_id'); // 最近支付的一笔订单 id        
            $order = M('recharge')->where("pd_id", $order_id)->find();
        }

        $this->assign('order', $order);

        if($result['status'] == 1)
            return $this->fetch('success');   
        else
            return $this->fetch('error');   
    }                
}
