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

namespace app\home\controller;

use app\common\controller\HomeBase;
use app\home\model\Document as DocumentModel;
use app\home\model\DocumentCategory;

/**
 * 文章控制器
 * Class News
 * @package app\news\controller
 * @author andy <290648237@qq.com>
 * @date 2017/6/15
 */
class News extends HomeBase
{

    /**
     * 文章首页
     * @return mixed
     */
    public function index()
    {
        // 推荐置顶文章
        $recommendList = DocumentModel::getRecommendArticles(1, 6);

        // 最新文章
        $latestRecommendList = DocumentModel::getRecommendArticles(1, 6, 'create_at desc');
        // 图片专栏
        $tpzlList = [];
        for ($i = 1; $i <= 4; $i++) {
            $tpzlList[$i] = DocumentModel::getArticlesByCategoryID(0, 1, 6, 'rand()')['list'];
        }

        // 传统文化列表
        $ctwhList = DocumentModel::getArticlesByCategoryID(2, 1, 6);
        // 民间风俗列表
        $mjfsList = DocumentModel::getArticlesByCategoryID(4, 1, 6);
        // 姓氏文化列表
        $xswhList = DocumentModel::getArticlesByCategoryID(10, 1, 6);
        // 中华美德列表
        $zhmdList = DocumentModel::getArticlesByCategoryID(6, 1, 6);
        // 殡葬文化列表
        $bzwhList = DocumentModel::getArticlesByCategoryID(11, 1, 6);
        // 宗教信仰列表
        $zjxyList = DocumentModel::getArticlesByCategoryID(16, 1, 6);
        // 社会观察列表
        $shgcList = DocumentModel::getArticlesByCategoryID(7, 1, 6);
        // 传统节日列表
        $ctjrList = DocumentModel::getArticlesByCategoryID(8, 1, 6);

        $indexList = [$ctwhList, $mjfsList, $xswhList, $zhmdList, $bzwhList, $zjxyList, $shgcList, $ctjrList];

//        dump($indexList);die;
        // 点击排行列表
        $rankList = DocumentModel::getArticlesByCategoryID(0, 1, 8, 'view desc')['list'];

        $assignData = [
            'recommendList' => $recommendList,
            'latestRecommendList' => $latestRecommendList,
            'tpzlList' => $tpzlList,
            'rankList' => $rankList,
            'indexList' => $indexList
        ];

//        $title = sysconf('web_title') . ' - ' . sysconf('seo_title');

        $title = '云纪念资讯 - '. sysconf('seo_title');

        // SEO
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('', $assignData);
    }

    /**
     * 文章栏目页
     * @return mixed
     */
    public function column()
    {
        $category_id = $this->param['cid'];
        $page = isset($this->param['page']) ? $this->param['page'] : 1;

        // 获取所有分类
        $categoryList = DocumentCategory::getCategoryList([2, 11, 16]);
        $this->assign('categoryList', $categoryList);

        $data = DocumentModel::getArticlesByCategoryID($category_id, $page, 10);
        $pageTotal = $data['pageTotal'];

        $categoryInfo = DocumentCategory::getCategoryInfoByID($category_id);
        $this->assign('categoryInfo', $categoryInfo);

        // 分页参数
        $settings = [
            'page_total' => $pageTotal,
            'base_url' => 'home/News/column',
            'cid_field' => 'cid',
            'cid_value' => $category_id,
            'page_field' => 'page',
            'page_value' => $page,
        ];
        $pageHtml = pagination($settings);
        $this->assign('pageHtml', $pageHtml);

        $this->assign('list', $data['list']);


        // SEO
        $title = $categoryInfo['title'] . ' - ' . sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch();
    }

    /**
     * 获取文章详情
     * @return mixed
     */
    public function detail()
    {
        $id = $this->request->param('id');
        $article = DocumentModel::getArticleByID($id);
        $this->assign('article', $article);

        // 获取所有分类
        $categoryList = DocumentCategory::getCategoryList([2, 11, 16]);
        $this->assign('categoryList', $categoryList);

        // 获取上一篇/下一篇文章
        list($previous, $next) = DocumentModel::getFrontAfterArticles($id);
        $this->assign('previous', $previous);
        $this->assign('next', $next);

        // 访问量 +1
        DocumentModel::setViewInc($id);


        // SEO
        $title = $article['title'] . ' - ' . sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch();
    }
}
