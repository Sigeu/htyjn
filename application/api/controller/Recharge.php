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

use app\api\model\RechargePackage;
use app\api\validate\BaseValidate;
use app\common\controller\ApiLogin;

/**
 * 充值API
 * Class Recharge
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/08/07
 */
class Recharge extends ApiLogin
{
    /**
     * andy-纪念币充值套餐列表
     * @desc 获取纪念币充值套餐列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“10”）
     * @response
     */
    public function rechargePackageList()
    {
        // 验证参数
        $validate = new BaseValidate();
        list($page, $size) = $validate->checkPaginate();

        $memberId = $this->user['member_id'];
        $data = RechargePackage::getDatas($page, $size, $memberId);


        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        $this->response($data);
    }

    /**
     * andy-纪念币充值套餐详情
     * @desc 获取纪念币充值套餐详情
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int package_id 套餐ID（必须）
     * @response
     */
    public function rechargePackageDetail()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['package_id'])->MustBePostiveInt(['package_id']);

        $packageId = $this->param['package_id'];
        $data = RechargePackage::getDataById($packageId);

        if (!$data) {
            $this->wrong(0, '套餐ID无效');
        }
        $this->response($data);
    }
}
