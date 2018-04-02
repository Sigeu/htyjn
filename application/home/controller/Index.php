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

use app\api\model\AppVersion;
use app\api\model\Hall as HallModel;
use app\api\model\HallLeaveMessage;
use app\api\model\MemberModel;
use app\home\model\Links as LinksModel;
use app\home\model\Document as DocumentModel;
use app\home\model\Page as PageModel;
use app\common\controller\HomeBase;

use Endroid\QrCode\QrCode;
use service\PhpExcelService;
use think\Env;
use think\Request;
use think\Db;


/**
 * 网站入口控制器
 * Class Index
 * @package app\home\controller
 * @author andy <290648237@qq.com>
 * @date 2017/6/15
 */
class Index extends HomeBase {

    function __construct(Request $request)
    {
        parent::__construct($request);
        $pri_id=$request->param('p');
        $p_ri=$request->param('');
        $this->assign('p_ri',$p_ri);
        $this->assign('pri_id',$pri_id);
    }

    public function xunSearch()
    {
        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);
        $data = HallModel::hallSearch($this->request->param('keyword'), $page, $size);

        dump($data);die;
    }

    public function paginate()
    {
        $curPage = $this->request->param('curpage', 1);
        $size = 10;

        $count = Db::name('area')->where('area_deep', 1)->count();
        $list = Db::name('area')->where('area_deep', 1)->page($curPage, $size)->select();
        $this->assign('list', $list);

        $page = lay_page($count, '', ['cid' => 1]);
        $this->assign('page', $page);

        return $this->fetch('paginate');
    }


    public function layuiTemplate()
    {

        return $this->fetch('layui_template');
    }

    /**
     *
     */
    public function test()
    {



        die;
        echo 'test git';die;
        $str = "%E4%B8%8D%E5%9B%9E%E5%A4%8D%E5%B0%B1%E6%94%BE%E5%81%87";
        dump(filter_sensitive_word($str));die;
        $phpExcel = new PhpExcelService();
        // 设置excel保存文件名称
        $filename = '会员数据 '.date('Y-m-d', time()).'.xls';
        $data = MemberModel::self()->field('member_id, member_name, coins, memorial_value, member_mobile, member_email, member_login_num, member_old_login_time')->select();

        //Excel表格式,这里简略写了8列
        $letter = array('A', 'B', 'C', 'D', 'E', 'F', 'F', 'G');

        //表头数组 数据库表字段
        $tableHeader = array('ID', '用户账号', '纪念币余额', '纪念值', '手机号', '电子邮箱', '登录次数', '最后登录');

        $phpExcel->setStyle('G');
        $res = $phpExcel->excel($filename, $letter, $tableHeader, $data);

        dump($res);die;
//        echo dirname(__FILE__);die;
//        HallModel::reBuildList();
//        debug('Hall xunsearch 缓存更新成功');
//        die;

//        dump(get_redis_session());die;
//        $res = \app\admin\model\Hall::getDataById(20, 'hallOne');
//
//        dump($res);die;
//
//        $ret = file_get_contents('http://bz.yjn100.com/mobile/index.php?act=goods&op=goods_list&gc_id=1057&page=4');
//        $data = json_decode($ret, true);
//        if ($data['page_total']) {
//            dump($data['datas']['goods_list']);
//        }
//        dump(json_decode($ret, true));die;
//
//        echo date_to_unixtime("1900/1/31"); //输出-2206425952
//        echo '<br>';
//        echo unixtime_to_date(date_to_unixtime("1900/1/31 00:00:00"), 'Y-m-d'); //输出1900-01-31 00:00:00
//        die;
//        return $this->fetch();
    }

    public function ajaxTest()
    {


    }



    /**
     * 网站入口
     */
    public function index() {

        // 纪念馆列表
        $familyHallList = HallModel::getDatas(3, 0, 0, 'view desc', 1, 8)['list'];
        $oneHallList = HallModel::getDatas(1, 2, 0, 'view desc', 1, 10)['list'];
        $famousHallList = HallModel::getDatas(1, 1, 0, 'view desc', 1, 10)['list'];

        // 纪念馆排行
        $hallRank = HallModel::hallRank('total_rank', 1, 5)['list'];

        // 追思留言
        $hallLeaveMessage = HallLeaveMessage::hallLeaveMessage(0, 1, 3)['list'];

        // 行业资讯
        // 传统文化列表
        $ctwhList = DocumentModel::getArticlesByCategoryID(2, 1, 6)['list'];

        // 殡葬文化列表
        $bzwhList = DocumentModel::getArticlesByCategoryID(11, 1, 5)['list'];

        // 姓氏文化列表
        $xswhList = DocumentModel::getArticlesByCategoryID(10, 1, 6)['list'];

        // 中华美德列表
        $zhmdList = DocumentModel::getArticlesByCategoryID(6, 1, 6)['list'];

        // 关于我们
        $aboutInfo = PageModel::getDataByType('about');
 
        // 友情链接
        $fLinks = LinksModel::getDatas(1); // 获取友情链接
        $hLinks = LinksModel::getDatas(2); // 获取合作单位链接

        //公墓墓型
        $cate=Db::name('cemetery_category')->where('is_deleted',0)->limit(11)->order('rand()')->select();

        //陵园地区
        $area=Db::name('cemetery_area')->where('pid',0)->select();
        //搜索公墓价格区间
        $price=Db::name('cemetery_price')->select();

        //首页墓园 随机显示8条
        $cemetery=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('rand()')->select();

//        $requestUrl = file_get_contents('http://bz.yjn100.com/mobile/index.php?act=goods&op=goods_list&page=8');
        $data = []; //json_decode($requestUrl, true);
        $bzypList = [];
//        if ($data['page_total']) {
//            $bzypList = $data['datas']['goods_list'];
//        }

        $assignData = [
            'familyHallList'    => $familyHallList,
            'oneHallList'       => $oneHallList,
            'famousHallList'    => $famousHallList,

            'hallRank'          => $hallRank,

            'hallLeaveMessage'  => $hallLeaveMessage,

            'ctwhList'          => $ctwhList,
            'bzwhList'          => $bzwhList,
            'xswhList'          => $xswhList,
            'zhmdList'          => $zhmdList,
            'fLinks'            => $fLinks,
            'hLinks'            => $hLinks,

            'aboutInfo'         => $aboutInfo,

            'bzypList'          => $bzypList,
        ];

        $this->assign('price',$price);
        $this->assign('cate',$cate);
        $this->assign('area',$area);
        $this->assign('cemetery',$cemetery);

        // SEO
        $title = sysconf('web_title') . ' - ' . sysconf('seo_title');
        $this->assign('seo_title', $title);
        $this->assign('seo_keywords', sysconf('seo_keywords'));
        $this->assign('seo_description', sysconf('seo_description'));

        return $this->fetch('', $assignData);
    }

    /**
     * 生成二维码
     * @param string $url
     */
    public function qrCode($url = '')
    {
        if (!$url) {
            $url = urldecode($this->request->param('url'));
        }
        $qrCode = new QrCode();

        $qrCode->setText($url)
            ->setSize(300)
            ->setPadding(15)
            ->setErrorCorrection('high')
            ->setForegroundColor(array('r' => 0, 'g' => 0, 'b' => 0, 'a' => 0))
            ->setBackgroundColor(array('r' => 255, 'g' => 255, 'b' => 255, 'a' => 0))
//            ->setLabel('yjn100.com')
            ->setLabelFontSize(16)
            ->setImageType($qrCode::IMAGE_TYPE_PNG);
        $qrCode->render();
    }

}
