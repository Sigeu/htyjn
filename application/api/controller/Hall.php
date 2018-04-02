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

use app\api\model\HallFollow;
use app\api\model\HallGroup;
use app\api\model\HallGroupMember;
use app\api\model\HallLingpaiStyle;
use app\api\model\HallStyle;
use app\api\model\HallStyleCategory;
use app\api\model\HallWorshipStyle;
use app\api\model\MemberModel;
use app\api\validate\BaseValidate;
use app\common\controller\ApiLogin;
use think\Db;
use app\api\model\Hall as HallModel;

/**
 * Class Hall
 * @package app\api\controller
 */
class Hall extends ApiLogin
{

    /**
     * 删除纪念馆
     * @desc 删除纪念馆
     * @method post
     * @parameter int id 纪念馆ID（必须）
     */
    public function DelHall()
    {
        $data = $this->param;
        if (empty($data['id'])){
            $this->response(null, 0, '缺乏必要参数');
        }elseif (!$hall_type = Db::name('Hall')->where(array('id'=>$this->param['id']))->field('hall_type')->find()['hall_type']){
            $this->response(null, 0, '数据不存在');
        } elseif (Db::name('Hall')->delete($data['id'])){
            if ($hall_type == 1) {
                Db::name('Hall_one')->where(array("hall_id"=>$data['id']))->delete();
            } elseif ($hall_type == 2){
                Db::name('Hall_two')->where(array("hall_id"=>$data['id']))->delete();
            } else {
                Db::name('Hall_family')->where(array("hall_id"=>$data['id']))->delete();
            }

            // TODO 同时删除该纪念馆的所有群、追思留言、追忆文选、追忆相册
            Db::name('HallGroup')->where('hall_id', $data['id'])->delete();
            Db::name('HallLeaveMessage')->where('hall_id', $data['id'])->delete();
            Db::name('HallArticle')->where('hall_id', $data['id'])->delete();

            // TODO

            $this->response(null, 200, '删除成功');
        }else{
            $this->response(null, 0, '删除失败');
        }
    }


    //------------------------------------------------------------------------------------------------------------------
    /**
     * 设置数据字段数据
     * @param $table
     * @param $param
     * @param $must
     * @return array
     */
    protected function set_data($table,$param,$must)
    {
        $data = array();
        $table = Db::name('hall')->getTableFields(["table"=>$table]);
        foreach ($table as $key => $value){
            if (array_key_exists($value,$param) && $param[$value]){
                $data[$value] = $param[$value];
            }
        }
        foreach ($must as $key => $value){
            if (!array_key_exists($value,$data)){
                $this -> response(null,0,'缺乏必要参数');
            }
        }
        return $data;
    }

    /**
     * 纪念馆乐曲
     * @desc 乐曲列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int music_type 乐曲类型（默认为0）__0=推荐乐曲1=佛教音乐2=西方宗教
     * @response string music_name 乐曲名称
     * @response string music_url 乐曲URL
     * @response string music_type 乐曲类型0=推荐乐曲1=佛教音乐2=西方宗教
     */
    public function HallMusicList()
    {
        $musicType = $this->request->param('music_type',0);
        $map = [
            'music_type' => $musicType,
            'music_status' => 1
        ];
        $list = Db::name("HallMusic")->where($map)->field('music_status,create_at',true)->select();
        if($list){
            $this -> response($list);
        }else{
            $this -> response(null,0,'暂无数据');
        }

    }

    /**
     * 纪念馆添加
     * @desc 纪念馆添加
     * @method post
     */
    public function AddHall()
    {
        $this->param['create_at'] = time();
        $data = $this->set_data("tp_hall",$this->param,array("hall_name","hall_type","hall_style","hall_worship_style","hall_member_id"));

        if ($data['hall_type'] == 1){
            if (isset($data['one_img'])){
                $data['hall_img'] = $data['one_img'];
            }
        }else{
            $data['hall_img'] = Db::name('hall_style')->where('id',$data['hall_style'])->value('style_img');
        }

        if ($id = Db::name('hall')->insert($data,false,true)){
            $this->param['hall_id'] = $id;
            if ($data['hall_type'] == 1){
                $result = $this -> AddOneHall($this->param);
            }elseif($data['hall_type'] == 2){
                $result = $this -> AddTwoHall($this->param);
            }elseif($data['hall_type'] == 3){
                $result = $this -> AddFamilyHall($this->param);
            }
            if ($result == 1){
                $this -> response();
            }
        }
        Db::name('hall')->where('id',$id)->delete();
        $this -> response(null,0,'添加失败');
    }

    /**
     * 添加单人馆数据
     */
    public function AddOneHall($data,$act = 'add')
    {
        $act == 'add' ? $array = array("hall_id","one_name","one_sex","one_birthday","one_death","one_epitaph") : $array = [];
        $data1 = $this->set_data("tp_hall_one",$data,$array);
        if (count($data1) == 1 && !empty($data1['hall_id'])){
            return true;
        }

        if ($act == 'add'){
            $res = Db::name('hall_one')->insert($data1);
            if ($res) {
                // 创建馆成功 则创建该纪念馆群组
                $this->_createGroup($data['hall_id']);
                return true;
            } else {
                return false;
            }
        } else {
            unset($data1['hall_id']);
            $data1['update_at'] = time();
            return Db::name('hall_one')->where('hall_id',$data['hall_id'])->update($data1) ? true : false;
        }
    }

    /**
     * 添加双人馆数据
     */
    public function AddTwoHall($data,$act = 'add')
    {
        $act == 'add' ? $array = array("hall_id","two_name1","two_sex1","two_birthday1","two_death1","two_name2","two_sex2","two_birthday2","two_death2") : $array = [];
        $data1 = $this->set_data("tp_hall_two",$data, $array);
        if (count($data1) == 1 && !empty($data1['hall_id'])){
            return true;
        }
        if ($act == 'add'){
            $res = Db::name('hall_two')->insert($data1);
            if ($res) {
                // 创建馆成功 则创建该纪念馆群组
                $this->_createGroup($data['hall_id']);
                return true;
            } else {
                return false;
            }
        } else {
            unset($data1['hall_id']);
            $data1['update_at'] = time();
            return Db::name('Hall_two')->where('hall_id',$data['hall_id'])->update($data1) ? true : false;
        }
    }

    /**
     * 添加家族馆数据
     */
    public function AddFamilyHall($data,$act = 'add')
    {
        $act == 'add' ? $array = array("hall_id") : $array = [];
        $data1 = $this->set_data("tp_hall_family",$data, $array);
        if (count($data1) == 1 && !empty($data1['hall_id'])){
            return true;
        }
        if ($act == 'add'){
            $res = Db::name('hall_family')->insert($data1);
            if ($res) {
                // 创建馆成功 则创建该纪念馆群组
                $this->_createGroup($data['hall_id']);
                return true;
            } else {
                return false;
            }
        } else {
            unset($data1['hall_id']);
            $data1['update_at'] = time();
            return Db::name('Hall_family')->where('hall_id',$data['hall_id'])->update($data1) ? true : false;
        }
    }

    /**
     * 编辑纪念馆
     * @desc 编辑纪念馆
     * @method post
     * @parameter int id 数据id（必选）
     */
    public function EditHall()
    {
        $id = $this->request->param('id');
        if (empty($id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        if(isset($this->param['token'])) {
            unset($this->param['token']);
        }

        $data = $this->set_data("tp_hall", $this->param, array("id"));

        if (empty($data)){
            $this -> response(null,0,'缺乏必要参数');
        } else{
            $data['update_at'] = time();
            Db::name('Hall')->where('id',$id)->update($data);

            $info = Db::name('Hall')->where('id',$id)->field('id,hall_type')->find();
            $data = $this->param;
            unset($data['id']);
            $data['hall_id'] = $info['id'];
            $data['update_at'] = time();

            if ($info['hall_type'] == 1){
                $result = $this -> AddOneHall($data,'update');
            }elseif($info['hall_type'] == 2){
                $result = $this -> AddTwoHall($data,'update');
            }elseif($info['hall_type'] == 3){
                $result = $this -> AddFamilyHall($data,'update');
            }
        }

        isset($result) && $result == true ? $this -> response(null,200,'修改成功') : $this -> response(null,0,'修改失败');
    }

    /**
     * 纪念馆风格使用数量添加
     * @desc 纪念馆风格使用数量添加
     * @method post
     * @parameter int id 数据id（必选）
     */
    public function HallStyleUseNum()
    {
        $id = $this->request->param('id');
        if (empty($id)) {
            $this -> response(null,0,'缺乏必要参数');
        }
        if (Db::name('hallStyle') -> where('id', $id)->setInc('style_num',1)){
            $this -> response(null,200,'成功');
        } else {
            $this -> response(null,0,'失败');
        }

    }

    /**
     * 纪念馆相册列表
     * @desc 纪念馆相册列表
     * @method post
     * @parameter int hall_id 纪念馆ID（必选）
     * @parameter int page 页码
     * @parameter int rows 条数
     */
    public function HallPhotoList()
    {
        $page = empty($this->request->param('page')) ? 1 : $this->request->param('page');
        $rows = empty($this->request->param('rows')) ? 10 : $this->request->param('rows');
        $hall_id = $this->request->param('hall_id');
        if (empty($hall_id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        $list = Db::name('hall_photo')->where('hall_id',$hall_id)->where("status",1)->field('id,photo_name,create_at')->page($page,$rows)->select();
        foreach ($list as $key => $value){
            $list[$key]['create_at'] = date("Y-m-d",$value['create_at']);
            $num = Db::name('hall_photo_picture')->query("SELECT Count(*) as  num,photo_picture_url as url FROM tp_hall_photo_picture WHERE photo_id = ".$value['id']);
            $list[$key]['num'] = $num[0]['num'];
            $list[$key]['url'] = get_url_with_domain($num[0]['url']);
        }
        if ($list){
            $this -> response($list);
        } else {
            $this -> response(null,0,'暂无数据');
        }
    }

    /**
     * 纪念馆相册添加
     * @desc 纪念馆相册添加
     * @method post
     * @parameter int hall_id 纪念馆ID（必选）
     * @parameter string photo_name 相册名称（必选）
     */
    public function AddHallPhoto()
    {
        $hall_id = $this->request->param('hall_id');
        $photo_name = $this->request->param('photo_name');
        if (empty($hall_id) || empty($photo_name)){
            $this -> response(null,0,'缺乏必要参数');
        }
        if (Db::name('HallPhoto')->insert(array('hall_id'=>$hall_id,'photo_name'=>$photo_name,'create_at'=>time()))){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }

    }

    /**
     * 纪念馆相册列表
     * @desc 纪念馆相册列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int photo_id 相册ID（必选）
     * @parameter int page 页码
     * @parameter int rows 条数
     */
    public function HallPhotoPictureList()
    {
        $page = empty($this->request->param('page')) ? 1 : $this->request->param('page');
        $rows = empty($this->request->param('rows')) ? 10 : $this->request->param('rows');
        $photo_id = $this->request->param('photo_id');
        if (empty($photo_id)){
            $this -> response(null,0,'缺乏必要参数');
        }

        $list = Db::name('HallPhotoPicture')->where('photo_id',$photo_id)->page($page,$rows)->select();
        if ($list){

            foreach($list as $key=>$value) {
                $list[$key]['photo_picture_url'] = get_url_with_domain($value['photo_picture_url']);
            }

            $this -> response($list);
        } else {
            $this -> response(null,0,'暂无数据');
        }
    }

    /**
     * 纪念馆图片添加
     * @desc 纪念馆图片添加
     * @method post
     * @parameter int photo_id 相册ID（必选）
     * @parameter string photo_picture_url 图片url（必选）
     */
    public function AddHallPhotoPicture()
    {

        $photo_id = $this->request->param('photo_id');
        $photo_picture_url = $this->request->param('photo_picture_url');

        if (empty($photo_id) || empty($photo_picture_url)){
            $this -> response(null,0,'缺乏必要参数');
        }

        if (substr_count($this->request->param('photo_picture_url'),',') > 0){
            $photo_picture_url = explode(',',$photo_picture_url);
            foreach ($photo_picture_url as $key => $value){
                $data[$key]['photo_id'] = $photo_id;
                $data[$key]['photo_picture_url'] = $value;
            }
        } else {
            $data['photo_id'] = $photo_id;
            $data['photo_picture_url'] = $photo_picture_url;
        }

        if (count($data)>1 && empty($data['photo_id'] )){
            $result = Db::name('HallPhotoPicture')->insertAll($data);
        }else{
            $result = Db::name('HallPhotoPicture')->insert($data);
        }

        if ($result){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }

    /**
     * 纪念馆图片删除
     * @desc 纪念馆图片删除
     * @method post
     * @parameter int id 图片ID（必选）
     */
    public function DelHallPhotoPicture()
    {
        $id = $this->request->param('id');
        if (empty($id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        if (Db::name('HallPhotoPicture')->where('id',$id)->delete()){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }

    /**
     * 纪念馆文章列表
     * @desc 纪念馆文章列表
     * @method post
     * @parameter int hall_id 纪念馆ID（必选）
     * @parameter int page 页码
     * @parameter int rows 条数
     */
    public function HallArticleList()
    {
        $page = empty($this->request->param('page')) ? 1 : $this->request->param('page');
        $rows = empty($this->request->param('rows')) ? 10 : $this->request->param('rows');
        $hall_id = $this->request->param('hall_id');
        if (empty($hall_id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        $list = Db::name('HallArticle')->where('hall_id',$hall_id)->where("status",1)->field('id,article_title')->page($page,$rows)->select();
        if ($list){
            $this -> response($list);
        } else {
            $this -> response(null,0,'暂无数据');
        }
    }

    /**
     * 纪念馆文章内容
     * @desc 纪念馆文章内容
     * @method post
     * @parameter int id 文章id（必选）
     */
    public function HallArticleContent()
    {
        config('database.prefix', '');
        $id = $this->request->param('id');
        if (empty($id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        $list = Db::name('tp_hall_article')->where('id',$id)->find();
        $list['member_nickname'] = Db::name('tp_hall')->alias("h")->join('yun_member m','h.hall_member_id = m.member_id')->
        field("m.member_nickname")->where('id',$list['hall_id'])->find()['member_nickname'];
        $list['create_at'] = date('Y-m-d H:i:s',$list['create_at']);
        $list['article_content'] = str_replace(array("&nbsp;", "\r\n", "\r", "\n", "/r/n", "/r", "/n"), '', strip_tags($list['article_content'])); //过滤html标签

        if ($list){
            $this->response($list);
        } else {
            $this->response(null,0,'暂无数据');
        }
    }

    /**
     * 纪念馆文章添加
     * @desc 纪念馆文章添加
     * @method post
     * @parameter int hall_id 纪念馆ID（必选）
     * @parameter string article_title 纪念馆标题（必选）
     * @parameter string article_content 纪念馆内容（必选）
     */
    public function AddHallArticle()
    {
        $hall_id = $this->request->param('hall_id');
        $article_title = $this->request->param('article_title');
        $article_content = $this->request->param('article_content');
        if (empty($hall_id) || empty($article_title) || empty($article_content)){
            $this -> response(null,0,'缺乏必要参数');
        }
        $data = array('hall_id'=>$hall_id,'article_title'=>$article_title,'article_content'=>$article_content,'create_at'=>time());
        if (Db::name('HallArticle')->insert($data)){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }

    /**
     * 纪念馆文章编辑
     * @desc 纪念馆文章编辑
     * @method post
     * @parameter int id 数据ID（必选）
     * @parameter string article_title 纪念馆标题（必选）
     * @parameter string article_content 纪念馆内容（必选）
     */
    public function EditHallArticle()
    {
        $id = $this->request->param('id');
        $article_title = $this->request->param('article_title');
        $article_content = $this->request->param('article_content');
        if (empty($id) || empty($article_title) || empty($article_content)){
            $this -> response(null,0,'缺乏必要参数');
        }
        $data = array('article_title'=>$article_title,'article_content'=>$article_content);
        if (Db::name('HallArticle') -> where('id',$id) ->update($data)){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }

    /**
     * 纪念馆文章删除
     * @desc 纪念馆文章删除
     * @method post
     * @parameter int id 数据（必选）
     */
    public function DelHallArticle()
    {
        $id = $this->request->param('id');
        if (empty($id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        if (Db::name('HallArticle')->where('id',$id)->delete()){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }


    /**
     * 纪念馆留言添加
     * @desc 纪念馆留言添加
     * @method post
     * @parameter int hall_id 纪念馆ID（必选）
     * @parameter int member_id 会员id（必选）
     * @parameter string content  内容（必选）
     */
    public function AddHallLeaveMessage()
    {
        $hall_id = $this->request->param('hall_id');
        $member_id = $this->request->param('member_id');
        $content = $this->request->param('content');
        if (empty($hall_id) || empty($member_id) || empty($content)){
            $this -> response(null,0,'缺乏必要参数');
        }
        $data = array('hall_id'=>$hall_id,'member_id'=>$member_id,'content'=>$content,'create_at'=>time());
        if (Db::name('HallLeaveMessage')->insert($data)){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }

    /**
     * 纪念馆留言删除
     * @desc 纪念馆留言删除
     * @method post
     * @parameter int id 数据（必选）
     */
    public function DelHallLeaveMessage()
    {
        $id = $this->request->param('id');
        if (empty($id)){
            $this -> response(null,0,'缺乏必要参数');
        }
        if (Db::name('HallLeaveMessage')->where('id',$id)->delete()){
            $this -> response(null,200);
        } else {
            $this -> response(null,0,'失败');
        }
    }

    /**
     * 纪念馆追思留言
     * @desc 纪念馆追思留言
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（可选默认为“0”获取所有）
     * @parameter int page 页码
     * @parameter int rows 数量
     */
    public function HallLeaveMessage(){
        $page = empty($this->request->param('page')) ? 1 : $this->request->param('page');
        $rows = empty($this->request->param('rows')) ? 10 : $this->request->param('rows');
        $hallId = empty($this->request->param('hall_id')) ? 0 : $this->request->param('hall_id');

        $map = '';
        if ($hallId) {
            $map = 'WHERE h.id = '.$hallId;
        }

        $list = Db::query("SELECT l.*,m.member_nickname,m.member_avatar,h.hall_name FROM tp_hall_leave_message AS l
                                   LEFT JOIN yun_member AS m ON l.member_id = m.member_id
                                   LEFT JOIN tp_hall AS h ON l.hall_id = h.id
                                   ".$map."
                                   ORDER BY l.create_at desc LIMIT ".($page-1) * $rows.", $rows");

        if ($list) {

            foreach($list as $key=>$value) {

                $list[$key]['member_avatar'] = get_url_with_domain($value['member_avatar']);
            }

            $this -> response($list,200,'成功');
        }else {
            $this -> response(null,0,'暂无数据');
        }
    }















    /***************************** andy *****************************/

    /**
     * andy-获取纪念馆列表
     * @desc 获取纪念馆列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_type 纪念馆类型（可选默认为“0”）__如果传入“12”表示普通单人馆和双人馆
     * @parameter int is_famous 是否名人馆（可选默认为“0”）__0-所有__1-名人__2-普通个人馆
     * @parameter int sort_type 纪念馆排序规则（可选默认为“create_at”）
     * @parameter int keyword 纪念馆名称查询（可选默认为“”）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“20”）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallList()
    {
        $hallType = $this->request->param('hall_type', 0);
        $isFamous = $this->request->param('is_famous', 0);
        $sortType = $this->request->param('sort_type') ? $this->request->param('sort_type') : 'create_at';
        $search = $this->request->param('keyword') ? $this->request->param('keyword') : '';

        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);

        $loginUid = $this->user['member_id']; // 获取当前登录用户ID

        $data = HallModel::getHallList($loginUid, $hallType, 0, $sortType.' desc', $page, $size, ['hall_style', 'hall_worship_style', 'hall_music'], $search, $isFamous);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        
        $this->response($data);
    }

    /**
     * andy-获取我的纪念馆列表
     * @desc 获取我的纪念馆列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_type 纪念馆类型（可选默认为“0”）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“20”）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function myHallList()
    {

        $hallType = $this->request->param('hall_type', 0);
        $memberId = $this->user['member_id'];

        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);

        $loginUid = $this->user['member_id']; // 获取当前登录用户ID

        $data = HallModel::getHallList($loginUid, $hallType, $memberId, 'create_at desc', $page, $size, ['hall_style', 'hall_worship_style', 'hall_music']);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($data);
    }

    /**
     * andy-获取我关注的纪念馆列表
     * @desc 获取我关注的纪念馆列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int member_id 用户ID（可选默认为“0”）__如果为“0”表示是当前登录用户ID
     * @parameter int is_famous 是否名人纪念馆（可选默认为“0”）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“20”）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function myFollowingHall()
    {

        $isFamous = $this->request->param('is_famous', 0);
        $memberId = $this->request->param('member_id', 0);
        $loginUid = $this->user['member_id']; // 获取当前登录用户ID
        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);

        // 如果未传入member_id 表示是当前登录用户
        if (!$memberId) {
            $memberId = $loginUid;
        }

        $data = HallModel::getMyFollowingHall($memberId, $isFamous, $page, $size);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($data);
    }

    /**
     * andy-获取纪念馆详情
     * @desc 根据具体页面参数获取纪念馆详情
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallDetail()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $hallId = $this->param['hall_id'];
        $info = HallModel::getInfoById($hallId, ['hall_style', 'hall_music', 'hall_worship_style'], $this->user['member_id']);

        if(!$info) {
            $this->wrong(0, '请求的纪念馆不存在');
        }
        
        $this->response($info);

    }

    /**
     * andy-纪念馆风格分类
     * @desc 获取纪念馆风格分类
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_type $hallType 纪念馆风格类型1=单人馆__2双人馆__3多人馆（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallStyleCategory()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_type'])->MustBePostiveInt(['hall_type']);

        $hallType = $this->param['hall_type'];
        $data = HallStyleCategory::getDataByPid($hallType);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        $this->response($data);
    }

    /**
     * andy-获取纪念馆风格列表
     * @desc 获取纪念馆风格列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int style_cid 纪念馆风格分类ID
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallStyle()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['style_cid'])->MustBePostiveInt(['style_cid']);

        $data = HallStyle::getDatas($this->param['style_cid']);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        $this->response($data);
    }

    /**
     * andy-获取祭拜大厅风格列表
     * @desc 获取祭拜大厅风格列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int style_cid $styleCid 纪念馆风格分类ID
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallWorshipStyle()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['style_cid'])->MustBePostiveInt(['style_cid']);

        $data = HallWorshipStyle::getDatas($this->param['style_cid']);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        $this->response($data);
    }

    /**
     * andy-获取灵牌风格列表
     * @desc 获取灵牌风格列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallLingpaiStyle()
    {
        $data = HallLingpaiStyle::getDatas();

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }
        $this->response($data);
    }

    /**
     * andy - 纪念馆关注 / 取消关注
     * @desc 纪念馆关注 / 取消关注
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（必须）
     * @response
     */
    public function follow()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $memberId = $this->user['member_id'];
        $hallId = $this->param['hall_id'];

        $data = [
            'member_id' => $memberId,
            'hall_id' => $hallId
        ];

        // 判断是否关注过
        if (HallFollow::exist($data)) {
            // 已经关注过 取消关注
            $result = HallFollow::follow($memberId, $hallId);
            if ($result) {
                $this->response($result, 200, '取消关注成功');
            }else {
                $this->wrong(0, '取消关注失败');
            }
        }

        // 关注
        $result = HallFollow::follow($memberId, $hallId);
        if ($result) {
            $this->response($result, 200, '关注成功');
        }else {
            $this->wrong(0, '关注失败');
        }

    }

    /**
     * andy-纪念馆访问量自增
     * @desc 纪念馆访问量自增
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function setViewInc()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $hallId = $this->param['hall_id'];
        if(!HallModel::exist($hallId)) {
            $this->wrong(0, '请求的纪念馆不存在');
        }

        HallModel::setViewInc($hallId);
        $this->response();
    }

    /**
     * andy-纪念馆分享奖励
     * @desc 纪念馆分享奖励
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function shareReward()
    {
        $memberId = $this->user['member_id'];
        $rewardCoins = 60;
        $data['coins'] = MemberModel::self()->shareReward($memberId, $rewardCoins);
        $this->response($data, 200, '分享成功，奖励'.$rewardCoins.'个纪念币');
    }

    /**
     * andy-纪念馆大厅祭拜排行
     * @desc 纪念馆大厅祭拜排行
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（必须）
     * @parameter int rank_type 排行类型（可选默认为“total_rank”__总排行：total_rank__日排行：day_rank）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“20”）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function worshipRank()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);

        $params = $this->param;
        $hallId = $params['hall_id'];

        $page = isset($params['page']) && $params['page'] != '' ? $params['page'] : 1;
        $size = isset($params['size']) && $params['size'] != '' ? $params['size'] : 20;
        $rankType = isset($params['rank_type']) && $params['rank_type'] != '' ? $params['rank_type'] : 'total_rank';

        $data = HallModel::worshipRank($hallId, $rankType, $page, $size)['list'];

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($data);
    }

    /**
     * andy-纪念馆推荐列表
     * @desc 纪念馆推荐列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_type 纪念馆类型（可选默认为“0”）
     * @parameter int page 页码（可选默认为“1”）
     * @parameter int size 数量（可选默认为“20”）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallRecommend()
    {
        $hallType = $this->request->param('hall_type', 0);
        $page = $this->request->param('page', 1);
        $size = $this->request->param('size', 20);

        $loginUid = $this->user['member_id']; // 获取当前登录用户ID
        $data = HallModel::getHallList($loginUid, $hallType, 0, 'view desc', $page, $size, ['hall_style', 'hall_worship_style', 'hall_music']);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($data);
    }

    /***************************** 纪念馆群相关接口 *****************************/
    /**
     * andy - 创建纪念馆群
     * @desc 创建纪念馆群
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（必须）
     * @parameter string name 纪念馆名称（可选默认为“纪念馆名称+1群”）
     * @parameter string announcement 纪念馆公告（可选默认为“”）
     * @parameter string introduction 纪念馆介绍（可选默认为“”）
     * @parameter int is_public 是否公开（可选默认为“1”公开）
     * @parameter int max_users 纪念馆最大人数（可选默认为“200”）
     * @response
     */
    public function createGroup()
    {
//        $params = $this->param;
//        $return = true;

//        if (!$hallId) {
//            // 如果不是控制器内部调用该接口 则需要验证纪念馆ID参数
//            // 验证参数
//            $validate = new BaseValidate();
//            $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);
//            $hallId = $params['hall_id'];
//        }else {
//            // 不需要返回
//            $return = false;
//        }

//        $hallInfo = HallModel::get($hallId);
//
//        $groupName = isset($params['name']) && $params['name'] != '' ? $params['name'] : $hallInfo['hall_name'].'1群';
//        $owner = $this->user['member_id'];
//        $hxOwner = $this->user['hx_username'];
//        $announcement = isset($params['announcement']) ? $params['announcement'] : '';
//        $groupIntroduction = isset($params['introduction']) ? $params['introduction'] : '';
//        $isPublic = isset($params['is_public']) && $params['is_public'] != '' ? $params['is_public'] : 1;
//        $maxUsers = isset($params['max_users']) && $params['max_users'] != '' ? $params['max_users'] : 200;
//        $members = [];
//
//        // 创建环信群组
//        $easemodApi = new Easemob();
//        $groupId = $easemodApi->emchatCreateGroup($groupName, $hxOwner, $groupIntroduction, $isPublic, $maxUsers, $members);
//
//        // 保存群组信息到数据库
//        $data = [
//            'hall_id' => $hallId,
//            'name' => $groupName,
//            'announcement' => $announcement,
//            'introduction' => $groupIntroduction,
//            'is_public' => $isPublic,
//            'max_users' => $maxUsers,
//            'hx_group_id' => $groupId,
//            'create_by' => $owner,
//            'create_at' => time(),
//        ];
//        $result = HallGroup::createGroup($data);
        $params = $this->param;

        // 如果不是控制器内部调用该接口 则需要验证纪念馆ID参数
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);
        $hallId = $params['hall_id'];

        $result = $this->_createGroup($hallId, $params);

        // 外部应用调用接口
        if (!$result) {
            $this->wrong(0, '纪念馆群创建失败');
        }

        $this->response($result, 200, '纪念馆群创建成功');

//        if ($return) {
//            // 外部应用调用接口
//            if (!$result) {
//                $this->wrong(0, '纪念馆群创建失败');
//            }
//
//            $this->response($result, 200, '纪念馆群创建成功');
//        }

//        return true;
    }

    /**
     * 创建纪念馆群 辅助方法
     * @param $hallId
     * @param array $params
     * @return int|string
     */
    private function _createGroup($hallId, $params = [])
    {
        $hallInfo = HallModel::get($hallId);

        $groupName = isset($params['name']) && $params['name'] != '' ? $params['name'] : $hallInfo['hall_name'].'1群';
        $owner = isset($params['member_id']) ? $params['member_id'] : $this->user['member_id'];
        $hxOwner = isset($params['hx_username']) ? $params['hx_username'] : $this->user['hx_username'];
        $announcement = isset($params['announcement']) ? $params['announcement'] : '';
        $groupIntroduction = isset($params['introduction']) ? $params['introduction'] : '';
        $isPublic = isset($params['is_public']) && $params['is_public'] != '' ? $params['is_public'] : 1;
        $maxUsers = isset($params['max_users']) && $params['max_users'] != '' ? $params['max_users'] : 200;
        $members = [];

        // 创建环信群组
        $easemodApi = new Easemob();
        $groupId = $easemodApi->emchatCreateGroup($groupName, $hxOwner, $groupIntroduction, $isPublic, $maxUsers, $members);

        // 保存群组信息到数据库
        $data = [
            'hall_id' => $hallId,
            'name' => $groupName,
            'announcement' => $announcement,
            'introduction' => $groupIntroduction,
            'is_public' => $isPublic,
            'max_users' => $maxUsers,
            'hx_group_id' => $groupId,
            'create_by' => $owner,
            'create_at' => time(),
        ];
        $result = HallGroup::createGroup($data);

        return $result;
    }

    /**
     * andy-纪念馆群列表
     * @desc 纪念馆群列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int hall_id 纪念馆ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallGroups()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id'])->MustBePostiveInt(['hall_id']);
        $hallId = $params['hall_id'];

        $loginUid = $this->user['member_id'];
        $data = HallGroup::getGroupList($hallId, $loginUid);
        return $this->response($data);
    }

    /**
     * andy-纪念馆群成员列表
     * @desc 纪念馆群成员列表
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int group_id 纪念馆群ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function hallGroupMembers()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['group_id'])->MustBePostiveInt(['group_id']);
        $groupId = $params['group_id'];

        $loginUid = $this->user['member_id'];

        $data = HallGroupMember::getGroupMembers($groupId, $loginUid);
        return $this->response($data);
    }

    /**
     * andy-纪念馆群详情
     * @desc 纪念馆群详情
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int group_id 纪念馆群ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function groupDetail()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['group_id'])->MustBePostiveInt(['group_id']);
        $groupId = $params['group_id'];

        $loginUid = $this->user['member_id'];

        $data = HallGroup::getGroupInfoById($groupId, $loginUid);

        if (!$data) {
            $this->wrong(0, '群ID无效');
        }

        return $this->response($data);
    }

    /**
     * andy-纪念馆群 加入/退出群
     * @desc 纪念馆群 加入/退出群
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int group_id 纪念馆群ID（必须）
     * @parameter int member_id 用户ID（可选）默认为“0”自己加群/退群
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function joinGroup()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['group_id'])->MustBePostiveInt(['group_id']);
        $groupId = $params['group_id'];
        $loginUid= $this->user['member_id'];
        $memberId = isset($params['member_id']) ? $params['member_id'] : 0;

        $groupExisted = HallGroup::exist($groupId);
        if (!$groupExisted) {
            $this->wrong(0, '群ID无效');
        }

        $isGroupOwner = HallGroupMember::isGroupOwner($groupId, $loginUid);
        if ($isGroupOwner && !$memberId) {
            // 如果是群组 禁止执行加群/退群操作
            $this->wrong(0, '您是该群的群主');
        }

        if (!$memberId) {
            // 自己 加入/退群
            $memberId = $loginUid;
        }else {
            // 操作别人
            // 当前登录用户是否是群主或管理员
            $isManager = HallGroupMember::isGroupManager($groupId, $loginUid);

            if ($isGroupOwner || $isManager) {

            }else {
                // 不是
                $this->wrong(0, '您无权操作');
            }

        }

        $groupMemberExisted = HallGroupMember::exist(['group_id' => $groupId, 'member_id' => $memberId]);
        if ($groupMemberExisted) {
            // 已经加入该群 退出群
            $message = '退出群';

            // 退出环信群
            $hxGroupId = HallGroup::getHxGroupId($groupId);
            $hxUsername = MemberModel::self()->getHxUsername($memberId);
            $easemodApi = new Easemob();
            $easemodApi->emchatCreateGroupMember($hxGroupId, $hxUsername);

        }else {
            // 未加入该群 加入群
            $message = '加入群';

            // 加入环信群
            $hxGroupId = HallGroup::getHxGroupId($groupId);
            $hxUsername = MemberModel::self()->getHxUsername($memberId);
            $easemodApi = new Easemob();
            $easemodApi->emchatRemoveGroupMember($hxGroupId, $hxUsername);
        }

        $data = HallGroupMember::joinGroup($groupId, $memberId);

        if (!$data) {
            // 加入群失败
            $this->wrong(0, $message.'失败');
        }

        // TODO 加入群成功 判断群是否满员 如果满员则自动新建一个群
        // TODO BUG 如果其他群未满 则新建了一个空群
        $isGroupFull = HallGroup::isGroupFull($groupId);
        if ($isGroupFull) {
            // 该群已满 新建群
            $hallId = HallGroup::getHallIdByGroupId($groupId);
            $hallGroupCount = HallGroup::getHallGroupCount($hallId);
            $hallInfo = HallModel::get($hallId);
            $memberInfo = MemberModel::self()->findUser($hallInfo['hall_member_id']);
            $params['name'] = $hallInfo['hall_name'].($hallGroupCount+1).'群';
            $params['member_id'] = $memberInfo['member_id'];
            $params['hx_username'] = $memberInfo['hx_username'];
            $this->_createGroup($hallId, $params);
        }

        $this->response($data,200, $message.'成功');

    }

    /**
     * andy-纪念馆群 编辑群信息
     * @desc 纪念馆群 编辑群信息
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int group_id 纪念馆群ID（必须）
     * @parameter int name 纪念馆群名称（可选）
     * @parameter int announcement 纪念馆群公告（可选）
     * @parameter int introduction 纪念馆群介绍（可选）
     * @parameter int avatar 纪念馆群头像（可选）
     * @response
     */
    public function editGroup()
    {
        $params = remove_empty_params($this->param);

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['group_id'])->MustBePostiveInt(['group_id']);
        $groupId = $params['group_id'];
        $memberId = $this->user['member_id'];

        $groupExisted = HallGroup::exist($groupId);
        if (!$groupExisted) {
            $this->wrong(0, '群ID无效');
        }

        $isGroupOwner = HallGroupMember::isGroupOwner($groupId, $memberId);
        if (!$isGroupOwner) {
            // 如果不是是群组 禁止执行更新操作
            $this->wrong(0, '您不是该群的群主，禁止操作');
        }

        unset($params['token'], $params['group_id']);
        $saveData = $params;

        $data = HallGroup::updateGroup($groupId, $saveData);

        if (!$data) {
            $this->wrong(0, '更新群信息失败');
        }

        // 更新群信息成功 更新环信群信息
        $hxGroupId = HallGroup::getHxGroupId($groupId);
        $easemodApi = new Easemob();
        $groupName = isset($params['name']) ? $params['name'] : '';
        $groupDesc = isset($params['introduction']) ? $params['introduction'] : '';
        $easemodApi->emchatUpdateGroup($hxGroupId, $groupName, $groupDesc);

        $this->response($data, 200, '更新群信息成功');
    }

    /**
     * andy-纪念馆群 创建/移除群管理员
     * @desc 纪念馆群 创建/移除群管理员
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int group_id 纪念馆群ID（必须）
     * @parameter int manager_id 纪念馆群管理员ID（必须）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function createGroupManager()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['group_id', 'manager_id'])->MustBePostiveInt(['group_id', 'manager_id']);
        $groupId = $params['group_id'];
        $managerId = $params['manager_id'];

        $groupExisted = HallGroup::exist($groupId);
        if (!$groupExisted) {
            $this->wrong(0, '群ID无效');
        }

        $groupMemberExisted = HallGroupMember::exist(['group_id' => $groupId, 'member_id' => $managerId]);
        if (!$groupMemberExisted) {
            $this->wrong(0, '该用户不属于群成员！');
        }

        $isGroupOwner = HallGroupMember::isGroupOwner($groupId, $managerId);
        if ($isGroupOwner) {
            // 如果是群组 禁止执行加群/退群操作
            $this->wrong(0, '您是该群的群主');
        }

        if (HallGroupMember::isGroupManager($groupId, $managerId)) {
            // 是群管理员 移除操作
            $message = '群管理员移除';

            // 移除环信群管理员
            $hxGroupId = HallGroup::getHxGroupId($groupId);
            $oldAdmin = MemberModel::self()->getHxUsername($managerId);
            $easemodApi = new Easemob();
            $easemodApi->emchatRemoveGroupManager($hxGroupId, $oldAdmin);
        }else {
            // 不是群管理员 创建操作
            $message = '群管理员创建';

            // 创建环信群管理员
            $hxGroupId = HallGroup::getHxGroupId($groupId);
            $newAdmin = MemberModel::self()->getHxUsername($managerId);
            $easemodApi = new Easemob();
            $easemodApi->emchatCreateGroupManager($hxGroupId, $newAdmin);
        }

        $data = HallGroupMember::createGroupManager($groupId, $managerId);

        if (!$data) {
            $this->wrong(0, $message.'失败');
        }

        $this->response($data,200, $message.'成功');
    }

    /**
     * andy-纪念馆群 禁言/取消禁言用户
     * @desc 纪念馆群 禁言/取消禁言用户
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter int group_id 群ID（必须）
     * @parameter int member_id 群用户ID（必须）
     * @parameter int mute_duration 群用户禁言时间（可选）
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function forbiddenTalk()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['group_id', 'member_id'])->MustBePostiveInt(['group_id', 'member_id']);
        $groupId = $params['group_id'];
        $memberId = $params['member_id'];
        $muteDuration = isset($params['mute_duration']) ? $params['mute_duration'] : 3600;
        $loginUid = $this->user['member_id'];

        $groupExisted = HallGroup::exist($groupId);
        if (!$groupExisted) {
            $this->wrong(0, '群ID无效');
        }

        $isGroupOwner = HallGroupMember::isGroupOwner($groupId, $loginUid);
//        if ($isGroupOwner) {
//            // 如果是群组 禁止执行加群/退群操作
//            $this->wrong(0, '您是该群的群主');
//        }

        // 当前登录用户是否是群主或管理员
        $isManager = HallGroupMember::isGroupManager($groupId, $loginUid);

        if ($isGroupOwner || $isManager) {

        }else {
            // 不是
            $this->wrong(0, '您无权操作');
        }

        $groupMemberExisted = HallGroupMember::exist(['group_id' => $groupId, 'member_id' => $memberId]);
        if (!$groupMemberExisted) {
            $this->wrong(0, '该用户不属于群成员！');
        }

        if (HallGroupMember::isForbiddenTalk($groupId, $memberId)) {
            // 已经被禁言 执行取消禁言操作
            $message = '取消用户禁言';

            // 执行环信禁言
            $hxGroupId = HallGroup::getHxGroupId($groupId);
            $hxUsername = MemberModel::self()->getHxUsername($memberId);
            $easemodApi = new Easemob();
            $easemodApi->emchatForbiddenTalk($hxGroupId, $hxUsername, $muteDuration);
            $res = 2;
        }else {
            // 没有被禁言 执行禁言操作
            $message = '禁言用户';

            // 取消环信禁言
            $hxGroupId = HallGroup::getHxGroupId($groupId);
            $hxUsername = MemberModel::self()->getHxUsername($memberId);
            $easemodApi = new Easemob();
            $easemodApi->emchatDeleteForbiddenTalk($hxGroupId, $hxUsername);
            $res = 1;
        }

        $data = HallGroupMember::forbiddenTalk($groupId, $memberId);

        if (!$data) {
            $this->wrong(0, $message.'失败');
        }

        $this->response($res,200, $message.'成功');
    }


    /**
     * andy-纪念馆群 获取我参与的群
     * @desc 纪念馆群 获取我参与的群 包括我创建的/我加入的
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter string role_type 角色类型（可选）默认“0”所有____1、群主_2、管理员_3、普通成员
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function getMyGroups()
    {
        $memberId = $this->user['member_id'];

        $roleType = $this->request->param('role_type', 0);

        $data = HallGroupMember::getMyGroups($memberId, $roleType);

        if (!$data['list']) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($data, 200, '获取数据成功');
    }

    /**
     * andy-纪念馆群 更新纪念馆状态
     * @desc 纪念馆群 更新纪念馆状态
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter string hall_id 纪念馆ID（必须）
     * @parameter string hall_status 纪念馆状态（必须）1、关闭纪念馆_2、所有人可见_3、密码访问_4、隐藏
    * @parameter string call_password 访问密码（可选）默认“”
     * @parameter string return_type 数据返回类型（可选）默认“json”
     * @response
     */
    public function modifyHallState()
    {
        $params = $this->param;

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['hall_id', 'hall_status'])->MustBePostiveInt(['hall_id', 'hall_status']);
        $hallId = $params['hall_id'];
        $hallStatus = $params['hall_status'];
        $callPassword = trim($params['call_password']);

        $isHallExisted = HallModel::exist($hallId);
        if (!$isHallExisted) {
            $this->wrong(0, '纪念馆不存在');
        }

        $data = HallModel::modifyHallState($hallId, $hallStatus, $callPassword);

        if ($data) {
            // 更新成功
            $this->response($data, 200, '状态更新成功');
        }else {
            // 更新失败
            $this->wrong(0, '状态更新失败');
        }
    }
    
    

}
