<?php
/**
 * Created by PhpStorm.
 * User: 会敲代码的榛果丶
 * Date: 2017/5/11
 * Time: 14:32
 */
namespace app\admin\controller;

use app\admin\model\Hall as HallModel;
use app\admin\model\HallFamousType;
use app\admin\model\HallLingpaiStyle;
use app\admin\model\HallStyleCategory;
use app\admin\service\DataService;
use app\admin\service\ToolsService;
use app\api\model\HallMusic;
use app\api\model\MemberModel;
use think\Db;


class Hall extends BasicAdmin
{
    /* 华丽的分割线-------------------------------------- 纪念馆 结束 --------------------------------------------------- */

    /* 华丽的分割线-------------------------------------- 个人、双人 纪念馆 开始 ------------------------------------------- */
    /**
     * 单人纪念馆列表
     */
    public function HallOne(){
        // 设置页面标题
        $this->title = '个人纪念馆管理';
        $this->assign('ct',Db::name('HallFamousType')->where('status',1)->order('sort desc')->field('id,name')->select());
        $db = Db::name("Hall")->where('hall_type',1)->where('famous_type',0);
        if ($this->request->get('hall_name')){
            $db->where("hall_name", 'like', "%{$this->request->get('hall_name')}%");
        }

        $this->assign('hallType', 1);
        $this->assign('isFamous', 0);

        $data = parent::_list($db, true, false, false, 50);
        foreach($data['list'] as $key=>$item) {
           $exp = $item['memorial_value'];
            $map = [
                'exp' => ['elt', $exp],
                'max_exp' => ['egt', $exp]
            ];
            $data['list'][$key]['hall_level'] = Db::name('HallLevel')->where($map)->value('level');
            $memberInfo = Db::table('yun_member')->where('member_id', $item['hall_member_id'])->find();
            $data['list'][$key]['member_nickname'] = $memberInfo['member_nickname'];

            // 关注人数
            $data['list'][$key]['follow_cnt'] = Db::name('HallFollow')->where('hall_id', $item['id'])->count();
        }
        return $this->fetch('index', $data);
    }

    /**
     * 双人纪念馆列表
     */
    public function HallTwo(){
        // 设置页面标题
        $this->title = '双人纪念馆管理';
        $this->assign('ct',Db::name('HallFamousType')->where('status',1)->order('sort desc')->field('id,name')->select());
        $db = Db::name("Hall")->where('hall_type',2)->where('famous_type',0);
        if ($this->request->get('hall_name')){
            $db->where("hall_name", 'like', "%{$this->request->get('hall_name')}%");
        }
        
        $this->assign('hallType', 2);
        $this->assign('isFamous', 0);

        $data = parent::_list($db, true, false, false, 50);
        foreach($data['list'] as $key=>$item) {
            $exp = $item['memorial_value'];
            $map = [
                'exp' => ['elt', $exp],
                'max_exp' => ['egt', $exp]
            ];
            $data['list'][$key]['hall_level'] = Db::name('HallLevel')->where($map)->value('level');
            $memberInfo = Db::table('yun_member')->where('member_id', $item['hall_member_id'])->find();
            $data['list'][$key]['member_nickname'] = $memberInfo['member_nickname'];

            // 关注人数
            $data['list'][$key]['follow_cnt'] = Db::name('HallFollow')->where('hall_id', $item['id'])->count();
        }
        return $this->fetch('index', $data);
    }


//    /**
//     * 编辑单人馆
//     */
//    public function EditOne(){
//        return $this->_form("HallOne",'editone','hall_id');
//    }
//
//    /**
//     * 单人馆编辑附属操作
//     */
//    public function _editone_form_filter(&$data){
//        if ($this -> request ->post()){
//            $data['call_password'] = md5($data['call_password']);
//            $data['one_birthday'] = strtotime($data['one_birthday']);
//            $data['one_death'] = strtotime($data['one_death']);
//            $data['id'] = $data['hall_id'];
//            $data['hall_img'] = $data['one_img'];
//            $data['hall_name'] = $data['one_name'];
//            $result = DataService::save('Hall', $data);
//            if ($result !== false){
//                unset($data['id']);
//                $result = DataService::save('HallOne', $data,'hall_id');
//            }else{
//                $this->error('保存失败，请稍候再试1！');
//            }
//            $result !== false ? $this->success('恭喜，保存成功哦！', '') : $this->error('保存失败，请稍候再试！');
//        }else{
//            //dump($data);
//            $data = $this -> hall_data($data,'one_lingpai_style');
//            $data['one_birthday'] = date('Y-m-d',$data['one_birthday']);
//            $data['one_death'] = date('Y-m-d',$data['one_death']);
//        }
//    }

    /**
     * 编辑双人馆
     */
//    public function EditTwo(){
//        return $this->_form("HallTwo",'edittwo','hall_id');
//    }

    /**
     * 双人馆编辑附属操作
     */
//    public function _edittwo_form_filter(&$data)
//    {
//        if ($this -> request ->post()){
//            $data['two_birthday1'] = strtotime($data['two_birthday1']);
//            $data['two_death1'] = strtotime($data['two_death1']);
//            $data['two_birthday2'] = strtotime($data['two_birthday2']);
//            $data['two_death2'] = strtotime($data['two_death2']);
//            $data['id'] = $data['hall_id'];
//            $data['hall_img'] = Db::name('HallStyle')->where("id",$data['hall_style'])->field('style_img')->find()['style_img'];
//            $result = DataService::save('Hall', $data);
//            if ($result !== false){
//                unset($data['id']);
//                $result = DataService::save('HallTwo', $data,'hall_id');
//            }else{
//                $this->error('保存失败，请稍候再试1！');
//            }
//            $result !== false ? $this->success('恭喜，保存成功哦！', '') : $this->error('保存失败，请稍候再试！');
//        }else{
//            $data = $this->hall_data($data,'two_lingpai_style');
//            $data['two_birthday1'] = date('Y-m-d',$data['two_birthday1']);
//            $data['two_death1'] = date('Y-m-d',$data['two_death1']);
//            $data['two_birthday2'] = date('Y-m-d',$data['two_birthday2']);
//            $data['two_death2'] = date('Y-m-d',$data['two_death2']);
//        }
//    }

    /* 华丽的分割线-------------------------------------- 个人、双人 纪念馆 结束 ------------------------------------------- */

    /* 华丽的分割线-------------------------------------- 家族 纪念馆 开始 ----------------------------------------------- */

    /**
     * 家族纪念馆列表
     */
    public function HallFamily(){
        // 设置页面标题
        $this->title = '家族纪念馆管理';
        $db = Db::name("Hall")->where('hall_type',3);
        if ($this->request->get('hall_name')){
            $db->where("hall_name", 'like', "%{$this->request->get('hall_name')}%");
        }

        $this->assign('hallType', 3);
        $this->assign('isFamous', 0);

        $data = parent::_list($db, true, false, false, 50);
        foreach($data['list'] as $key=>$item) {
            $exp = $item['memorial_value'];
            $map = [
                'exp' => ['elt', $exp],
                'max_exp' => ['egt', $exp]
            ];
            $data['list'][$key]['hall_level'] = Db::name('HallLevel')->where($map)->value('level');
            $memberInfo = Db::table('yun_member')->where('member_id', $item['hall_member_id'])->find();
            $data['list'][$key]['member_nickname'] = $memberInfo['member_nickname'];

            // 关注人数
            $data['list'][$key]['follow_cnt'] = Db::name('HallFollow')->where('hall_id', $item['id'])->count();
        }
        return $this->fetch('index', $data);
    }

    /**
     * 编辑家族馆
     */
//    public function EditFamily(){
//        return $this->_form("HallFamily",'editfamily','hall_id',[]);
//    }

    /**
     * 家族馆编辑附属操作
     */
//    public function _editfamily_form_filter(&$data){
//        if ($this -> request ->post()){
//            $data['id'] = $data['hall_id'];
//            $data['family_img'] = Db::name('HallStyle')->where("id",$data['hall_style'])->field('style_img')->find()['style_img'];
//            $result = DataService::save('Hall', $data);
//            if ($result !== false){
//                unset($data['id']);
//                $result = DataService::save('HallFamily', $data,'hall_id');
//            }else{
//                $this->error('保存失败，请稍候再试1！');
//            }
//            $result !== false ? $this->success('恭喜，保存成功哦！', '') : $this->error('保存失败，请稍候再试！');
//        }else{
//            $data = $this -> hall_data($data,'family_lingpai_style');
//        }
//    }

    /* 华丽的分割线-------------------------------------- 家族 纪念馆 结束 ----------------------------------------------- */

    /* 华丽的分割线-------------------------------------- 名人 纪念馆 开始 ----------------------------------------------- */

    /**
     * 名人纪念馆列表
     */
    public function HallFamous(){
        // 设置页面标题
        $this->title = '名人纪念馆管理';
        $db = Db::name("Hall")->alias('h')->join(['HallFamousType as t','t.id = h.famous_type'])->
        where('hall_type','neq',3)->where('famous_type','neq',0);
        if ($this->request->get('hall_name')){
            $db->where("hall_name", 'like', "%{$this->request->get('hall_name')}%");
        }

        $this->assign('hallType', 1);
        $this->assign('isFamous', 1);

        $data = parent::_list($db, true, false, false, 50);
        foreach($data['list'] as $key=>$item) {
            $exp = $item['memorial_value'];
            $map = [
                'exp' => ['elt', $exp],
                'max_exp' => ['egt', $exp]
            ];
            $data['list'][$key]['hall_level'] = Db::name('HallLevel')->where($map)->value('level');
            $memberInfo = Db::table('yun_member')->where('member_id', $item['hall_member_id'])->find();
            $data['list'][$key]['member_nickname'] = $memberInfo['member_nickname'];

            // 关注人数
            $data['list'][$key]['follow_cnt'] = Db::name('HallFollow')->where('hall_id', $item['id'])->count();
        }
        return $this->fetch('index', $data);
    }

    /**
     * 添加名人纪念馆标识
     */
    public function AddFamous(){
        $table = "Hall";
        if (DataService::update($table)) {
            $this->success("操作成功！", '');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 名人纪念馆类型列表
     */
    public function HallFamousType(){
        // 设置页面标题
        $this->title = '名人类型管理';
        $db = Db::name("HallFamousType");
        if ($this->request->get('name')){
            $db->where("name", 'like', "%{$this->request->get('name')}%");
        }
        parent::_list($db);
    }

    /**
     * 添加名人纪念馆类型
     */
    public function AddFamousType(){
        return $this -> _form("HallFamousType",'addfamoustype');
    }

    /**
     * 编辑名人纪念馆类型
     */
    public function EditFamousType(){
        return $this -> AddFamousType();
    }

    /**
     * 删除人纪念馆类型
     */
    public function DelFamousType()
    {
        $table = "HallFamousType";
        if (DataService::update($table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /* 华丽的分割线-------------------------------------- 名人 纪念馆 结束 ----------------------------------------------- */

    /**
     * 纪念馆数据共享
     * @param $data
     * @return array
     */
//    public function hall_data(&$data,$lingpai)
//    {
//        $data = array_merge(Db::name('Hall')->where('id',$data['hall_id'])->field('id',true)->find(),$data);
//        $data['ethnic'] = \think\Config::get('ethnic');
//        $style_list = Db::name('HallStyle')->where('status',1)->field('id,style_name,style_type')->select();
//        $music_list = Db::name('HallMusic')->where('music_status',1)->field('id,music_name')->select();
//        foreach ($style_list as $key => $value){
//            if ($value['style_type'] == 1){
//                $value['id'] == $data['hall_type'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                $data['jng'][] = $style_list[$key];
//            } elseif ($value['style_type'] == 2){
//                $value['id'] == $data['hall_worship_style'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                $data['jbdt'][] = $style_list[$key];
//            } elseif ($value['style_type'] == 3){
//                if ($lingpai == 'one_lingpai_style' || $lingpai == 'family_lingpai_style'){
//                    $value['id'] == $data[$lingpai] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                }elseif($lingpai == 'two_lingpai_style'){
//                    $value['id'] == $data[$lingpai.'1'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                    $value['id'] == $data[$lingpai.'2'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                }
//                //$value['id'] == $data['one_lingpai_style'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
////                $data['lingpai'][] = $style_list[$key];
//            }
//            $data['lingpai'][] = $style_list[$key];
//        }
//
//        foreach ($music_list as $key => $value){
//            $value['id'] == $data['hall_music'] ? $music_list[$key]['selected'] = 'selected = "selected"' : $music_list[$key]['selected'] = '';
//            $data['music'][] = $music_list[$key];
//        }
//
//        return $data;
//    }

    public function hall_data(&$data,$lingpai)
    {
        $data = array_merge(Db::name('Hall')->where('id',$data['hall_id'])->field('id',true)->find(),$data);
        $data['ethnic'] = \think\Config::get('ethnic');
        $music_list['music'] = Db::name('HallMusic')->where('music_status',1)->field('id,music_name')->select();

        $hallStyle['hall_styles'] = HallStyleCategory::getDataByPid($data['hall_type'], ['hall_style']);
        $hallWorshipStyle['hall_worship_styles'] = HallStyleCategory::getDataByPid($data['hall_type'], ['hall_worship_style']);
        $hallLingpaiStyle['lingpai'] = Db::name('HallLingpaiStyle')->where('status', 1)->field('id, style_name')->select();
//        dump($data);die;
//        dump($hallStyle['hall_style'][0]);die;
        $data = array_merge($data, $hallStyle, $hallWorshipStyle, $hallLingpaiStyle, $music_list);

//        $data['jng'] = $hallStyle;
//        $data['jbdt'] = $hallWorshipStyle;
//        $data['lingpai'] = $hallLingpaiStyle;

//        $style_list = Db::name('HallStyle')->where('status',1)->field('id,style_name,style_type')->select();
//        foreach ($style_list as $key => $value){
//            if ($value['style_type'] == 1){
//                $value['id'] == $data['hall_type'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                $data['jng'][] = $style_list[$key];
//            } elseif ($value['style_type'] == 2){
//                $value['id'] == $data['hall_worship_style'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                $data['jbdt'][] = $style_list[$key];
//            } elseif ($value['style_type'] == 3){
//                if ($lingpai == 'one_lingpai_style' || $lingpai == 'family_lingpai_style'){
//                    $value['id'] == $data[$lingpai] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                }elseif($lingpai == 'two_lingpai_style'){
//                    $value['id'] == $data[$lingpai.'1'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                    $value['id'] == $data[$lingpai.'2'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                }
//                //$value['id'] == $data['one_lingpai_style'] ? $style_list[$key]['selected'] = 'selected = "selected"' : $style_list[$key]['selected'] = '';
//                $data['lingpai'][] = $style_list[$key];
//            }
//        }

//        foreach ($music_list as $key => $value){
//            $value['id'] == $data['hall_music'] ? $music_list[$key]['selected'] = 'selected = "selected"' : $music_list[$key]['selected'] = '';
//            $data['music'][] = $music_list[$key];
//        }

        return $data;
    }


    /* 华丽的分割线-------------------------------------- 纪念馆 结束 --------------------------------------------------- */

    /* 华丽的分割线--------------------------------------  乐曲  开始 --------------------------------------------------- */

    /**
     * 乐曲列表
     */
    public function MusicList(){
        // 设置页面标题
        $this->title = '乐曲管理';
        $db = Db::name("HallMusic");
        if ($this->request->get('music_name')){
            $db->where("music_name", 'like', "%{$this->request->get('music_name')}%");
        }
        parent::_list($db);
    }

    /**
     * 添加乐曲
     */
    public  function AddMusic(){
        return $this->_form("HallMusic",'addmusic');
    }

    /**
     * 编辑乐曲
     */
    public function EditMusic()
    {
        return $this->AddMusic();
    }

    /**
     * 删除乐曲
     */
    public function DelMusic()
    {
        $table = "HallMusic";
        if (DataService::update($table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /* 华丽的分割线--------------------------------------  乐曲  结束 --------------------------------------------------- */

    /* 华丽的分割线--------------------------------------  风格  开始 --------------------------------------------------- */



    /* 华丽的分割线--------------------------------------  风格  结束 --------------------------------------------------- */

    /* 华丽的分割线--------------------------------------  相册  开始 --------------------------------------------------- */

    /**
     * 纪念馆相册列表
     */
    public function Photo()
    {
        // 设置页面标题
        $this->title = '相册管理';
        $db = Db::name("HallPhoto");
        if ($this -> request -> get('photo_name')){
            $db->where('photo_name', 'like', "%{$this -> request -> get('photo_name')}%");
        }
        if ($this -> request -> get('hall_id')){
            $db->where("p.hall_id",$this->request->get('hall_id'));
        }
        $db->alias("p")->join('Hall h','h.id = p.hall_id')->field('p.*,h.hall_name');
        parent::_list($db);
    }

    /**
     * 纪念馆相册添加
     */
    public function AddPhoto()
    {
        $data = $this -> request -> get('hall_id') ? ['hall_id'=>$this -> request -> get('hall_id')] : [];
        return $this->_form("HallPhoto",'addhallphoto',$pk = null, $where = [], $data = $data);

    }

    /**
     * 纪念馆相册编辑
     */
    public function EditPhoto()
    {
        return $this->AddPhoto();
    }

    /**
     * 纪念馆相册删除
     */
    public function delPhoto()
    {
        $table = "HallPhoto";
        if (DataService::update($table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 相册照片列表
     */
    public function Picture()
    {
        $list = Db::name('HallPhotoPicture')->where('photo_id',$this->request->param('id'))->select();
        $html = '';
        foreach ($list as $key => $value){
                $html .= '<div id="img_'.$value['id'].'">';
                $html .= '<img data-tips-image src="'.$value['photo_picture_url'].'"/>';
                $html .= '<br><a href="JavaScript:void(0)" onclick="del_img('.$value['id'].')">删除</a>';
                $html .= ' </div>';
        }
        return $this->fetch('',['id'=>$this->request->param('id'), 'html'=>$html]);
    }

    /**
     * 相册照片添加
     */
    public function AddPicture()
    {
        $html = '';
        foreach (explode("|",input('value')) as $key => $value){

            if ($result = Db::name('HallPhotoPicture')->insert(['photo_id'=>input('id'),'photo_picture_url'=>$value],$replace = false, $getLastInsID = true)) {
                $html .= '<div id="img_'.$result.'">';
                $html .= '<img data-tips-image src="'.$value.'"/>';
                $html .= '<br><a href="JavaScript:void(0)" onclick="del_img('.$result.')">删除</a>';
                $html .= ' </div>';
            }
        }
        if ($html){
            die($html);
        } else {
            die('0');
        }

    }

    /**
     * 相册照片删除
     */
    public function DelPicture()
    {
        $table = "HallPhotoPicture";
        if (DataService::update($table)) {
            die('删除成功！');
        }
        die("删除失败，请稍候再试！");
    }

    /* 华丽的分割线--------------------------------------  相册  结束 --------------------------------------------------- */

    /* 华丽的分割线--------------------------------------  文章  开始 --------------------------------------------------- */

    /**
     * 文章列表
     */
    public function Article(){
        // 设置页面标题
        $this->title = '文章管理';
        $db = Db::name("HallArticle");
        if ($this -> request -> get('article_title')){
            $db->where('article_title', 'like', "%{$this -> request -> get('article_title')}%");
        }
        if ($this -> request -> get('hall_id')){
            $db->where("a.hall_id",$this->request->get('hall_id'));
        }
        $db->alias("a")->join('Hall h','h.id = a.hall_id')->field('a.*,h.hall_name');
        parent::_list($db);
    }

    /**
     * 文章添加
     */
    public function AddArticle(){
        $data = $this -> request -> get('hall_id') ? ['hall_id'=>$this -> request -> get('hall_id')] : [];
        return $this->_form("HallArticle",'addarticle',$pk = null, $where = [], $data = $data);
    }

    /**
     * 文章编辑
     */
    public function EditArticle(){
        return $this->AddArticle();
    }

    /**
     * 文章删除
     */
    public function DelArticle(){
        $table = "HallArticle";
        if (DataService::update($table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }
    /* 华丽的分割线--------------------------------------  文章  结束 --------------------------------------------------- */




    /* TODO andy 2017/7/9 将黎殊华的代码及数据库表进行重写与优化 原有代码大多数都没法用 */

    /**
     * 指定当前纪念馆数据主表
     * @var string
     */
    protected $hallTable = 'Hall';

    /**
     * 指定当前单人纪念馆数据表
     * @var string
     */
    protected $hallOneTable = 'HallOne';

    /**
     * 指定当前双人纪念馆数据表
     * @var string
     */
    protected $hallTwoTable = 'HallTwo';

    /**
     * 指定当前家族纪念馆数据表
     * @var string
     */
    protected $hallFamilyTable = 'HallFamily';

    /**
     * 指定当前纪念馆风格数据表
     * @var string
     */
    protected $hallStyleTable = 'HallStyle';

    /**
     * 指定当前纪念馆大厅风格数据表
     * @var string
     */
    protected $hallWorshipStyleTable = 'HallWorshipStyle';

    /**
     * 指定当前纪念馆灵牌风格数据表
     * @var string
     */
    protected $hallLingpaiStyleTable = 'HallLingpaiStyle';

    /**
     * 指定当前纪念馆风格分类数据表
     * @var string
     */
    protected $hallStyleCategoryTable = 'HallStyleCategory';


    /***************************** 纪念馆风格分类管理 *****************************/

    /**
     * 添加纪念馆
     * @return mixed
     */
    public function addHall()
    {

        $hallId = $this->request->param('hall_id', 0); // 纪念馆ID
        $hallType = $this->request->param('hall_type', 1); // 纪念馆类型 默认为1 1单人馆 2双人馆 3家族馆 4事件馆 5主题馆
        $isFamous = $this->request->param('is_famous', 0); // 是否是名人馆 默认为0 0普通馆 1名人馆

        $postParams = $this->request->post();
        $saveData = check_post_params_in_field($this->hallTable, $postParams); // POST 参数过滤
        // 纪念馆类型
        $saveData['hall_type'] = $hallType;

        // 纪念馆名人类型


        if ($hallType == 1 && $isFamous) {
            // 名人馆
            $template = 'add_one';
            $relationTable = 'hallOne';
            $res = $this->addOne($hallId, $saveData);
        }elseif ($hallType == 2) {
            // 双人馆
            $template = 'add_two';
            $relationTable = 'hallTwo';
            $res = $this->addTwo($hallId, $saveData);
        }elseif ($hallType == 3) {
            // 家族馆
            $template = 'add_family';
            $relationTable = 'hallFamily';
            $res = $this->addFamily($hallId, $saveData);
        }elseif ($hallType == 4) {
            // 事件馆
            $template = 'add_event';
            $relationTable = 'hallEvent';
            $res = $this->addEvent($hallId, $saveData);
        }elseif ($hallType == 5) {
            // 主题馆
            $template = 'add_theme';
            $relationTable = 'hallTheme';
            $res = $this->addTheme($hallId, $saveData);
        }else {
            // 默认 普通馆
            $template = 'add_one';
            $relationTable = 'hallOne';
            $res = $this->addOne($hallId, $saveData);
        }

        $vo = $assignData = [];

        if ($this->request->isGet()) {
            // GET 请求
            if ($hallId) {
                // 获取数据
                $vo = HallModel::getDataById($hallId, $relationTable);

                $isFamous = $vo['famous_type']; // 是否名人馆
            }

            $relationShip = HallModel::getRelationShip(); // 纪念关系
            $nationList = HallModel::getNationList(); // 民族列表
            $lingpaiStyle = HallLingpaiStyle::getDatas('id, style_name'); // 灵牌样式列表
            $hallStyle = HallStyleCategory::getDataByPid($hallType, ['hall_style']); // 纪念馆风格列表
            $hallWorshipStyle= HallStyleCategory::getDataByPid($hallType, ['hall_worship_style']); // 纪念馆祭拜大厅风格列表
            $hallMusic = HallMusic::getDatas(); // 音乐列表
            $famousType = HallFamousType::getDatas(); // 名人类型列表


            $assignData = [
                'relationShip' => $relationShip,
                'nationList' => $nationList,
                'lingpaiStyle' => $lingpaiStyle,
                'hallStyle' => $hallStyle,
                'hallWorshipStyle' => $hallWorshipStyle,
                'hallMusic' => $hallMusic,
                'famousType' => $famousType,
                'hallType' => $hallType,
                'isFamous' => $isFamous,
            ];
        } else {
            // POST 请求
            if ($res) {
                // 成功
                $this->success('恭喜，保存成功哦！', '');
            }else {
                // 失败
                $this->error('保存失败，请稍候再试！');
            }
        }

        $this->assign('vo', $vo);
        return $this->fetch($template, $assignData);
    }

    /**
     * 编辑纪念馆
     * @return mixed
     */
    public function editHall()
    {
        return $this->addHall();
    }

    /**
     * 删除纪念馆
     * @param $id
     */
    public function delHall($id) {

        $hallType = HallModel::getHallTypeById($id);

        if ($hallType == 2) {
            // 双人馆
            $relationTable = 'hallTwo';
        }elseif ($hallType == 3) {
            // 家族馆
            $relationTable = 'hallFamily';
        }elseif ($hallType == 4) {
            // 事件馆
            $relationTable = 'hallEvent';
        }elseif ($hallType == 5) {
            // 主题馆
            $relationTable = 'hallTheme';
        }else {
            // 默认 普通馆
            $relationTable = 'hallOne';
        }

        $hallModel = new HallModel();
        $res =$hallModel->deleteData($id, $relationTable);

        if ($res) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 新增/编辑单人馆
     * @param $hallId
     * @param array $hallData
     * @return false|int
     */
    public function addOne($hallId, $hallData = [])
    {
        if($this->request->isPost()) {
            // 添加单人馆
            $postParams = $this->request->post();
            if (!isset($hallData['id'])) {
                // 新增操作
                $hallData['hall_member_id'] = 1; // todo 纪念馆创建者用户ID 后续优化
            }else {
                // 编辑操作
                unset($postParams['id']);
            }

            $hallOneData = check_post_params_in_field($this->hallOneTable, $postParams);

            // 纪念馆名称
            if (!empty($hallOneData['one_name'])) {
                $hallData['hall_name'] = $hallOneData['one_name'];
            }

            $hallData['hallOne'] = $hallOneData;

            $hallModel = new HallModel();
            return $hallModel->saveData($hallId, 'hallOne', $hallData);
        }

        return true;
    }

    /**
     * 新增/编辑双人馆
     * @param $hallId
     * @param array $hallData
     * @return false|int
     */
    public function addTwo($hallId, $hallData = [])
    {
        if($this->request->isPost()) {
            // 添加双人馆
            $postParams = $this->request->post();
            if (!isset($hallData['id'])) {
                // 新增操作
                $hallData['hall_member_id'] = 1; // todo 纪念馆创建者用户ID 后续优化
            }else {
                // 编辑操作
                unset($postParams['id']);
            }

            $hallTwoData = check_post_params_in_field($this->hallTwoTable, $postParams);

            $hallData['hallTwo'] = $hallTwoData;

            $hallModel = new HallModel();
            return $hallModel->saveData($hallId, 'hallTwo', $hallData);
        }

        return true;
    }

    /**
     * 添加家族馆
     * @param $hallId
     * @param array $hallData
     * @return false|int
     */
    public function addFamily($hallId, $hallData = [])
    {
        if($this->request->isPost()) {
            // 添加家族馆
            $postParams = $this->request->post();
            if (!isset($hallData['id'])) {
                // 新增操作
                $hallData['hall_member_id'] = 1; // todo 纪念馆创建者用户ID 后续优化
            }else {
                // 编辑操作
                unset($postParams['id']);
            }

            $hallFamilyData = check_post_params_in_field($this->hallFamilyTable, $postParams);

            $hallData['hallFamily'] = $hallFamilyData;

            $hallModel = new HallModel();
            return $hallModel->saveData($hallId, 'hallFamily', $hallData);
        }

        return true;
    }








    /***************************** 纪念馆风格分类管理 *****************************/

    /**
     * 纪念馆风格分类列表
     */
    public function hallStyleCategory()
    {
        $this->title = '纪念馆风格分类管理';
        $db = Db::name($this->hallStyleCategoryTable)->order('sort asc, id asc');
        parent::_list($db, false);

    }

    /**
     * 纪念馆风格分类 列表数据处理
     * @param array $data
     */
    protected function _hallStyleCategory_data_filter(&$data)
    {
        foreach ($data as &$vo) {
            $vo['ids'] = join(',', ToolsService::getArrSubIds($data, $vo['id']));
        }
        $data = ToolsService::arr2table($data);
    }

    /**
     * 添加纪念馆风格分类
     */
    public function addHallStyleCategory()
    {
        if ($this->request->isGet()) {
            // 上级分类处理
            $menus = $this->_hallStyleCategory_form_filter($vo);
            $this->assign('menus', $menus);
        }
        return $this->_form($this->hallStyleCategoryTable, 'hallstylecategoryform');
    }

    /**
     * 编辑分类
     */
    public function editHallStyleCategory()
    {
        return $this->addHallStyleCategory();
    }


    /**
     * 纪念馆分类 表单数据前缀方法
     * @param $vo
     * @return array
     */
    protected function _hallStyleCategory_form_filter(&$vo) {
        if ($this->request->isGet()) {
            // 上级分类处理
            $_menus = Db::name($this->hallStyleCategoryTable)->order('sort asc,id asc')->select();
            $menus = ToolsService::arr2table($_menus);
            foreach ($menus as $key => &$menu) {
                if (substr_count($menu['path'], '-') > 3) {
                    unset($menus[$key]);
                    continue;
                }
                if (isset($vo['pid'])) {
                    $current_path = "-{$vo['pid']}-{$vo['id']}";
                    if ($vo['pid'] !== '' && (stripos("{$menu['path']}-", "{$current_path}-") !== false || $menu['path'] === $current_path)) {
                        unset($menus[$key]);
                    }
                }
            }

            return $menus;
        }
    }

    /**
     * 删除分类
     */
    public function delHallStyleCategory() {
        if (DataService::update($this->hallStyleCategoryTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /***************************** 纪念馆风格管理 *****************************/

    /**
     * 纪念馆风格列表
     * @return mixed
     */
    public function hallStyle()
    {
        $this->title = '纪念馆风格管理';
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->hallStyleTable);

        // 应用搜索条件
        foreach (['style_name'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        // 风格分类名称
        $data = parent::_list($db, true, false);
        foreach($data['list'] as $key=>$list) {
            $data['list'][$key]['cname'] = Db::name($this->hallStyleCategoryTable)->where('id', $list['category_id'])->value('name');
            $pid = Db::name($this->hallStyleCategoryTable)->where('id', $list['category_id'])->value('pid');
            if ($pid) {
                // 如果有父分类
                $pName = Db::name($this->hallStyleCategoryTable)->where('id', $pid)->value('name');
                $data['list'][$key]['cname'] = $pName.' - '.$data['list'][$key]['cname'];
            }

            // 获取皮肤缩略图
            $staticPath = get_root_url().'/static/home/hall_skins/';
            $data['list'][$key]['app_thumb_img'] = $staticPath.$list['skin_hall_type'].'/'.$list['skin_type'].'/'.$list['skin_dir'].'/jpg.jpg';
            $data['list'][$key]['pc_thumb_img'] = $staticPath.$list['skin_hall_type'].'/'.$list['skin_type'].'/'.$list['skin_dir'].'/big.jpg';
            $data['list'][$key]['style_img'] = $staticPath.$list['skin_hall_type'].'/'.$list['skin_type'].'/'.$list['skin_dir'].'/guan_bg.jpg';
        }
        return $this->fetch('', $data);
    }

    /**
     * 添加纪念馆风格
     * @return array|string
     */
    public function addHallStyle()
    {
        if ($this->request->isGet()) {
            // 上级分类处理
            $menus = $this->_hallStyleCategory_form_filter($vo);
            $this->assign('menus', $menus);

//            // 所有皮肤列表
//            $skinList = [];
//            $this->assign('skinList', $skinList);

        }

        $result = $this->_form($this->hallStyleTable);



        if(isset($result['id'])){
            $this->title = '编辑纪念馆风格';

            // 获取皮肤缩略图
            $staticPath = get_root_url().'/static/home/hall_skins/';
            $result['app_thumb_img'] = $staticPath.$result['skin_hall_type'].'/'.$result['skin_type'].'/'.$result['skin_dir'].'/jpg.jpg';
            $result['pc_thumb_img'] = $staticPath.$result['skin_hall_type'].'/'.$result['skin_type'].'/'.$result['skin_dir'].'/big.jpg';
            $result['style_img'] = $staticPath.$result['skin_hall_type'].'/'.$result['skin_type'].'/'.$result['skin_dir'].'/guan_bg.jpg';
        }else {
            $this->title = '添加纪念馆风格';
        }

        return $this->_form($this->hallStyleTable, 'hallstyleform', null, [], $result);
    }

    /**
     * 纪念馆风格 选择风格
     */
    public function selectSkin()
    {
        // 所有皮肤列表
//        $skinList = readdir('/static/home/hall_skins/');
//        $skinDir = get_root_url().'/static/home/hall_skins/'; /data/wwwroot/ht-memorial/public
//        $skinDir = ROOT_PATH.'public\static\home\hall_skins';
        $skinDir = ROOT_PATH . 'public/static/home/hall_skins';
        $guanPtDir = $skinDir.'/guan/putong';
        $yuanPtDir = $skinDir.'/yuan/putong';

        $staticPath = get_root_url().'/static/home/hall_skins/';

        $guanPtStaticPath = $staticPath.'guan/putong/';
        $yuanPtStaticPath = $staticPath.'yuan/putong/';

        $skinList = [];

        if (is_dir($guanPtDir)){
            if ($dh = opendir($guanPtDir)){
                while (($file = readdir($dh)) !== false){
                    if ($file != '.' && $file != '..') {
                        $fileArr = [
                            'skin_dir' => $file,
                            'style_img' => $guanPtStaticPath.$file.'/guan_bg.jpg',
                            'app_thumb_img' => $guanPtStaticPath.$file.'/jpg.jpg',
                            'pc_thumb_img' => $guanPtStaticPath.$file.'/big.jpg',
                        ];
                        $skinList['guan'][] = $fileArr;
                    }
                }
//                dump($skinList['guan']);die;
//                unset($skinList['guan'][0], $skinList['guan'][1]);
                closedir($dh);
            }
        }

//        dump($skinDir);die;

        if (is_dir($yuanPtDir)){
            if ($dh = opendir($yuanPtDir)){
                while (($file = readdir($dh)) !== false){
                    if ($file != '.' && $file != '..') {
                        $fileArr = [
                            'skin_dir' => $file,
                            'style_img' => $yuanPtStaticPath.$file.'/yuan_bg_6.jpg',
                            'app_thumb_img' => $yuanPtStaticPath.$file.'/jpg.jpg',
                            'pc_thumb_img' => $yuanPtStaticPath.$file.'/big.jpg',
                        ];
                        $skinList['yuan'][] = $fileArr;
                    }
                }
//                unset($skinList['yuan'][0], $skinList['yuan'][1]);
                closedir($dh);
            }
        }


//        dump($skinList);die;
        $this->assign('skinList', $skinList);

        return $this->fetch('select_skin');
    }

    /**
     * 编辑纪念馆风格
     * @return array|string
     */
    public function editHallStyle()
    {
        return $this->addHallStyle();
    }

    /**
     * 删除纪念馆风格
     */
    public function delHallStyle() {
        if (DataService::update($this->hallStyleTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /***************************** 纪念馆大厅风格管理 *****************************/

    /**
     * 大厅风格列表
     * @return mixed
     */
    public function hallWorshipStyle()
    {
        $this->title = '大厅风格管理';
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->hallWorshipStyleTable);

        // 应用搜索条件
        foreach (['style_name'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        // 风格分类名称
        $data = parent::_list($db, true, false);
        foreach($data['list'] as $key=>$list) {
            $data['list'][$key]['cname'] = Db::name($this->hallStyleCategoryTable)->where('id', $list['category_id'])->value('name');
            $pid = Db::name($this->hallStyleCategoryTable)->where('id', $list['category_id'])->value('pid');
            if ($pid) {
                // 如果有父分类
                $pName = Db::name($this->hallStyleCategoryTable)->where('id', $pid)->value('name');
                $data['list'][$key]['cname'] = $pName.' - '.$data['list'][$key]['cname'];
            }
        }
        return $this->fetch('', $data);
    }

    /**
     * 添加大厅风格
     * @return array|string
     */
    public function addHallWorshipStyle()
    {
        if ($this->request->isGet()) {
            // 上级分类处理
            $menus = $this->_hallStyleCategory_form_filter($vo);
            $this->assign('menus', $menus);
        }

        $result = $this->_form($this->hallWorshipStyleTable);

        if(isset($result['id'])){
            $this->title = '编辑大厅风格';
        }else {
            $this->title = '添加大厅风格';
        }

        return $this->_form($this->hallWorshipStyleTable, 'hallworshipstyleform');
    }

    /**
     * 编辑大厅风格
     * @return array|string
     */
    public function editHallWorshipStyle()
    {
        return $this->addHallWorshipStyle();
    }

    /**
     * 删除大厅风格
     */
    public function delHallWorshipStyle() {
        if (DataService::update($this->hallWorshipStyleTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }


    /***************************** 纪念馆灵牌风格管理 *****************************/

    /**
     * 灵牌风格列表
     * @return mixed
     */
    public function hallLingpaiStyle()
    {
        $this->title = '灵牌风格管理';
        $get = $this->request->get();
        // 实例Query对象
        $db = Db::name($this->hallLingpaiStyleTable);

        // 应用搜索条件
        foreach (['style_name'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        return parent::_list($db);
    }

    /**
     * 添加灵牌风格
     * @return array|string
     */
    public function addHallLingpaiStyle()
    {

        $result = $this->_form($this->hallLingpaiStyleTable);

        if(isset($result['id'])){
            $this->title = '编辑灵牌风格';
        }else {
            $this->title = '添加灵牌风格';
        }

        return $this->_form($this->hallLingpaiStyleTable, 'halllingpaistyleform');
    }

    /**
     * 编辑灵牌风格
     * @return array|string
     */
    public function editHallLingpaiStyle()
    {
        return $this->addHallLingpaiStyle();
    }

    /**
     * 删除灵牌风格
     */
    public function delHallLingpaiStyle() {
        if (DataService::update($this->hallLingpaiStyleTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

}