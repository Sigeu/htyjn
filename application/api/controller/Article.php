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
use app\home\model\Document;
use axios\tpr\core\Api;

/**
 * 文章API
 * Class Article
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/16
 */
class Article extends Api
{
    /**
     * andy-文章列表
     * @desc 获取文章列表
     * @method post
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“10”）
     * @response
     */
    public function articleList()
    {
        // 验证参数
        $validate = new BaseValidate();
        list($page, $size) = $validate->checkPaginate();

        $data = Document::getArticleList($page, $size);


        if (!$data) {
            $this->wrong(0, '暂无数据');
        }

        // TODO 文章内容过滤img标签内容
        foreach ($data as $key=>$item) {
            /*$data[$key]['content'] = preg_replace("/<img.*?>/si","", $item['content']);*/
            $data[$key]['content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($item['content'])); //过滤html标签
        }
        $this->response($data);
    }

    /**
     * andy-文章详情
     * @desc 获取文章详情
     * @method post
     * @parameter int article_id 文章ID（必须）
     * @response
     */
    public function articleDetail()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['article_id'])->MustBePostiveInt(['article_id']);

        $articleId = $this->param['article_id'];
        $data = Document::getArticleByID($articleId);

        if (!$data) {
            $this->wrong(0, '文章ID无效');
        }

        $data['content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($data['content'])); //过滤html标签
        $this->response($data);
    }
}
