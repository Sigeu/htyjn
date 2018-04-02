<?php
include 'wechatAppPay.class.php';
//填写配置参数
$options = array(
	'appid' 	=> 	'',		//填写微信分配的公众开放账号ID
	'mch_id'	=>	'',				//填写微信支付分配的商户号
	'notify_url'=>	'http://www.baidu.com/',	//填写微信支付结果回调地址
	'key'		=>	''				//填写  商户支付密钥Key。审核通过后，在微信发送的邮件中查看
);
//统一下单方法
$wechatAppPay = new wechatAppPay($options);
$params['body'] = '商品描述';						//商品描述
$params['out_trade_no'] = '1217752501201407';	//自定义的订单号
$params['total_fee'] = '100';					//订单金额 只能为整数 单位为分
$params['trade_type'] = 'APP';					//交易类型 JSAPI | NATIVE | APP | WAP 
$result = $wechatAppPay->unifiedOrder( $params );
print_r($result);
//创建APP端预支付参数
/** @var TYPE_NAME $result */
$data = @$wechatAppPay->getAppPayParams( $result['prepay_id'] );

print_r($data);

?>