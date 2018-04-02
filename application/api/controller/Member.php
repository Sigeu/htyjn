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


use app\api\model\MemberFollow;
use app\common\controller\ApiLogin;
use axios\tpr\service\RedisService;
use think\cache\driver\Redis;
use think\Db;
use think\Session;
/**
 * 会员关注API
 * Class Member
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/18
 */
class Member extends ApiLogin
{

    /**
     * andy - 会员关注 / 取消关注
     * @desc 会员关注 / 取消关注
     * @method post
     * @parameter string token 用户token（必须）
     * @parameter string follow_who 关注谁（必须）
     * @response
     */
    public function follow()
    {
        $data = $this->_follow();
        if(Db::name('member_follow')->where($data)->count()){
            // 取消关注
            $result = Db::name('member_follow')->where($data)->delete();
            if($result){
                $this->response(2, 200, '取消关注成功');
            }else{
                $this->response(2, 0, '取消关注失败');
            }
        }else {
            // 关注
            $data['create_at'] = time();
            $result = Db::name('member_follow')->insertGetId($data);
            if($result){
                $this->response(1, 200, '关注成功');
            }else{
                $this->response(1, 0, '关注失败');
            }
        }
    }

    /**
     * 会员关注 辅助方法
     * @return array
     */
    private function _follow()
    {
        $followWho = $this->param['follow_who'];
        $whoFollow = $this->user['member_id'];
        $data = [
            'follow_who' => $followWho,
            'who_follow' => $whoFollow,
        ];
        $user = $this->user;
        if($user['member_id'] != $this->user['member_id']) {
            $this->wrong(0,"用户无效");
        }

        return $data;
    }

    /**
     * 会员纪念值排行
     * @desc 会员纪念值排行
     * @method POST
     * @parameter string token 用户token（必须）
     * @parameter int page 第几页（必须）
     * @parameter int size 每页个数（可选默认“20”）
     * @response
     */
    public function rank()
    {
        $page = isset($this->param['page']) && !empty($this->param['page']) ? $this->param['page'] : 1;
        $size = isset($this->param['size']) && !empty($this->param['size']) ? $this->param['size'] : 20;
        $result = Db::table('yun_member')->where('is_deleted',0)->order('memorial_value desc')->page($page, $size)->select();
        if (!$result) {
            $this->wrong(0, '暂无数据');
        }

        foreach($result as $key=>$value) {
            $result[$key]['member_avatar'] = get_url_with_domain($value['member_avatar']);
        }

        $this->response($result);
    }

    /**
     * 会员签到接口
     * @desc 会员签到接口
     * @method POST
     * @parameter int id 用户id（必须）
     * @parameter string token 用户token（必须）
     * @response
     */
    public function sign()
    {
        $id = $this->param['id'];
        $data['member_id']= $id;
        $expire = intval(strtotime("tomorrow"))-intval(time());

        if(!$expire) {
            RedisService::redis()->switchDB(0)->set('sign_'.$id, '');
        }
        $punch = RedisService::redis()->switchDB(0)->get('sign_'.$id);

        if($punch == $id){
            $this->response(null, 0, '今天已经签到过！');
        }else {
            $result=Db::table('yun_member')->where('member_id',$data['member_id'])->setInc('coins',60);
            if($result){
              $coins=  Db::table('yun_member')->where('member_id',$data['member_id'])->field('coins')->find();
                // redis 缓存签到信息
                RedisService::redis()->switchDB(0)->set('sign_'.$id, $id, $expire);
                $this->response($coins, 200, '签到成功');
            }else{
                $this->response(null, 0, '签到失败，稍后再试');
            }
        }


    }

    /**
     * 获取我关注的人
     * @desc 获取我关注的人
     * @method POST
     * @parameter string token 用户token（必须）
     * @response
     */
    public function getMyFollowingPerson()
    {

        $memberId = $this->user['member_id'];

        $data = MemberFollow::getMyFollowingPerson($memberId);

        if (!$data) {
            $this->wrong(0, '暂无数据');
        }

        $this->response($data, 200, '获取数据成功');
    }



}
