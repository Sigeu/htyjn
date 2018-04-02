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

namespace app\api\controller;

use app\common\controller\ApiLogin;
use axios\tpr\core\Api;
use think\Db;
use think\Request;

/**
 * 接口类名
 * @desc 接口类描述
 * @package app\index\controller
 */
class Cemetery extends ApiLogin
{

    /**
     * ding-App端公墓商城数据接口
     * @desc App端公墓商城数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int page 第几页（必须）
     * @parameter int size 每页个数（可选默认“20”）
     * @response
     */
    public function appcemeteryData()
    {
        $page = isset($this->param['page']) && !empty($this->param['page']) ? $this->param['page'] : 1;
        $size = isset($this->param['size']) && !empty($this->param['size']) ? $this->param['size'] : 20;
        $tomb = Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('rand()')->page($page, $size)->select();
        if (!$tomb) {
            $this->wrong(0, '暂无数据');
        }

        if ($tomb) {
            foreach ($tomb as $key=>$item) {
                $tomb[$key]['image_id'] = get_url_with_domain($item['image_id']);
                $tomb[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$item['create_by'],'status'=>1])->select();

                foreach ($tomb[$key]['slider'] as $skey=>$value){
                    $tomb[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
                }
            }
        }

        $this->response($tomb);
    }

    /**
     * ding-App端公墓商城首页数据接口
     * @desc App端公墓商城首页数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @response
     */

    public function appcemeteryIndex()
    {
        //首页陵园
        $cemetery=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('rand()')->limit('8')->select();
        foreach ($cemetery as $key=>$val){
            $cemetery[$key]['image_id']=get_url_with_domain($val['image_id']);
            $cemetery[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$val['create_by'],'status'=>1])->select();

            foreach ($cemetery[$key]['slider'] as $skey=>$value){
                $cemetery[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
            }
        }
        //陵园排行
        $newCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('id desc')->select();
        foreach ($newCm as $key=>$val){
            $newCm[$key]['image_id']=get_url_with_domain($val['image_id']);
            $newCm[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$val['create_by'],'status'=>1])->select();

            foreach ($newCm[$key]['slider'] as $skey=>$value){
                $newCm[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
            }
        }


        $cliCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('click_amount desc')->select();
        foreach ($cliCm as $key=>$val){
            $cliCm[$key]['image_id']=get_url_with_domain($val['image_id']);
            $cliCm[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$val['create_by'],'status'=>1])->select();

            foreach ($cliCm[$key]['slider'] as $skey=>$value){
                $cliCm[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
            }
        }


        $staCm=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->order('start_level desc')->select();
        foreach ($staCm as $key=>$val){
            $staCm[$key]['image_id']=get_url_with_domain($val['image_id']);
            $staCm[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$val['create_by'],'status'=>1])->select();

            foreach ($staCm[$key]['slider'] as $skey=>$value){
                $staCm[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
            }
        }

       $slider=get_banner('4','3');
        foreach ($slider as $k=>$v){
            $slider[$k]['image']=get_url_with_domain($v['image']);
        }

        $data = [
            'slider'=>$slider,//轮播图
            'cemetery'=>$cemetery,//陵园
            'cliCm'=>$cliCm,//点击量排行
            'staCm'=>$staCm,//星级排行
            'newCm'=>$newCm,//最新加入排行

        ];

        $this->response($data, 200, '获取数据成功');
    }

    /**
     * ding-App端公墓商城陵园详情数据接口
     * @desc App端公墓商城陵园详情数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 陵园id（必须）
     * @parameter int create_by  商家id（必须）
     * @response
     */
    public function appgravedetail()
    {
        $id = $this->param['id'];
        $create_by = $this->param['create_by'];

        Db::name('cemetery_tomb')->where('id',$id)->setInc('click_amount',1);

        $slider=Db::name('grave_slider')->where(['create_by'=>$create_by,'status'=>1,'grave_id'=>$id])->select();
        foreach ($slider as $key=>$item) {
            $slider[$key]['image_id'] = get_url_with_domain($item['image_id']);

        }

        $grave=Db::name('cemetery_tomb')->where('id',$id)->find();

        $image=Db::name('grave_photo')->where(['create_by'=>$create_by,'grave_id'=>$id,'is_deleted'=>0])->order('rand()')->limit(4)->select();
        foreach ($image as $key=>$item) {
            $image[$key]['image_id'] = get_url_with_domain($item['image_id']);

        }

        $tomb=Db::name('cemetery_tomb')->where('pid',$id)->where('is_deleted', 0)->order('rand()')->limit(4)->select();
        foreach ($tomb as $key=>$item) {
            $tomb[$key]['image_id'] = get_url_with_domain($item['image_id']);

        }

        $comment=Db::name('cemetery_comment')->where('create_by',$create_by)->order('rand()')->limit(3)->select();
        foreach ($comment as $key=>$item) {
            $comment[$key]['member_avatar'] = get_url_with_domain(Db::table('yun_member')->where('member_id',$item['member_id'])->value('member_avatar'));
        }

        $news=Db::name('cemetery_article')->where('create_by',$create_by)->order('rand()')->limit(3)->select();
        foreach ($news as $key=>$item) {
            $news[$key]['image_id'] = get_url_with_domain($item['image_id']);
            $news[$key]['content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($item['content'])); //过滤html标签
//            $news[$key]['content'] = htmlspecialchars($item['content']);

        }
        $data=[
            'slider'=>$slider,//轮播图
            'grave'=>$grave,//陵园信息
            'image'=>$image,//陵园图片
            'tomb'=>$tomb,//在售墓穴
            'comment'=> $comment,//点评
            'news'=>$news//动态
        ];

        $this->response($data, 200, '获取数据成功');
    }

    /**
     * ding-App端公墓商城查询条件数据接口
     * @desc App端公墓商城查询条件数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @response
     */
   public function appsearchKey()
   {
       $cate=Db::name('cemetery_category')->where('is_deleted',0)->order('rand()')->select();
       $area=Db::name('cemetery_area')->where('pid','<>',0)->select();
       $price=Db::name('cemetery_price')->select();

       $data = [
           'cate'=>$cate,//分类查询
           'area'=>$area,//地区查询
           'price'=>$price//价格查询

       ];

       $this->response($data, 200, '获取数据成功');
   }

    /**
     * ding-App端公墓商城陵园搜索数据接口
     * @desc App端公墓商城陵园搜索数据接口
     * @method post
     * @parameter string keyword 关键字（必须）
     * @parameter string token 用户token（必须）
     * @response
     */
    public function appsearch()
    {
        $key = $this->param['keyword'];
        $search=Db::name('cemetery_tomb')->where('pid','0')->where('name','like', "%{$key}%")->select();
        if (!$search) {
            $this->wrong(0, '暂无数据');
        }

        if($search){
            foreach ($search as $key=>$item) {
                $search[$key]['image_id'] = get_url_with_domain($item['image_id']);
                $search[$key]['slider']=Db::name('grave_slider')->where(['create_by'=>$item['create_by'],'status'=>1])->select();

                foreach ($search[$key]['slider'] as $skey=>$value){
                    $search[$key]['slider'][$skey]['image_id']=get_url_with_domain($value['image_id']);
                }
            }
        }

        $this->response($search);
    }


    /**
     * ding-App端公墓商城陵园筛选查询数据接口
     * @desc App端公墓商城陵园筛选查询数据接口
     * @method post
     * @parameter int cityid 搜索城市id（可选）
     * @parameter int p_min 搜索价格最低价（可选）
     * @parameter int p_max 搜索价格最高价（可选）
     * @parameter string token 用户token（必须）
     * @response
     */
    public function appscreen()
    {
        $data = $this->param;
        $city=Db::name('cemetery_area')->where('id',$data['cityid'])->find();
        $gMap=[
            'grave_city'=>$city['city'],
            'is_deleted'=>0,
            'pid'=>0
        ];

        if($data['cityid']==0 && $data['p_min']==0 && $data['p_max']==0){
            $grave=Db::name('cemetery_tomb')->where(['pid'=>0,'is_deleted'=>0])->select();
        }elseif($data['cityid']==0 && $data['p_min']!==0 && $data['p_max']!==0){
            $grave=Db::name('cemetery_tomb')->where('pid',0)->where('price_min','between',[$data['p_min'],$data['p_max']])->select();
        }elseif ($data['cityid']!==0 && $data['p_min']==0 && $data['p_max']==0){
            $grave=Db::name('cemetery_tomb')->where($gMap)->select();
        }else{
            $grave=Db::name('cemetery_tomb')->where($gMap)->where('price_min','between',[$data['p_min'],$data['p_max']])->select();
        }

        if (!$grave) {
            $this->wrong(0, '暂无数据');
        }

        foreach ($grave as $key=>$item) {
            $grave[$key]['image_id'] = get_url_with_domain($item['image_id']);
        }


        $this->response($grave);
    }

    /**
     * ding-App端公墓商城陵园相册数据接口
     * @desc App端公墓商城陵园相册数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 陵园id（必须）
     * @parameter int create_by  商家id（必须）
     * @response
     */
    public function appgraveImage()
    {
        $id = $this->param['id'];
        $create_by = $this->param['create_by'];

        $image=Db::name('grave_photo')->where(['create_by'=>$create_by,'grave_id'=>$id,'is_deleted'=>0])->select();
        if (!$image) {
            $this->wrong(0, '暂无数据');
        }

        if($image){
            foreach ($image as $key=>$item) {
                $image[$key]['image_id'] = get_url_with_domain($item['image_id']);

            }
        }


        $this->response($image);
    }

    /**
     * ding-App端公墓商城陵园相册图片数据接口
     * @desc App端公墓商城陵园相册图片数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 相册id（必须）
     * @response
     */
    public function appgraveImageshow()
    {
        $request = Request::instance();
        $data=$request->param('id');
        $img=Db::name('grave_photo_pic')->where('photo_id',$data)->select();
        if (!$img) {
            $this->wrong(0, '暂无数据');
        }
        foreach ($img as $key=>$item) {
            $img[$key]['photo_picture_url'] = get_url_with_domain($item['photo_picture_url']);

        }

        $this->response($img);
    }

    /**
     * ding-App端公墓商城陵园在售墓穴筛选条件数据接口
     * @desc App端公墓商城陵园在售墓穴筛选条件数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 陵园id（必须）
     * @parameter int create_by  商家id（必须）
     * @response
     */
    public function appgraveCondition()
    {
        $id = $this->param['id'];
        $create_by = $this->param['create_by'];

        $cate=Db::name('cemetery_category')->where('create_by',$create_by)->select();
        $dire=Db::name('cemetery_tomb')->where('pid','<>','0')->where(['create_by'=>$create_by,'pid'=>$id])->column('direction');
        $dire=array_values(array_unique($dire));

        $data=[
            'cate'=>$cate,
            'dire'=>$dire
        ];

        $this->response($data);
    }

    /**
     * ding-App端公墓商城陵园在售墓穴数据接口
     * @desc App端公墓商城陵园在售墓穴数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 陵园id（必须）
     * @parameter int create_by  商家id（必须）
     * @parameter int page 第几页（必须）
     * @parameter int size 每页个数（可选默认“8”）
     * @response
     */
    public function appgraveOnsale()
    {
        $page = isset($this->param['page']) && !empty($this->param['page']) ? $this->param['page'] : 1;
        $size = isset($this->param['size']) && !empty($this->param['size']) ? $this->param['size'] : 8;
        $id = $this->param['id'];
        $create_by = $this->param['create_by'];

        $map = ['create_by'=>$create_by,'pid'=>$id];
        $tomb=Db::name('cemetery_tomb')->where($map) ->page($page, $size)->select();
        if (!$tomb) {
            $this->wrong(0, '暂无数据');
        }

        if($tomb){
            foreach ($tomb as $key=>$item) {
                $tomb[$key]['image_id'] = get_url_with_domain($item['image_id']);

            }
        }
        $this->response($tomb);
    }

    /**
     * ding-App端公墓商城陵园在售墓穴筛选查询数据接口
     * @desc App端公墓商城陵园在售墓穴筛选查询数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 陵园id（必须）
     * @parameter int c_id 墓型分类id(可选)
     * @parameter string dire 墓区朝向（可选）
     * @response
     */
    public function appgraveSerach()
    {
        $request = Request::instance();
        $data=$request->param();

        if($data['c_id']==0 && $data['dire']==0){
            $search=Db::name('cemetery_tomb')->where(['pid'=>$data['id']])->select();
            foreach ($search as $key=>$item) {
                $search[$key]['image_id'] = get_url_with_domain($item['image_id']);
            }
        }elseif ($data['c_id']!==0 && $data['dire']==0){
            $search=Db::name('cemetery_tomb')->where(['pid'=>$data['id'],'cate_id'=>$data['c_id']])->select();
            foreach ($search as $key=>$item) {
                $search[$key]['image_id'] = get_url_with_domain($item['image_id']);
            }
        }elseif ($data['c_id']==0 && $data['dire']!==0){
            $search=Db::name('cemetery_tomb')->where(['pid'=>$data['id'],'direction'=>$data['dire']])->select();
            foreach ($search as $key=>$item) {
                $search[$key]['image_id'] = get_url_with_domain($item['image_id']);
            }
        }else{
            $search=Db::name('cemetery_tomb')->where(['pid'=>$data['id'],'cate_id'=>$data['c_id']])->where(['direction'=>$data['dire']])->select();
            foreach ($search as $key=>$item) {
                $search[$key]['image_id'] = get_url_with_domain($item['image_id']);
            }
        }

        if (!$search) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($search);
    }

    /**
     * ding-App端公墓商城陵园在售墓穴搜索数据接口
     * @desc App端公墓商城陵园在售墓穴搜索数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id 陵园id（必须）
     * @parameter string keyword 搜索关键字（可选）
     * @response
     */
    public function apptombSerach()
    {
        $request = Request::instance();
        $data=$request->param();
        $search=Db::name('cemetery_tomb')->where('pid',$data['id'])->where('name','like', "%{$data['keyword']}%")->select();
        if (!$search) {
            $this->wrong(0, '暂无数据');
        }
        foreach ($search as $key=>$item) {
            $search[$key]['image_id'] = get_url_with_domain($item['image_id']);
        }

        $this->response($search);
    }

        /**
     * ding-App端公墓商城陵园点评数据接口
     * @desc App端公墓商城陵园点评数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int create_by  商家id（必须）
     * @parameter int page 第几页（必须）
     * @parameter int size 每页个数（可选默认“8”）
     * @response
     */
    public function appgraveComment()
    {
        $page = isset($this->param['page']) && !empty($this->param['page']) ? $this->param['page'] : 1;
        $size = isset($this->param['size']) && !empty($this->param['size']) ? $this->param['size'] : 8;
        $create_by = $this->param['create_by'];
        $comment=Db::name('cemetery_comment')->where('create_by',$create_by)->page($page, $size)->select();
        if (!$comment) {
            $this->wrong(0, '暂无数据');
        }

        if($comment){
            foreach ($comment as $key=>$item) {
                $comment[$key]['member_avatar'] = get_url_with_domain(Db::table('yun_member')->where('member_id',$item['member_id'])->value('member_avatar'));
            }
        }

        $this->response($comment);
    }

    /**
     * ding-App端公墓商城陵园动态数据接口
     * @desc App端公墓商城陵园动态数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int create_by  商家id（必须）
     * @parameter int page 第几页（必须）
     * @parameter int size 每页个数（可选默认“8”）
     * @response
     */
    public function appgraveNews()
    {
        $page = isset($this->param['page']) && !empty($this->param['page']) ? $this->param['page'] : 1;
        $size = isset($this->param['size']) && !empty($this->param['size']) ? $this->param['size'] : 8;
        $create_by = $this->param['create_by'];
        $news=Db::name('cemetery_article')->where('create_by',$create_by)->page($page, $size)->select();
        if (!$news) {
            $this->wrong(0, '暂无数据');
        }

        if($news){
            foreach ($news as $key=>$item) {
                $news[$key]['image_id'] = get_url_with_domain($item['image_id']);
                $news[$key]['content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($item['content'])); //过滤html标签
            }
        }


        $this->response($news);
    }


    /**
     * ding-App端公墓商城陵园动态详情数据接口
     * @desc App端公墓商城陵园动态详情数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id  文章id（必须）
     * @response
     */

    public function appgraveNewsdetail()
    {
        $request = Request::instance();
        $data=$request->param('id');
        $article=Db::name('cemetery_article')->where('id',$data)->find();
        $article['image_id']=get_url_with_domain($article['image_id']);
        $article['content']=str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($article['content']));

        if (!$article) {
            $this->wrong(0, '暂无数据');
        }
        $this->response($article);
    }

    /**
     * ding-App端公墓商城墓区详情数据接口
     * @desc App端公墓商城墓区详情数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int id  墓区id（必须）
     * @response
     */

    public function apptombDetail()
    {
        $request = Request::instance();
        $tid=$request->param('id');

        $tombs=Db::name('cemetery_tomb')->where('id',$tid)->find();
        $tombs['image_id']=get_url_with_domain($tombs['image_id']);
        $cate=Db::name('cemetery_category')->where('id',$tombs['cate_id'])->find();

        $data=[
            'tombs'=>$tombs,
            'cate'=>$cate
        ];

        $this->response($data);
    }


    /**
     * ding-App端公墓商城预约看墓数据接口
     * @desc App端公墓商城预约看墓数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @response
     */

    public function apporderInfo()
    {
        $data = $this->request->param();
        $map=[
            'grave'=>$data['grave'],
            'tomb'=>$data['tomb'],
            'cemetery_sn'=>'',
            'customer'=>$data['customer'],
            'order_time'=>$data['order_time'],
            'create_by'=>$data['create_by'],
            'phone'=>$data['phone'],
            'create_time'=>time()
        ];
        $res=Db::name('cemetery_bespeak')->insert($map);
        if($res){
            $this->response('','200','提交成功');
        }else{
            $this->response('','1','提交失败稍后再试');
        }
    }


    /**
     * ding-App端公墓商城客户购买公墓数据接口
     * @desc App端公墓商城客户购买公墓数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter  int id 用户id（必须）
     * @response
     */
    public function appbuyTomb()
    {
       $id= $this->param['id'];
       $order=Db::name('cemetery_order')->where('buyer_id_1',$id)->select();
       if($order){
           $this->response($order,'200','获取数据成功');
       }else{
           $this->wrong(0, '暂无数据');
       }
    }

    /**
     * ding-App端公墓商城客户公墓消费流水数据接口
     * @desc App端公墓商城客户公墓消费流水数据接口
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter  int id 用户id（必须）
     * @response
     */
    public function appbuyConsme()
    {
        $id= $this->param['id'];
        $consme=Db::name('cemetery_consume')->where('member_id',$id)->select();
        if($consme){
            $this->response($consme,'200','获取数据成功');
        }else{
            $this->wrong(0, '暂无数据');
        }
    }

}


