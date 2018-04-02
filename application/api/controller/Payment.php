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

use app\api\validate\BaseValidate;
use app\common\controller\ApiLogin;
use think\Env;

/**
 * 支付API
 * Class Payment
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/09/15
 */
class Payment extends ApiLogin
{

    /**
     * andy-支付宝支付
     * @desc 支付宝支付
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 充值套餐id（必须）
     * @response
     */
//    public function weixinOrder333()
//    {
//
//        require_once(PLUGIN_PATH."payment/weixin/lib/WxPay.Api.php"); // 微信扫码支付demo 中的文件
//        require_once(PLUGIN_PATH."payment/weixin/lib/WxPay.Config.php"); // 微信扫码支付demo 中的文件
//        require_once(PLUGIN_PATH."payment/weixin/example/WxPay.NativePay.php");
//        require_once(PLUGIN_PATH."payment/weixin/example/WxPay.JsApiPay.php");
//
//        $paymentPlugin = M('Plugin')->where("code='weixin' and  type = 'payment' ")->find(); // 找到微信支付插件的配置
//        $config_value = unserialize($paymentPlugin['config_value']); // 配置反序列化
//
//        \WxPayConfig::$appid = "wx22dae441c8ca9034"; //sysconf('app_app_id'); // * APPID：绑定支付的APPID（必须配置，开户邮件中可查看）
//        \WxPayConfig::$mchid = "1488448322"; //$config_value['mchid']; // * MCHID：商户号（必须配置，开户邮件中可查看）
//        \WxPayConfig::$smchid = isset($config_value['smchid']) ? $config_value['smchid'] : ''; // * SMCHID：服务商商户号（必须配置，开户邮件中可查看）
//        \WxPayConfig::$key = "58DE88613365543D0A41F78AEA00AAAD"; //$config_value['key']; // KEY：商户支付密钥，参考开户邮件设置（必须配置，登录商户平台自行设置）
////        \WxPayConfig::$appsecret = $config_value['appsecret']; // 公众帐号secert（仅JSAPI支付的时候需要配置)，
//
//        $id = $this->request->param('id', 0);
//
//        if(!$id) {
//            $this->wrong('套餐ID无效');
//        }
//
//        $order = $this->generateOrder($id); // 生成订单
//
//        $notify_url = get_root_url().url('/api/Notify/wxNotifyUrl'); // 接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
//
//        $input = new \WxPayUnifiedOrder();
//        $input->SetBody("云纪念商城"); // 商品描述
//        $input->SetAttach("weixin"); // 附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
//        $input->SetOut_trade_no($order['pd_sn'].time()); // 商户系统内部的订单号,32个字符内、可包含字母, 其他说明见商户订单号
//        $input->SetTotal_fee($order['pd_amount']*100); // 订单总金额，单位为分，详见支付金额
//        $input->SetNotify_url($notify_url); // 接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
//        $input->SetTrade_type("APP"); // 交易类型   取值如下：JSAPI，NATIVE，APP，详细说明见参数规定    NATIVE--原生扫码支付
//        $input->SetProduct_id($order['pd_id']); // 商品ID trade_type=NATIVE，此参数必传。此id为二维码中包含的商品ID，商户自行定义。
//        $input->SetSign();
//
//        $result = \WxPayApi::unifiedOrder($input);
//
//        $this->response($result, 200, '获取成功');
//
//    }

    /**
     * andy-微信支付
     * @desc 微信支付
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 充值套餐id（必须）
     * @response
     */
    public function weixinOrder()
    {
        vendor('wechat.WechatAppPay');

        $paymentPlugin = M('Plugin')->where("code='weixin' and  type = 'payment' ")->find(); // 找到微信支付插件的配置
        $config_value = unserialize($paymentPlugin['config_value']); // 配置反序列化

        //填写配置参数
        $options = array(
            'appid' 	=> 	'wx22dae441c8ca9034',//sysconf('app_app_id'),		//填写微信分配的公众开放账号ID
            'mch_id'	=>	'1488448322', //$config_value['mchid'],				//填写微信支付分配的商户号
            'notify_url'=>	get_root_url().url('/api/Notify/wxNotifyUrl'),	//填写微信支付结果回调地址
            'key'		=>	'58DE88613365543D0A41F78AEA00AAAD' //$config_value['key']				//填写  商户支付密钥Key。审核通过后，在微信发送的邮件中查看
        );

        $id = $this->request->param('id', 0);

        if(!$id) {
            $this->wrong('套餐ID无效');
        }

        $order = $this->generateOrder($id, 'weixin'); // 生成订单

        //统一下单方法
        $wechatAppPay = new \wechatAppPay($options);
        $params['body'] = "云纪念商城";						//商品描述
        $params['out_trade_no'] = $order['pd_sn'];	//自定义的订单号
        $params['total_fee'] = $order['pd_amount'] * 100;					//订单金额 只能为整数 单位为分
        $params['trade_type'] = 'APP';					//交易类型 JSAPI | NATIVE | APP | WAP
        $result = $wechatAppPay->unifiedOrder( $params );
//        print_r($result);
        //创建APP端预支付参数
        $data = $wechatAppPay->getAppPayParams( $result['prepay_id'] );

//        print_r($data);
        $this->response($data, 200, '获取成功');

    }


    /**
     * andy-支付宝支付
     * @desc 支付宝支付
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 充值套餐id（必须）
     * @response
     */
    public function alipayOrder()
    {
        vendor('alipay.AopSdk');

        $id = $this->request->param('id', 0);

        if(!$id) {
            $this->wrong('套餐ID无效');
        }
//        $rechargeInfo = M('RechargePackage')->where('id', $id)->find();
//        $rechargeTotal = sprintf("%.2f", $rechargeInfo['price']); // 充值金额
//
//        if (!$rechargeInfo) {
//            $this->wrong('套餐不存在');
//        }
//
//        // 生成订单
//        $totalCoins = $rechargeInfo['price']*100 + $rechargeInfo['donate']; // 纪念币总数
//        // 生成订单
//        $order = [
//            'pd_sn' => date('YmdHis').rand(1000,9999), // 订单编号
//            'pd_member_id' => $this->user['member_id'], // 登录用户ID
//            'pd_goods_id' => $id, // 充值套餐ID
//            'pd_goods_name' => $rechargeInfo['name'], // 充值套餐ID
//            'pd_member_name' => $this->user['member_nickname'], //用户名称
//            'pd_amount' => $rechargeTotal, // 充值金额
//            'pd_coins' => $totalCoins, // 充值纪念币总数
//            'pd_add_time' => time(), // 订单添加时间
//            'pd_payment_state' => 0, // 订单支付状态
//            'pd_payment_code' => 'alipay', // 支付方式
//            'pd_payment_name' => 'App端支付', // 支付方式名称
//        ];
//        $order_id = M('Recharge')->insertGetId($order);
//
//        if(!$order_id){
//            $this->wrong('生成订单失败');
//        }

        $order = $this->generateOrder($id, 'alipay'); // 生成订单


        $aop = new \AopClient();
        $aop->gatewayUrl = "https://openapi.alipay.com/gateway.do";
        $aop->appId = "2017082808424094";
        $aop->rsaPrivateKey = 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQChVo9qQH+PeY3MtvdlAMUIDCmmUL3N7KFvfsruhJGCtTP8yjz6BI0xqVy15MEKIdAmAdoutyv9acadYXKjuBbzwNO3GZmnvMT1jxunNHe8Yeb36lOBRFNNwsWivZ1BIYtx/0JeiMWNrociYSJ5O8WsuDuzP9SymL+aZKQKoq52SQ4YmBrQTRqFDgRRTPGlOkOywAZZUecGBN7PVEXEJyLZJtyW40iQg/pNl12vYJSBwMIRYMpdOmilFZJ+Ee++DrhanRY05qUuKu+cVCn5scpCa2U2qrPUAI0NOTZnz0hVT5KLCfOdKZ3J5YKvGpV8BQlvHd3NjmySl9X1IO3rM/mtAgMBAAECggEAKmO2zKDjowu54PaVq5j3K7UeYE9If0lT5Rp4MRDttlzrqthsCviVLF4mOLhAq+vUZ5gG/k0sJqnbAFCxMSjWBvc76Ri10Wd8jFQsXNMhPoKuj6amiAkupfituqN9JLauj6YUhwgCd8ZKRRMmXpoAxu+k5+S2erI9bVBR9WVm1zbRAk+w9G8suuzj52SMnAjzabA7D3EZYkIeMfEIZ0nzk7TD5ExUpu5jqXCSdL5PaS8iVxttLFySQ1uFwxvVciLKjw0BORXazWZUlA4V5dc1JuYXNTTbbMbZj8dS0Ql/flwLbk4qVes7oXobpV5V980LVLkmRJ+JZwlY8Hp3gq0y4QKBgQDliOXV7O+ka7JM52Y5J/K4ozdKxesQPPThzUFO9RxyPd02FvVLRRWEbgV3NubFP6jQthiSHKAznv4N6MXsJZp9LxVkOquaOIHKM4wv3lX/LfPja7ec+EJgb9gai7eX4nOdN6WsGq4bChME4JoP15XopLqOjciOp1eS2XDfTxeyKQKBgQCz8LmM1EILKDdiIXI4cYp0ShJsKNhtgTdZpTWk9aHJyDJb++AAAvAb/PlVZ9uPTnwYkqqQD8/LYLnhwxRQGmQD9IrbnpKVR/qehwa3ubk0YijjHBRWilruFqODH2RhuntajU5Lwq+VLJhjYWBYHdrp/kC2p5B+Lg2y5eB+sTYj5QKBgBuT4RlcyEYW8msu+icv14e7hG8lbGKdEEb45DnaVTqcmDFhfMM4X6dzmJCENiHIzj2VQ0p6yfypw5hkOTNwKSmVOJq8OdXjqCRlIRi3O9nW6ZCPZpYjdcYkafB2jO5gtMdU4kDVS8nP4g0Z9yikHEzBTfDGtCv/ixQHr/oEhLJRAoGAMIKBQ1olw+Q/qhDiPh09+kPN26LXVg4z4dMMN0CRMVjrWqj4pogkOydkAIZTRrsd8XH40YWxu16EPjzdSQsUU4ylsrd5RQ12ny4/vWAwcdLUuwVi5kG+adlok3zvDvm7L5pQtVPzCgBPxNsHojnKPrLwt01NQvcfck9Oylj0A5ECgYAc6hmurDToFhbQ4eTJkV9CO8yHYgyrGn/B+Nx31sw0krJsnf8Ho14Zxx6lXwW1Erz2ol2njCIDnp43zmOirz0HgNQu+QC8RA4JbP5OFFJb8tspeUwLTDZy9q5iWZrkW3f5AR3lplEmIawdmi0TwwNXAQWB/sFjcuoMejBcdwvz1Q==';
        $aop->charset = "utf-8";
        $aop->signType = "RSA2";
        $aop->alipayrsaPublicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6NQb02edVzy3tPR4PM9EyaKm5/NZJl1e3luInIozY6ciJVPgddCXPQhG2aHoLyGu+sLU/7/Eo9//khWvt0uz00MckI7WULDfUDST3Eu5qpkO7r2s1vJE9M32bgUzHQxCUxdJ7744MwyEf2ayqwh2tB8gaqlkBbyPdGH7y1+oxcIYcip5SZQrEFjGK9JYmvgj9dO1Mpkx3AvQ6RE+OmHl2Bqai/C1mPizisRaUZaKjnEMQqPNK+xmKkqYPdIQC8GHCn+gzHqRugsORiyWXAa17ZVG/8CGonccESVVEJ6XiHIVd1yHu9kHWbJ+xea71yJ3WjNcGlxzigwQJuCzhC5+DwIDAQAB';

        $request = new \AlipayTradeAppPayRequest();
        $bizcontent = [
            'body' => $order['pd_goods_name'],
            'subject' => '云纪念商城',
            'out_trade_no' => $order['pd_sn'],
            'timeout_express' => '30m',
            'seller_id' => '',
            'total_amount' => $order['pd_amount'],
            'product_code' => 'QUICK_MSECURITY_PAY'
        ];

        $notifyUrl = Env::get('web.host').'api/Notify/notifyUrl';
        $request->setNotifyUrl($notifyUrl); // 通知url
        $request->setBizContent(json_encode($bizcontent));

        $response = $aop->sdkExecute($request);

        $this->response($response, 200, '获取成功');
    }

    /**
     * andy-苹果支付验证
     * @desc 苹果支付验证
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int apple_receipt 苹果内购的验证收据（必须）
     * @response
     */
    public function appleVerify()
    {

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['apple_receipt']);

        $apple_receipt = $this->param['apple_receipt']; //苹果内购的验证收据,由客户端传过来
        $jsonData = array('receipt-data' => $apple_receipt);//这里本来是需要base64加密的，我这里没有加密的原因是客户端返回服务器端之前，已经作加密处理
        $jsonData = json_encode($jsonData);
        $url = 'https://buy.itunes.apple.com/verifyReceipt';  // 正式验证地址
//        $url = 'https://sandbox.itunes.apple.com/verifyReceipt'; // 测试验证地址
        $response = $this->http_post_data($url,$jsonData);
        if($response->{'status'} == 0){
            // todo 验证成功 表示已经支付成功 生成订单
            $id = substr($response->{'receipt'}->{'in_app'}[0]->{'product_id'}, 11);
            $trade_no = $response->{'receipt'}->{'in_app'}[0]->{'transaction_id'};
            $order = $this->generateOrder($id, 'ios内购');
            update_pay_status($order['pd_sn'], array('transaction_id'=>$trade_no)); // 修改订单支付状态

            $this->response($id, 200, '验证成功');
        }else{
            $this->wrong(0, '验证失败');
        }

    }

    /**
     * andy-苹果支付类型
     * @desc 苹果支付验证
     * @method post
     * @parameter string token 用户token（必须）
     * @response
     */
    public function applePayType()
    {
        $typeArr = [
            'apple_shopping' => 1, // 苹果内购
            'third_party' => 2 // 第三方支付
        ];

        $this->response($typeArr['apple_shopping']);
    }

    /**
     * curl请求苹果app_store验证地址
     *
     * @param $url
     * @param $data_string
     * @return mixed
     */
    private function http_post_data($url, $data_string) {
        $curl_handle=curl_init();
        curl_setopt($curl_handle,CURLOPT_URL, $url);
        curl_setopt($curl_handle,CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl_handle,CURLOPT_HEADER, 0);
        curl_setopt($curl_handle,CURLOPT_POST, true);
        curl_setopt($curl_handle,CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($curl_handle,CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl_handle,CURLOPT_SSL_VERIFYPEER, 0);
        $response_json =curl_exec($curl_handle);
        $response =json_decode($response_json);
        curl_close($curl_handle);
        return $response;
    }

    public function generateOrder($id, $payType)
    {
        $rechargeInfo = M('RechargePackage')->where('id', $id)->find();

        if (!$rechargeInfo) {
            $this->wrong('套餐不存在');
        }

        // 生成订单
        $totalCoins = $rechargeInfo['price']*100 + $rechargeInfo['donate']; // 纪念币总数
        // 生成订单
        $order = [
            'pd_sn' => date('YmdHis').rand(1000,9999), // 订单编号
            'pd_member_id' => $this->user['member_id'], // 登录用户ID
            'pd_goods_id' => $id, // 充值套餐ID
            'pd_goods_name' => $rechargeInfo['name'], // 充值套餐名称
            'pd_member_name' => $this->user['member_nickname'], //用户名称
            'pd_amount' => sprintf("%.2f", $rechargeInfo['price']), // 充值金额
            'pd_coins' => $totalCoins, // 充值纪念币总数
            'pd_add_time' => time(), // 订单添加时间
            'pd_payment_state' => 0, // 订单支付状态
            'pd_payment_code' => $payType, // 支付方式
            'pd_payment_name' => 'App端支付', // 支付方式名称
        ];
        $order['pd_id'] = $order_id = M('Recharge')->insertGetId($order);

        if(!$order_id){
            $this->wrong('生成订单失败');
        }

        return $order;
    }



}
