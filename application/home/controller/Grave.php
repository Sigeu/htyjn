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

use app\business\model\CemeteryTomb;
use app\common\controller\HomeBase;
use think\Paginator;
use think\Request;
use think\Db;

/**
 * 公墓商城陵园详情控制器
 * Class Grave
 * @package app\home\controller
 * @author ding <dingzhangze@163.com>
 * @date 2017/7/21
 */
class Grave extends HomeBase {


    public $id;
    public $grave;

    function __construct(Request $request = null)
    {
        parent::__construct($request);
        $request = Request::instance();
        $this->id=$request->param('id');
        $this->grave=Db::name('cemetery_tomb')->where('id',$this->id)->find();
        $comment=Db::name('cemetery_comment')->where('create_by',$this->grave['create_by'])->select();
        $news=Db::name('cemetery_article')->where('create_by',$this->grave['create_by'])->select();
        $image=Db::name('grave_photo')->where(['create_by'=>$this->grave['create_by'],'grave_id'=>$this->id,'is_deleted'=>0])->select();
        $this->assign('image',$image);
        $this->assign('news',$news);
        $this->assign('comment',$comment);
        $this->assign('grave',$this->grave);
    }

    /**
     * @return mixed
     * 陵园详情首页
     */
    public function index()
    {
        Db::name('cemetery_tomb')->where('id',$this->id)->setInc('click_amount',1);
        $slider=Db::name('grave_slider')->where(['create_by'=>$this->grave['create_by'],'status'=>1,'grave_id'=>$this->id])->select();
        $this->assign('slider',$slider);
        $this->__getTombInfo();
        return $this->fetch();
    }

    /**
     * 墓区详情
     */
    public function tomb()
    {
        $request = Request::instance();
        $tid=$request->param('tid');
        $row=Db::name('cemetery_sn')->where('area_id',$tid)->column('row_id');
        $row_id=array_unique($row);
        if (!$row_id) {
            $tlist = [];
        }else {
            $tlist=Db::name('cemetery_sn')->where(['row_id'=>$row_id['0'],'area_id'=>$tid])->select();
        }

        $tombs=Db::name('cemetery_tomb')->where('id',$tid)->find();
        $cate=Db::name('cemetery_category')->where('id',$tombs['cate_id'])->find();
        $this->assign('row_id',$row_id);
        $this->assign('tombs',$tombs);
        $this->assign('cate',$cate);
        $this->assign('tlist',$tlist);
        $this->__getTombInfo();
        return $this->fetch();
    }

    public function ajaxGetGraveList()
    {
        $rowId = $this->request->param();

        $data = Db::name('cemetery_sn')->where(['row_id'=>$rowId['row_id'],'area_id'=>$rowId['tid']])->select();

        $this->assign('tlist',$data);
        return $this->fetch('_grave_list');
    }

    public function __getTombInfo()
    {
        $tomb=Db::name('cemetery_tomb')->where('pid',$this->id)->where('is_deleted', 0)->select();
        $this->assign('tomb',$tomb);
    }

    /**
     * 验证码
     */
    public function verify_code()
    {
        $array = array(
            'imageW' => 100,
            'imageH' => 40,
            'length' => 4,
            'fontSize'=>14
        );

        return captcha("", $array);
    }

    /**
     * 预约看墓
     */
    public function orderinfo()
    {
        $data = $this->request->param();
//        $captcha=$data['captcha'];
//        if(!captcha_check($captcha)){
//            $this->error('验证码错误');
//        };
        $map=[
            'grave'=>$data['comname'],
            'tomb'=>$data['muxue'],
            'cemetery_sn'=>$data['tombId'],
            'customer'=>$data['username'],
            'order_time'=>$data['date'],
            'create_by'=>$data['create_by'],
            'phone'=>$data['mobile'],
//            'address'=>$data['address'],
            'create_time'=>time()
        ];
        $res=Db::name('cemetery_bespeak')->insert($map);
        if($res){
            $this->success('提交成功','','1');
        }else{
            $this->error('提交失败，稍后再试');
        }
    }

    /**
     * 陵园介绍
     */
    public function introduce()
    {
        $this->title='墓园介绍';
        return $this->fetch();
    }

    /**
     * 陵园交通
     */
    public function traffic()
    {
        return $this->fetch();
    }

    /**
     * 在售墓穴
     */
    public function onsale()
    {

        $map = ['create_by'=>$this->grave['create_by'],'pid'=>$this->grave['id']];
        $tombs = CemeteryTomb::getList($map, 8);
        
        $this->assign('tombs',$tombs);

        $this->__sale();
        return $this->fetch();
    }

    /**
     * 在售墓穴搜索
     */
    public function sale_search()
    {
        $this->__sale();
        $request = Request::instance();
        $data=$request->param();
        if(isset($data['c_id'])){
            $search=Db::name('cemetery_tomb')->where(['pid'=>$data['id'],'cate_id'=>$data['c_id']])->paginate(8);
        }else{
            $search=Db::name('cemetery_tomb')->where(['pid'=>$data['id'],'direction'=>$data['dire']])->paginate(8);
        }
        $this->assign('search',$search);
        return $this->fetch('onsale');
    }

    /**
     *墓穴信息
     */
    public function __sale()
    {
        $request = Request::instance();

        $data=$request->param();

        if (!isset($data['c_id'])) {
            $data['c_id'] = 0;
        }
        if (!isset($data['dire'])) {
            $data['dire'] = " ";
        }

        $cate=Db::name('cemetery_category')->where('create_by',$this->grave['create_by'])->select();
        $dire=Db::name('cemetery_tomb')->where('pid','<>','0')->where(['create_by'=>$this->grave['create_by'],'pid'=>$this->grave['id']])->column('direction');
        $dire=array_unique($dire);
        $this->assign('data',$data);
        $this->assign('dire',$dire);
        $this->assign('cate',$cate);
    }

    /**
     * 陵园图片展示
     */
    public function grave_photo()
    {
        $images=Db::name('grave_photo')->where(['create_by'=>$this->grave['create_by'],'is_deleted'=>0,'grave_id'=>$this->id])->paginate(9);
        $this->assign('images',$images);
        return $this->fetch();
    }

    /**
     * 陵园图片详情展示
     */
    public function grave_photo_show()
    {
        $request = Request::instance();
        $data=$request->param('p_id');
        $img=Db::name('grave_photo_pic')->where('photo_id',$data)->select();
        $this->assign('imgs',$img);
        return $this->fetch();
    }

    /**
     * 陵园点评
     */
    public function comment()
    {
        if ($this->request->isPost()) {
            if (!$this->user) {
                // 未登录状态 跳转到登录页面
//            $callbackUrl = Env::get('web.host').substr($this->request->url(), 1);
                $callbackUrl = Env::get('web.host');
                $this->redirect('http://bz.yjn100.com/member/index.php?act=login&ref_url='.$callbackUrl);
            }
            else{
                $request = Request::instance();
                $data=$request->param( );
                $data['message']=htmlspecialchars($data['message']);

                $res=Db::name('cemetery_comment')->insert($data);
                if($res){
                    $this->success('发表点评成功');
                }else{
                    $this->error('发表失败，稍后再试！');
                }
            }
        }

        return $this->fetch();
    }

    /**
     * 陵园动态
     */
    public function news()
    {
        return $this->fetch();
    }

    /**
     * 陵园动态详情
     */
    public function news_detail()
    {
        $request = Request::instance();
        $data=$request->param('aid');
        $article=Db::name('cemetery_article')->where('id',$data)->find();
        $this->assign('arti',$article);
        return $this->fetch('');
    }

}