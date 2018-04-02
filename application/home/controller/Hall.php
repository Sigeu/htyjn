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

use app\api\model\HallArticle;
use app\api\model\HallFamousType;
use app\api\model\HallLeaveMessage;
use app\api\model\HallSurnames;
use app\api\model\MallWorship;
use app\api\model\MemberModel;
use app\common\controller\HomeBase;
use app\api\model\Hall as HallModel;
use app\home\model\Document as DocumentModel;
use app\home\model\Document;
use app\home\model\Links as LinksModel;
use service\LunarService;
use think\Db;


/**
 * 纪念馆控制器
 * Class Hall
 * @package app\home\controller
 * @author andy <290648237@qq.com>
 * @date 2017/7/8
 */
class Hall extends HomeBase {



    /***************************** 纪念馆频道页 *****************************/

    /**
     * 纪念馆列表
     * @return mixed
     */
    public function hallList()
    {
        $hallType = $this->request->param('hall_type', 1);
        $isFamous = $this->request->param('is_famous', 0);
        $famousType = $this->request->param('famous_type', 0);
        $page = $this->request->param('page', 1);

        if ($hallType == 1 && $famousType) {
            // 名人馆
            $famousTypeName = HallFamousType::getTypeNameById($famousType);
            $searchTitle = $famousTypeName.'纪念馆';
            $isFamous = true;
        }elseif ($hallType == 2) {
            // 双人馆
            $searchTitle = '双人馆列表';
        }else {
            // 单人馆
            $searchTitle = '个人馆列表';
        }

        $data = HallModel::getDatas($hallType, $isFamous, $famousType, '', $page, 10);

        $hotFamousList = HallModel::getDatas(1, 1, 0, 'memorial_value desc', 1, 9);

        $settings = [
            'keyword' => '',
            'page_total' => $data['page'],
            'base_url' => 'hall/hallList',
            'page_value' => $page,
        ];
        $pageHtml = $this->hallListPagenation($settings);

        $this->assign('data', $data['list']);
        $this->assign('pageHtml', $pageHtml);
        $this->assign('hotFamousList', $hotFamousList['list']);
        $this->assign('searchTitle', $searchTitle);
        $this->assign('hallType', $hallType);

        return $this->fetch('hall_list');
    }

    /**
     * 纪念馆列表分页
     * @param array $settings
     * @return string
     */
    private function hallListPagenation($settings = []) {

        $page = $settings['page_value'];
        $pageTotal = $settings['page_total'];

        //分页
        $num = 7; //需要显示的最多页数
        $num = min($pageTotal, $num); //处理显示的页码数大于总页数的情况
        $end = $page + floor($num/2) <= $pageTotal ? $page + floor($num/2) : $pageTotal; //计算结束页号
        $start = $end - $num + 1; //计算开始页号
        if($start < 1) { //处理开始页号小于1的情况
            $end -= $start - 1;
            $start = 1;
        }

        $pageHtml = '';

        if($pageTotal > 1){
            if($page > 1) {
                $pageHtml .="<li><a href='".url($settings['base_url'], ['keyword' => $settings['keyword'], 'page' => ($page - 1)])."'>«</a></li>";
            }else {
                $pageHtml .= "<li><a href='javascript:void(0);'>«</a></li>";
            }

            for($i = $start; $i <= $end; $i++){
                if($i == $page){
                    $pageHtml .= '<li class="active"><a href="javascript:;">'.$i.'</a></li>';
                }else{
                    $pageHtml .= '<li><a href="'.url($settings['base_url'], ['keyword' => $settings['keyword'], 'page' => $i]).'">'.$i.'</a></li>';
                }
            }

            if($page < $pageTotal) {
                $pageHtml .="<li><a href='".url($settings['base_url'], ['keyword' => $settings['keyword'], 'page' => ($page + 1)])."'>»</a></li>";
            }else {
                $pageHtml .= "<li><a href='javascript:void(0);'>»</a></li>";
            }
        }


        return $pageHtml;
    }

    /**
     * 全站搜索纪念馆
     */
    public function searchHall()
    {
        $keyword = $this->request->param('keyword', '');

        $page = $this->request->param('page', 1);

        $data = HallModel::getDataByKeywords($keyword, $page, 20);

        $settings = [
            'keyword' => $keyword,
            'page_total' => $data['page'],
            'base_url' => 'home/Hall/searchHall',
            'page_value' => $page,
        ];

        $pageHtml = $this->hallListPagenation($settings);

        $hotFamousList = HallModel::getDatas(1, 1, 0, 'memorial_value desc', 1, 9);
        $this->assign('hotFamousList', $hotFamousList['list']);
        $this->assign('data', $data['list']);
        $this->assign('pageHtml', $pageHtml);

        $this->assign('searchTitle', '搜索结果');

        return $this->fetch('hall_list');
    }

    /**
     * 私人纪念馆频道页
     * @return mixed
     */
    public function privateHall()
    {
        // 纪念馆列表
        $famousHallList = HallModel::getDatas(1, 1, 0, 'view desc', 1, 10)['list']; // 名人馆
        $oneHallList = HallModel::getDatas(1, 2, 0, 'view desc', 1, 10)['list']; // 个人馆
        $familyHallList = HallModel::getDatas(3, 0, 0, 'view desc', 1, 10)['list']; // 家族馆
        $doubleHallList = HallModel::getDatas(2, 0, 0, 'view desc', 1, 10)['list']; // 双人馆
        $eventHallList = HallModel::getDatas(4, 0, 0, 'view desc', 1, 10)['list']; // 事件馆
        $themeHallList = HallModel::getDatas(5, 0, 0, 'view desc', 1, 10)['list']; // 主题馆
//        dump($doubleHallList);die;
        // 纪念资讯列表
        $jnNewsList = DocumentModel::getArticlesByCategoryID(0, 1, 10)['list'];
        
        // 传统文化列表
        $ctwhList = DocumentModel::getArticlesByCategoryID(2, 1, 10)['list'];
        
        // 殡葬文化列表
        $bzwhList = DocumentModel::getArticlesByCategoryID(11, 1, 10)['list'];

        // 姓氏文化列表
        $xswhList = DocumentModel::getArticlesByCategoryID(10, 1, 10)['list'];

        // 中华美德列表
        $zhmdList = DocumentModel::getArticlesByCategoryID(6, 1, 10)['list'];

        // 追思留言列表
        $hallLeaveMessage = HallLeaveMessage::hallLeaveMessage(0, 1, 10)['list'];
        
        // 追思文选列表
        $hallArticle = HallArticle::hallArticle(0, 1, 8)['list'];

        // 最新祭拜列表
        $hallWorship = MallWorship::mallWorshipList(0, 0, 1, 8)['list'];

        $assignData = [
            'famousHall' => $famousHallList,
            'oneHall' => $oneHallList,
            'familyHall' => $familyHallList,
            'doubleHall' => $doubleHallList,
            'eventHall' => $eventHallList,
            'themeHall' => $themeHallList,
            
            'jnNewsList' => $jnNewsList,
            'ctwhList'          => $ctwhList,
            'bzwhList'          => $bzwhList,
            'xswhList'          => $xswhList,
            'zhmdList'          => $zhmdList,
            
            'hallLeaveMessage' => $hallLeaveMessage,

            'hallArticle'   => $hallArticle,

            'hallWorship' => $hallWorship,
        ];

        // SEO
        $title = '私人纪念馆 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('private_hall', $assignData);
    }

    /**
     * 家族馆频道页
     * @return mixed
     */
    public function familyHall()
    {

        $surnamesList = HallSurnames::getDatas(1,108, 'sort asc, id asc')['list'];
        $familyHallList = HallModel::getDatas(3, 0, 0, 'view desc', 1, 8)['list'];


        // 宗祠资讯
        $familiNewsCate = Db::name('site_column')->where('pid', 38)->order('sort asc')->limit(3)->field('id, category_id, pid, name, title, sort')->select();
        if ($familiNewsCate) {
            foreach ($familiNewsCate as $key=>$value) {
                $familiNewsCate[$key]['list'] = Document::getArticlesByCategoryID($value['category_id'], 1, 6)['list'];
            }
        }

        $assinData = [
            'surnamesList' => $surnamesList,
            'familyHallList' => $familyHallList,
            'familyNewsList' => $familiNewsCate
        ];

        // SEO
        $title = '家族宗祠首页 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('family_hall', $assinData);
    }

    public function familyHallList()
    {

        $page = $this->request->param('page', 1);
        $sortType = $this->request->param('sort', 'view');
        $familyHallList = HallModel::getDatas(3, 0, 0, $sortType.' desc', $page, 16);

        // TODO 分页
        $settings = [
            'page_total' => $familyHallList['page'],
            'base_url' => 'hall/familyhalllist',
            'page_value' => $page,
        ];
        $pageHtml = $this->familyHallListPagenation($settings);

        $assinData = [
            'sortType' => $sortType,
            'familyHallList' => $familyHallList['list'],
            'pageHtml' => $pageHtml
        ];

        // SEO
        $title = '家族宗祠列表 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('family_hall_list', $assinData);
    }

    /**
     * 家族宗祠列表分页
     * @param array $settings
     * @return string
     */
    private function familyHallListPagenation($settings = []) {

        $page = $settings['page_value'];
        $pageTotal = $settings['page_total'];

        //分页
        $num = 7; //需要显示的最多页数
        $num = min($pageTotal, $num); //处理显示的页码数大于总页数的情况
        $end = $page + floor($num/2) <= $pageTotal ? $page + floor($num/2) : $pageTotal; //计算结束页号
        $start = $end - $num + 1; //计算开始页号
        if($start < 1) { //处理开始页号小于1的情况
            $end -= $start - 1;
            $start = 1;
        }

        $pageHtml = '';

        if($pageTotal > 1){
            if($page > 1) {
                $pageHtml .="<li><a class='demo' href='".url($settings['base_url'], ['page' => ($page - 1)])."'><span>上一页</span></a>";
            }else {
                $pageHtml .= "<li><span>上一页</span></li>";
            }

            for($i = $start; $i <= $end; $i++){
                if($i == $page){
                    $pageHtml .= '<li class="active"><span class="active">'.$i.'</span></li>';
                }else{
                    $pageHtml .= "<li><a class='demo' href='".url($settings['base_url'], ['page' => $i])."'><span>".$i."</span></a>";
                }
            }

            if($page < $pageTotal) {
                $pageHtml .="<li><a class='demo' href='".url($settings['base_url'], ['page' => ($page + 1)])."'><span>下一页</span></a>";
            }else {
                $pageHtml .= "<li><span>下一页</span></li>";
            }
        }


        return $pageHtml;
    }

    public function familyHallName()
    {
        $id = $this->request->param('id', 0);
        $info = HallSurnames::getSurnamesInfoById($id);

        if (!$info) {
            $this->error('ID无效');
        }

        $categoryId = 59; // 宗谱范例
        $recNewsList = Document::getRecommendArticles(1, 13, '', $categoryId);

        $assignData = [
            'info' => $info,
            'recNewsList' => $recNewsList
        ];

        // SEO
        $title = $info['name'].'氏历史 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('family_hall_name', $assignData);
    }

    /**
     * 名人馆频道页
     * @return mixed
     */
    public function famousHall()
    {

        // 纪念馆排行
        $hallRank = HallModel::hallRank('total_rank', 1, 7)['list'];

        // 名人类型列表
        $famousTypeList = HallFamousType::getDatas();

        // 最新祭拜列表
        $hallWorship = MallWorship::mallWorshipList(0, 1, 1, 7)['list'];

        // 最新纪念馆列表
        $latestHallList = HallModel::getDatas(1, 1, 0, 'create_at desc', 1, 4)['list']; // 名人馆
//        if ($latestHallList) {
//            foreach ( $latestHallList as $item) {
//                $item['one_birthday'] = explode('-', $item['one_birthday'])[0];
//                $item['one_death'] = explode('-', $item['one_death'])[0];
//
//            }
//        }

        // 名人纪念馆列表 按名人类型排列
        $famousList = [];
        foreach ($famousTypeList as $key=>$famousType) {
            $famousList[$key] = $famousType;
            $hallList = HallModel::getDatas(1, 1, $famousType['id'], 'memorial_value desc', 1, 4)['list'];

//            if ($hallList) {
//                foreach ( $hallList as $item) {
//                    $item['one_birthday'] = explode('-', $item['one_birthday'])[0];
//                    $item['one_death'] = explode('-', $item['one_death'])[0];
//
//                }
//            }
            $famousList[$key]['list'] = $hallList;
        }

        // 私人纪念馆列表 按随机排列
        $privateList = HallModel::getDatas(1, 2, 0, 'rand()', 1, 16)['list']; // 私人馆
//        if ($privateList) {
//            foreach ( $privateList as $item) {
//                $item['one_birthday'] = explode('-', $item['one_birthday'])[0];
//                $item['one_death'] = explode('-', $item['one_death'])[0];
//
//            }
//        }

        // 友情链接
        $fLinks = LinksModel::getDatas(1); // 获取友情链接
        $hLinks = LinksModel::getDatas(2); // 获取合作单位链接

        $assignData = [
            'hallRank' => $hallRank,
            'famousTypeList' => $famousTypeList,
            'hallWorship' => $hallWorship,

            'famousList' => $famousList,

            'privateList' => $privateList,

            'fLinks'            => $fLinks,
            'hLinks'            => $hLinks,

        ];

        $this->assign('latestHallList', $latestHallList);

        // SEO
        $title = '名人纪念馆 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('famous_hall', $assignData);
    }

    /**
     * 根据名人纪念馆名称首字母搜索纪念馆
     * @return mixed
     */
    public function famousHallAjaxSearch()
    {
        $letter = $this->request->param('letter');
        $keywords = $this->request->param('keywords');

        if ($keywords != '') {
            $data = HallModel::getDataByKeywords($keywords)['list'];
        }else {
            $data =  HallModel::getDataByLetter($letter);
        }


        $this->assign('data', $data);
        return $this->fetch('include/_famous_hall_search_item');

    }




    /***************************** 纪念馆追思留言列表 *****************************/
    public function messageList()
    {
        $page = $this->request->param('page', 1);
        $size = 20;

        $messageList = HallLeaveMessage::hallLeaveMessage(0, $page, $size);

        // 分页
        $settings = [
            'page_total' => $messageList['page'],
            'base_url' => 'hall/messageList',
            'page_value' => $page,
        ];
        $pageHtml = $this->pagenationTwo($settings);
        $this->assign('pageHtml', $pageHtml);

        $this->assign('messageList', $messageList);

        // SEO
        $title = '追思留言 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_message_list');
    }

    /***************************** 纪念馆追忆文选列表 *****************************/
    public function articleList()
    {

        $page = $this->request->param('page', 1);
        $size = 20;

        $articleList = HallArticle::hallArticle(0, $page, $size);

        // 分页
        $settings = [
            'page_total' => $articleList['page'],
            'base_url' => 'hall/articleList',
            'page_value' => $page,
        ];
        $pageHtml = $this->pagenationTwo($settings);
        $this->assign('pageHtml', $pageHtml);

        $this->assign('articleList', $articleList);

        // SEO
        $title = '追忆文选 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_article_list');
    }

    /**
     * 纪念馆 追忆文选/追思留言列表 页面分页公共方法
     * @param array $settings
     * @return string
     */
    public function pagenationTwo($settings = [])
    {

        $page = $settings['page_value'];
        $pageTotal = $settings['page_total'];

        $pageHtml = '';

        if ($pageTotal > 1) {
            if($page > 1) {
                $isNot = '';
                $url = url($settings['base_url'], ['page' => ($page - 1)]);
            }else {
                $isNot = 'not';
                $url = 'javascript:;';
            }

            $fPageHtml = "<a href='".$url."' title='上一页'><span class='".$isNot."'>查看上一页</span></a>";

            if($page < $pageTotal) {
                $isNot = '';
                $url = url($settings['base_url'], ['page' => ($page + 1)]);
            }else {
                $isNot = 'not';
                $url = 'javascript:;';
            }

            $nPageHtml ="<a href='".$url."' title='下一页'><span class='".$isNot."'>查看下一页</span></a>";

            $pageHtml = '<div class="ui_page"><div class="b_box">'.$fPageHtml.$nPageHtml.'</div></div>';
        }


        return $pageHtml;

    }

    /***************************** 纪念馆详情 *****************************/
    /**
     * 获取纪念馆详情信息
     * @return array|false|\PDOStatement|string|\think\Model
     */
    private function getHallInfo()
    {
        $hallId = $this->param['id'];
        $memberId = $this->user ? $this->user['member_id'] : 0;
        $info = HallModel::getInfoById($hallId, ['hall_style', 'hall_music', 'hall_worship_style', 'member'], $memberId);

       if (!$info) {
           // 如果纪念馆不存在
           $this->error('纪念馆ID无效');
       }

        // 获取时间信息
        //获取日期
        $info['date'] = date("Y年m月d日",time());//获取当前阳历日期
        $week=array("日","一","二","三","四","五","六");//定义星期显示
        $year=array("零","一","二","三","四","五","六","七","八","九");//定义农历年份显示方式
        $info['week'] = $week[date("w",time())];//获取当天星期数，并转换为知道格式
        $Lunar = new LunarService();//实例化农历转换类
        $info['nong'] = $Lunar->convertSolarToLunar(date('Y'), date('m'), date('d'));//获得当前农历日期

        // 农历日期重组格式
        $info['nongli']='';
        for ($i = 0; $i < 4; $i++){
            $info['nongli'] .= $year[substr($info['nong'][0], $i, 1)];
        }
        $info['nongli'] .='年 '.$info['nong'][1].' '.$info['nong'][2];
        unset($info['nong']);


        if ($info['hall_type'] == 1) {
            // 获取纪念馆左侧统计信息
            //获取创建人昵称
            $info['hall_member_nickname'] = MemberModel::self()->where('member_id', $info['hall_member_id'])->value('member_nickname');
            //获取文章数量
            $info['article_sum'] = Db::name("hall_article")->where('hall_id',$info['id'])->count();
            //获取祭拜次数
            $info['worship_sum'] = Db::name("mall_worship")->where('hall_id',$info['id'])->count();
            //获取图片数量
            $photoList = Db::name("hall_photo")->where('hall_id',$info['id'])->field('id')->select();
            $photoListString='';
            foreach ($photoList as $key => $value){
                $photoListString .= $value['id'].',';
            }
            unset($photoList);
            $info['img_sum'] = Db::name("hall_photo_picture")->where('photo_id','in',rtrim($photoListString, ","))->count();
        }

        $this->assign('info', $info);
        return $info;
    }

    /**
     * 纪念馆详情首页
     * @return mixed
     */
    public function detail()
    {
        // 获取纪念馆详情
        $info = $this->getHallInfo();

        // SEO
        $title = $info['hall_name'] . '纪念馆 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_detail');

    }

    /**
     * 纪念馆 生平故事
     * @return mixed
     */
    public function story()
    {
        $info = $this->getHallInfo();

        // SEO
        $title = $info['hall_name'] . '简介 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_story');
    }

    /**
     * 纪念馆 回忆相册
     * @return mixed
     */
    public function photo()
    {
        $info = $this->getHallInfo();

        $page = empty($this->request->param('page')) ? 1 : $this->param['page'];
        $rows = 12;

        $list = Db::name('hall_photo')->where('hall_id',$this->param['id'])->where("status",1)->field('id,photo_name,create_at')->page($page,$rows)->select();
        foreach ($list as $key => $value){
            $list[$key]['create_at'] = date("Y-m-d",$value['create_at']);
            $num = Db::name('hall_photo_picture')->query("SELECT Count(*) as  num,photo_picture_url as url FROM tp_hall_photo_picture WHERE photo_id = ".$value['id']);
            $list[$key]['num'] = $num[0]['num'];
            $list[$key]['url'] = $num[0]['url'];
        }

        $this->assign('photoList',$list);

        // SEO
        $title = $info['hall_name'] . '图片 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_photo');
    }

    public function addHallPhoto()
    {
        $info = $this->getHallInfo();

        if($this->request->isPost()){
            $data = $this->request->param();
            $data['hall_id'] = $info['id'];
            $data['create_at'] = time();
            unset($data['id']);

            // 相册名称不能为空
            if($data['photo_name'] == '') {
                $this->error('相册名称不能为空');
            }

            $res = Db::name('hall_photo')->insertGetId($data);
            if (!$res) {
                $this->error('添加失败');
            }
            $this->success('添加成功', url('/home/Hall/photo', ['id' => $info['id']]));
        }
    }

    public function photoPicture()
    {
        $info = $this->getHallInfo();

        $list = Db::name('hall_photo_picture')->where('photo_id',$this->param['photo_id'])->select();
        $this->assign('list',$list);

        $photoId = $this->param['photo_id'];
        $this->assign('photoId', $photoId);

        // SEO
        $title = $info['hall_name'] . '相册 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_photo_picture');
    }

    public function addHallPhotoPicture()
    {
        $info = $this->getHallInfo();

        if($this->request->isPost()){
            $data = $this->request->param();
            $photoId = $data['photo_id'];
            $photoPaths = $data['photo'];
            $saveData = [];
            if ($photoPaths) {
                // 有照片提交
                foreach ($photoPaths as $path) {
                    $saveData[] = [
                        'photo_id' => $photoId,
                        'photo_picture_url' => $path
                    ];
                }
            }

            $res = Db::name('hall_photo_picture')->insertAll($saveData);
            if (!$res) {
                $this->error('添加失败');
            }
            $this->success('添加成功', url('/home/Hall/photoPicture', ['id' => $info['id'], 'photo_id' => $photoId]));
        }
    }

    /**
     * 纪念馆追忆文选
     * @return mixed
     */
    public function article()
    {
        $info = $this->getHallInfo();

        $page = $this->request->param('page',1);
        $size = 10;

        $list = HallArticle::hallArticle($this->request->param('id'), $page, $size);

        $baseUrl = '/home/hall/article';
        $urlParams = [
            'id' => $info['id'],
        ];
        $list['pageHtml'] = $this->pagenation($baseUrl, $urlParams, $list['page'], $page);

        $this -> assign('list',$list);

        // SEO
        $title = $info['hall_name'] . '追忆文选 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_article');
    }

    public function articleDetail(){

        $articleInfo = Db::name('HallArticle')->find($this->param['article_id']);

        $this->assign('articleInfo',$articleInfo);

        $info = $this->getHallInfo();

        // SEO
        $title = $articleInfo['article_title'] . ' - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_article_detail');
    }

    public function addHallArticle()
    {
        $info = $this->getHallInfo();

        $articleId = !empty($this->request->param('article_id')) ? $this->request->param('article_id') : '';

        // 获取文章信息
        if ($articleId) {
            $articleInfo = Db::name('HallArticle')->find($articleId);
            $this->assign('articleInfo', $articleInfo);
        }

        if($this->request->isPost()){

            $data = $this->request->param();
            $data['hall_id'] = $info['id'];
            unset($data['id']);
            if (isset($data['file'])){
                unset($data['file']);
            }

            if (!empty($data['article_id'])){
                // 更新操作
                $data['update_at'] = time();
                unset($data['article_id']);
                $res = Db::name('hall_article')->where('id', $articleId)->update($data);
                if (!$res) {
                    $this->error('修改失败');
                }
                $this->success('修改成功', url('/home/Hall/article', ['id' => $info['id']]));
            }else {
                // 新增操作

                $data['create_at'] = time();

                // 标题不能为空
                if($data['article_title'] == '') {
                    $this->error('文选标题不能为空');
                }

                $res = Db::name('hall_article')->insertGetId($data);
                if (!$res) {
                    $this->error('发布失败');
                }
                $this->success('发布成功', url('/home/Hall/article', ['id' => $info['id']]));
            }

        }


        // SEO
        $title = '发布文选 - '.$info['hall_name'].' - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('add_hall_article');
    }

    /**
     * 纪念馆 祭拜记录
     * @return mixed
     */
    public function worshipRecord()
    {

        $info = $this->getHallInfo();

        $page = $this->request->param('page', 1);
        $size = 5;
        $memberId = !empty($this->user['member_id']) ? $this->user['member_id'] : 0;

        $params = $this->param;

        $rankType = isset($params['rank_type']) && $params['rank_type'] != '' ? $params['rank_type'] : 'day_rank';
        $this->assign('rankType', $rankType);

        $worshipRank = HallModel::worshipRank($info['id'], $rankType, $page, $size, $memberId);
//        dump($worshipRank);die;
        $baseUrl = '/home/hall/worshipRecord';
        $urlParams = [
            'id' => $info['id'],
            'rank_type' => $rankType,
        ];
        $worshipRank['pageHtml'] = $this->pagenation($baseUrl, $urlParams, $worshipRank['page'], $page);
        $this->assign('worshipRank', $worshipRank);

        // SEO
        $title = '为'.$info['hall_name'].'祈福 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_worship_record');
    }

    /**
     * 纪念馆 追思留言
     * @return mixed
     */
    public function message()
    {
        $info = $this->getHallInfo();

        $page = $this->request->param('page', 1);
        $size = 10;

        $messageList = HallLeaveMessage::hallLeaveMessage($info['id'], $page, $size);
        $baseUrl = 'home/Hall/message';
        $urlParams = [
            'id' => $info['id'],
        ];
        $messageList['pageHtml'] = $this->pagenation($baseUrl, $urlParams, $messageList['page'], $page);
        $this->assign('messageList', $messageList);

        // SEO
        $title = $info['hall_name'].'留言板 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('hall_message');
    }

    /**
     * 发布追思留言
     */
    public function ajaxAddMessage()
    {

        if ($this->request->isPost()) {
            $hallId = $this->request->post('hallId', 0);
            $content = $this->request->post('content', '');

            if (!$this->user) {
                $this->error('未登录，请先登陆');
            }

            $memberId = $this->user['member_id'];

            $data = [
                'hall_id' => $hallId,
                'member_id' => $memberId,
                'content' => urlencode($content),
                'create_at' => time()
            ];
            if (Db::name('HallLeaveMessage')->insert($data)){
                $this ->success('留言成功', url('message', ['id' => $hallId]));
            } else {
                $this ->error('留言失败');
            }
        }
    }

    /**
     * 纪念馆 祭拜大厅
     * @return mixed
     */
    public function worshipHall()
    {
        $info = $this->getHallInfo();

        $token = $this->user['member_token'];
        $userId = $this->user['member_id'];

        $userData = [
            'token' => $token,
            'user_id' => $userId,
            'hall_id' => $info['id'],
            'goods_id' => '',
            'goods_num' => 1
        ];

        $this->assign('userData', json_encode($userData));

        // SEO
        $title = $info['hall_name'].'网上墓园 - '. sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('worship_hall');
    }

    /**
     * 纪念馆详情页面分页公共方法
     * @param $baseUrl
     * @param $urlParams
     * @param $page
     * @param $currentPage
     * @param bool $isAjax
     * @return string
     */
    public function pagenation($baseUrl, $urlParams, $page, $currentPage, $isAjax = false)
    {

        $html = '';

        if ($page > 1){
            $html .= '<p class="page_turn">';

            $min = min($page,  $currentPage + 5);
            $min = $min < 1 ? 1 : $min;

            for ($i = $currentPage-3; $i <= $min ; $i++) {
                if ($i < 1) {
                    continue;
                }
                $cur = $i == $currentPage ? " class='cur'" : '';
                if (!$isAjax){
                    $html .="<a title='第".$i."页' href='".url($baseUrl, array_merge($urlParams, ['page'=>$i]))."'><span ".$cur.">".$i."</span></a>";
                }else{
                    $html .="<a title='第".$i."页' href='javaScript:void(0)' ajax-href='".url($baseUrl, array_merge($urlParams, ['page'=>$i]))."'>
                            <span ".$cur.">".$i."</span></a>";
                }
            }
            $html = $html.'</p>';
        }
        return $html;
    }

    /**
     * 纪念馆分享地址跳转处理
     * @return mixed
     */
    public function shareUrl()
    {
        return $this->fetch('share_url');
    }

}
