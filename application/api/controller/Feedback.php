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
use axios\tpr\core\Api;
use think\Db;
use app\api\model\Feedback as FeedbackModel;

/**
 * 意见反馈API
 * Class Feedback
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/08/03
 */
class Feedback extends ApiLogin
{

    /**
     * andy-提交意见反馈
     * @desc 提交意见反馈
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter  string content 反馈内容（必须）
     * @parameter  string mobile 联系方式（必须）
     * @response
     */
    public function feedback()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['content']);

        if ($this->param['content'] == '') {
            $this->wrong(0, '反馈内容不能为空');
        }

        $memberId = $this->user['member_id'];
        $content = $this->param['content'];
        $mobile = !empty($this->param['mobile']) ? $this->param['mobile'] : '';

        $data = [
            'mobile' => $mobile,
            'content' => $content,
            'create_by' => $memberId,
            'create_at' => time()
        ];
        $res = FeedbackModel::createData($data);

        if (!$res) {
            $this->wrong(0, '提交反馈失败');
        }

        $this->response($res, 200, '提交反馈成功');
    }
}
