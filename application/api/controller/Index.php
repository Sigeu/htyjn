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

use app\common\controller\ApiLogin;
use app\api\model\Hall as HallModel;
use app\home\model\Document;
use think\Db;

/**
 * 接口类名
 * @desc 接口类描述
 * @package app\index\controller
 */
class Index extends ApiLogin
{

    /**
     * andy-App端首页数据接口
     * @desc App端首页数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @response
     */
    public function appIndexData()
    {
        // 纪念馆
        $loginUid = $this->user['member_id'];
        $hallList = HallModel::getHallList($loginUid, 0, 0, 'create_at'.' desc', 1, 4, ['hall_style', 'hall_worship_style', 'hall_music']);

        // 纪念资讯
        $recNewsList = Document::getRecommendArticles(1, 6);
        $latestNewsList = Document::getRecommendArticles(1, 2, 'create_at desc');

        $requestUrl = file_get_contents('http://b.yjn100.com/mobile/index.php?act=goods&op=goods_list&gc_id=1057&page=4');
        $data = json_decode($requestUrl, true);
        $bzypList = [];
        if ($data['page_total']) {
            $bzypList = $data['datas']['goods_list'];
        }
        //公墓商城
        $tomb=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('rand()')->limit(4)->select();
        if ($tomb) {
            foreach ($tomb as $key=>$item) {
                $tomb[$key]['image_id'] = get_url_with_domain($item['image_id']);
                $tomb[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$item['create_by'],'status'=>1,'grave_id'=>$item['id']])->select();

                foreach ($tomb[$key]['slider'] as $skey=>$value){
                    $tomb[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
                }
            }
        }
        $data = [
            'hall_list' => $hallList,
            'rec_news_list' => $recNewsList,
            'latest_news_list' => $latestNewsList,
            'bzyp_list' => $bzypList,// 殡葬用品
            'tomb'=>$tomb
        ];

        $this->response($data, 200, '获取数据成功');
    }

    /**
     * andy-App端纪念馆首页数据接口
     * @desc App端纪念馆首页数据接口
     * @method post
     * @parameter int hall_type 纪念馆类型（可选默认为“0”）__如果传入“12”表示普通单人馆和双人馆
     * @parameter int is_famous 是否名人馆（可选默认为“0”）__0-所有__1-名人__2-普通个人馆
     * @parameter string token 用户token（必须）
     * @response
     */
    public function appHallIndexData()
    {
        // 纪念馆
        $hallType = $this->request->param('hall_type', 1);
        $isFamous = $this->request->param('is_famous', 0);
        $loginUid = $this->user['member_id'];
        $hallList = HallModel::getHallList($loginUid, $hallType, 0, 'create_at'.' desc', 1, 4, ['hall_style', 'hall_worship_style', 'hall_music'], '', $isFamous);

        // 追思文选
//        $recArticleList = HallModel::hallArticleList($hallType, $isFamous, 1, 6, 'rand()');
//        $articleList = HallModel::hallArticleList($hallType, $isFamous, 1, 4);
        // 纪念资讯
        $recNewsList = Document::getRecommendArticles(1, 6);
        $latestNewsList = Document::getRecommendArticles(1, 4, 'create_at desc');

        // 纪念馆排行
        $rankList = HallModel::getHallList($loginUid, $hallType, 0, 'memorial_value'.' desc', 1, 5, ['hall_style', 'hall_worship_style', 'hall_music'], '', $isFamous);

        $data = [
            'hall_list' => $hallList,
            'rec_news_list' => $recNewsList,
            'latest_news_list' => $latestNewsList,
            'rank_list' => $rankList
        ];

        $this->response($data, 200, '获取数据成功');
    }
}