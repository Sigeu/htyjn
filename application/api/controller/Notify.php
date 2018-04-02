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
use app\lib\exception\BaseException;
use axios\tpr\core\Api;
use app\api\model\Goods as GoodsModel;
use app\api\model\Hall as HallModel;
use think\Db;

/**
 * 通知接口
 * Class Notify
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/9/12
 */
class Notify extends Api
{
    /**
     * andy-支付宝支付通知
     * @desc 支付宝支付通知
     * @method post
     * @response
     */
    public function notifyUrl()
    {

        $params = $this->request->param();

        vendor('alipay.AopSdk');
        $aop = new \AopClient();
        $aop->alipayrsaPublicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6NQb02edVzy3tPR4PM9EyaKm5/NZJl1e3luInIozY6ciJVPgddCXPQhG2aHoLyGu+sLU/7/Eo9//khWvt0uz00MckI7WULDfUDST3Eu5qpkO7r2s1vJE9M32bgUzHQxCUxdJ7744MwyEf2ayqwh2tB8gaqlkBbyPdGH7y1+oxcIYcip5SZQrEFjGK9JYmvgj9dO1Mpkx3AvQ6RE+OmHl2Bqai/C1mPizisRaUZaKjnEMQqPNK+xmKkqYPdIQC8GHCn+gzHqRugsORiyWXAa17ZVG/8CGonccESVVEJ6XiHIVd1yHu9kHWbJ+xea71yJ3WjNcGlxzigwQJuCzhC5+DwIDAQAB';
        $flag = $aop->rsaCheckV1($params, NULL, "RSA2");

        if($flag) //验证成功
        {
            $order_sn = $out_trade_no = $params['out_trade_no']; //商户订单号
            $trade_no = $params['trade_no']; //支付宝交易号
            $trade_status = $params['trade_status']; //交易状态

            $order_amount = M('recharge')->where(['pd_sn'=>"$order_sn"])->value('pd_amount');
            if($order_amount != $params['total_amount'])
                exit("fail"); //验证失败
            // 支付宝解释: 交易成功且结束，即不可再做任何操作。
            if($trade_status == 'TRADE_FINISHED')
            {
                update_pay_status($order_sn, array('transaction_id'=>$trade_no)); // 修改订单支付状态
            }
            //支付宝解释: 交易成功，且可对该交易做操作，如：多级分润、退款等。
            elseif ($trade_status == 'TRADE_SUCCESS')
            {
                update_pay_status($order_sn,array('transaction_id'=>$trade_no)); // 修改订单支付状态
            }
            echo "success"; // 告诉支付宝处理成功
        }
        else
        {
            echo "fail"; //验证失败
        }

    }

    /**
     *
     * andy-App微信支付通知url
     * @desc App微信支付通知url
     * @method post
     * @response
     */
    public function wxNotifyUrl()
    {

        require_once(PLUGIN_PATH."payment/weixin/lib/WxPay.Api.php"); // 微信扫码支付demo 中的文件
        require_once(PLUGIN_PATH."payment/weixin/lib/WxPay.Config.php"); // 微信扫码支付demo 中的文件
        require_once(PLUGIN_PATH."payment/weixin/example/WxPay.NativePay.php");
        require_once(PLUGIN_PATH."payment/weixin/example/WxPay.JsApiPay.php");

        $paymentPlugin = M('Plugin')->where("code='weixin' and  type = 'payment' ")->find(); // 找到微信支付插件的配置
        $config_value = unserialize($paymentPlugin['config_value']); // 配置反序列化

        \WxPayConfig::$appid = "wx22dae441c8ca9034"; //sysconf('app_app_id'); // * APPID：绑定支付的APPID（必须配置，开户邮件中可查看）
        \WxPayConfig::$mchid = "1488448322"; //$config_value['mchid']; // * MCHID：商户号（必须配置，开户邮件中可查看）
        \WxPayConfig::$smchid = isset($config_value['smchid']) ? $config_value['smchid'] : ''; // * SMCHID：服务商商户号（必须配置，开户邮件中可查看）
        \WxPayConfig::$key = "58DE88613365543D0A41F78AEA00AAAD"; //$config_value['key']; // KEY：商户支付密钥，参考开户邮件设置（必须配置，登录商户平台自行设置）
//        \WxPayConfig::$appsecret = $config_value['appsecret']; // 公众帐号secert（仅JSAPI支付的时候需要配置)，


        require_once(PLUGIN_PATH."payment/weixin/example/notify.php");
        $notify = new \PayNotifyCallBack();
        $notify->Handle(false);
    }
}
