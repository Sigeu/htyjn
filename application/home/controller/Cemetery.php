<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: ding <dingzhangze@163.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use app\api\controller\Tools;
use app\common\controller\HomeBase;
use app\home\validate\BaseValidate;
use app\api\service\UserService;
use think\Paginator;
use think\Request;
use think\Db;

/**
 * 公墓商城控制器
 * Class Cemetery
 * @package app\home\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/7/17
 */
class Cemetery extends HomeBase {


    function __construct(Request $request = null)
    {
        parent::__construct($request);

        $cate=Db::name('cemetery_category')->where('is_deleted',0)->order('rand()')->limit(12)->select();
        $cemetery=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('rand()')->select();
        $area=Db::name('cemetery_area')->where('pid',0)->select();
        $price=Db::name('cemetery_price')->select();
        $id=$request->param('id');
        $pri_id=$request->param('p');
        $p_ri=$request->param('');
        $this->assign('p_ri',$p_ri);
        $this->assign('pri_id',$pri_id);
        $this->assign('cemetery',$cemetery);
        $this->assign('cid',$id);
        $this->assign('area',$area);
        $this->assign('cate',$cate);
        $this->assign('price',$price);
    }

    /**
     * @return mixed
     * 公墓商城首页
     */
    public function index()
    {
        //陵园排行
        $newCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('id desc')->select();
        $cliCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('click_amount desc')->select();
        $staCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('start_level desc')->select();

        //首页文章
        $cecate=Db::name('document_category')->where('pid',52)->select();
        foreach ($cecate as $key=>$value){
            $cecate[$key]['list']=Db::name('document')->where('category_id',$value['id'])->select();
        }
//        dump($cecate);die;
        $this->assign('cecate',$cecate);
        $this->assign('staCm',$staCm);
        $this->assign('newCm',$newCm);
        $this->assign('cliCm',$cliCm);

        return $this->fetch('');
    }

    /**
     * @return mixed
     * 获取陵园所在城市
     */
    public function city()
    {
        $id=input('get.');
        $city=Db::name('cemetery_area')->where($id)->select();
        return $this->response($city);
    }

    public function __page($map)
    {
        $request = Request::instance();
        $page = $request->param('page', 1);
        $size = $request->param('size', 24);

        $total = Db::name('cemetery_tomb')->where($map)->count();
        $pageTotal = ceil($total/$size);
        $baseUrl = '/home/cemetery/search';
        //分页
        $num = 7; //需要显示的最多页数
        $num = min($pageTotal, $num); //处理显示的页码数大于总页数的情况
        $end = $page + floor($num/2) <= $pageTotal ? $page + floor($num/2) : $pageTotal; //计算结束页号
        $start = $end - $num + 1; //计算开始页号
        if($start < 1) { //处理开始页号小于1的情况
            $end -= $start - 1;
            $start = 1;
        }

        $pageHtml = '<div class="pagination"><ul>';
        if($pageTotal > 1){
            if($page > 1) {
                $pageHtml .="<li><a href='".url($baseUrl, ['id' => $id, 'page' => ($page - 1)])."'><span>上一页</span></a></li>";
            }

            for($i = $start; $i <= $end; $i++){
                if($i == $page){
                    $pageHtml .= '<li><span class="currentpage">'.$i.'</span></li>';
                }else{
                    $pageHtml .= '<li><a class="demo" href="'.url($baseUrl, ['id' => $id, 'page' => $i]).'"><span>'.$i.'</span></a></li>';
                }
            }

            if($page < $pageTotal) {
                $pageHtml .='<li><a href="'.url($baseUrl, ['id' => $id, 'page' => ($page + 1)]).'"><span>下一页</span></a></li>';
            }
        }
        $pageHtml .= '</ul></div>';

        $this->assign('pageHtml', $pageHtml);
    }

    /**
     * @return mixed
     * 搜索页面
     */
    public function search()
    {
        $request = Request::instance();
        $id=$request->param('id');
        $page = $request->param('page', 1);
        $size = $request->param('size', 24);

        if ($id==0){
            $ceType=Db::name('cemetery_tomb')->where('is_deleted',0)->where('pid','<>',0)->page($page, $size)->select();
        }else{
            $ceType=Db::name('cemetery_tomb')->where(['cate_id'=>$id,'is_deleted'=>0])->page($page, $size)->select();
        }
        $total = Db::name('cemetery_tomb')->where(['cate_id'=>$id,'is_deleted'=>0])->count();
        $pageTotal = ceil($total/$size);

        foreach ($ceType as $key=>$value){
               $ceType[$key]['pname']=Db::name('cemetery_tomb')->where('id',$value['pid'])->value('name');
               $ceType[$key]['province']=Db::name('cemetery_tomb')->where('id',$value['pid'])->value('grave_province');
               $ceType[$key]['city']=Db::name('cemetery_tomb')->where('id',$value['pid'])->value('grave_city');
        }


        $baseUrl = '/home/cemetery/search';
        //分页
        $num = 7; //需要显示的最多页数
        $num = min($pageTotal, $num); //处理显示的页码数大于总页数的情况
        $end = $page + floor($num/2) <= $pageTotal ? $page + floor($num/2) : $pageTotal; //计算结束页号
        $start = $end - $num + 1; //计算开始页号
        if($start < 1) { //处理开始页号小于1的情况
            $end -= $start - 1;
            $start = 1;
        }

        $pageHtml = '<div class="pagination"><ul>';
        if($pageTotal > 1){
            if($page > 1) {
                $pageHtml .="<li><a href='".url($baseUrl, ['id' => $id, 'page' => ($page - 1)])."'><span>上一页</span></a></li>";
            }

            for($i = $start; $i <= $end; $i++){
                if($i == $page){
                    $pageHtml .= '<li><span class="currentpage">'.$i.'</span></li>';
                }else{
                    $pageHtml .= '<li><a class="demo" href="'.url($baseUrl, ['id' => $id, 'page' => $i]).'"><span>'.$i.'</span></a></li>';
                }
            }

            if($page < $pageTotal) {
                $pageHtml .='<li><a href="'.url($baseUrl, ['id' => $id, 'page' => ($page + 1)]).'"><span>下一页</span></a></li>';
            }
        }
        $pageHtml .= '</ul></div>';

        $this->assign('pageHtml', $pageHtml);

        $this->assign('ceType',$ceType);
        $this->assign('cid',$id);
        return $this->fetch('');
    }

    public function scity()
    {
        $data=input('post.');
        $province=Db::name('cemetery_area')->where('id',$data['ddlProvince'])->find();
        $city=Db::name('cemetery_area')->where('id',$data['ddlCity'])->find();
        $gMap=[
            'grave_province'=>$province['province'],
            'grave_city'=>$city['city'],
            'is_deleted'=>0
        ];
        $grave=Db::name('cemetery_tomb')->where($gMap)->select();
        $this->__page($gMap);
        $this->assign('grave',$grave);
        return $this->fetch('search');
    }

    /**
     * 关键字搜索
     */
    public function searchKey()
    {
        $key1=input('get.keyword1');
        $key2=input('get.keyword2');
        if($key1){
            $skey1=Db::name('cemetery_tomb')->where('pid','<>','0')->where('name','like', "%{$key1}%")->select();
            foreach ($skey1 as $key=>$value){
                $skey1[$key]['pname']=Db::name('cemetery_tomb')->where('id',$value['pid'])->value('name');
                $skey1[$key]['province']=Db::name('cemetery_tomb')->where('id',$value['pid'])->value('grave_province');
                $skey1[$key]['city']=Db::name('cemetery_tomb')->where('id',$value['pid'])->value('grave_city');
            }
            $this->assign('skey1',$skey1);
        }else{
            $skey2=Db::name('cemetery_tomb')->where('pid','0')->where('name','like', "%{$key2}%")->select();
            $this->assign('skey2',$skey2);
        }


        return $this->fetch();
    }

    /**
     * 价格区间搜素
     */
    public function sprice()
    {
        $data=$this->request->param();
        if(isset($data['p'])&&$data['p']==0){
            $pri=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->select();
        }else{
            $pri=Db::name('cemetery_tomb')->where('pid',0)->where('price_min','between',[$data['p_min'],$data['p_max']])->select();
        }
        $this->assign('pri',$pri);
        return $this->fetch('searchkey');
    }

    /**
     *公墓商城资讯
     */
    public function news()
    {
        $news=Db::name('cemetery_article')->where(['category'=>1,'is_recom'=>1])->paginate(10);
        $this->assign('news',$news);
        return $this->fetch('');
    }

    /**
     * 公墓商城优惠
     */
    public function discount()
    {
        $cliCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('click_amount desc')->select();
        $discount=Db::name('cemetery_article')->where(['category'=>2,'is_recom'=>1])->paginate(10);
        $this->assign('discount',$discount);
        $this->assign('cliCm',$cliCm);
        return $this->fetch('');
    }

    /**
     * 咨询详情页
     */
    public function detail()
    {
        $request = Request::instance();
        $id=$request->param('id');
        $article=Db::name('cemetery_article')->where('id',$id)->find();
        $this->assign('arti',$article);
        return $this->fetch('');
    }

    /**
     * 首页文章列表
     */
    public function document()
    {
        $request = Request::instance();
        $id=$request->param('id');
        $cate_id=Db::name('document_category')->where('id',$id)->find();
        $doc=Db::name('document')->where('category_id',$cate_id['id'])->select();
        foreach ($doc as $key=>$value){
            $doc[$key]['arti']=Db::name('document_article')->where('doc_id',$value['id'])->find();
        }

        $this->assign('cateid',$cate_id);
        $this->assign('doc',$doc);
        return $this->fetch('');
    }

    /**
     * 首页文章详情页
     */
    public function doc_detail()
    {
        $request = Request::instance();
        $id=$request->param('id');
        $tit=Db::name('document')->where('id',$id)->find();
        $article=Db::name('document_article')->where('doc_id',$id)->find();
        $this->assign('arti',$article);
        $this->assign('tit',$tit);
        return $this->fetch('');
    }

}