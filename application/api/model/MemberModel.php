<?php
/**
 * @author: Axios
 *
 * @email: axioscros@aliyun.com
 * @blog:  http://hanxv.cn
 * @datetime: 2017/4/26 10:45
 */
namespace app\api\model;

use think\Model;

class MemberModel extends Model{
    protected $table = "yun_member";

    public static function self(){
        return new self();
    }
    public function exits($username){
        return $this->where('member_name',$username)->count();
    }

    public function findUser($user_id=0,$username='',$field = ''){
        if($user_id){
            $this->where('member_id',$user_id);
        }

        if(!empty($username)){
            $this->where('member_name',$username);
        }
        if(!empty($field)){
            $this->field($field);
        }
        $result = $this->find();

        if ($result) {
            return $result->toArray();
        }

        return false;
    }

    public function addUser($data){
        return $this->insertGetId($data);
    }

    public function updateUser($data,$user_id=0){
        if($user_id){
            return $this->where('member_id',$user_id)->update($data);
        }
        return false;
    }

    /**
     * 获取环信用户名
     * @param $user_id
     * @return mixed
     */
    public function getHxUsername($user_id)
    {
        return $this->where('member_id', $user_id)->value('hx_username');
    }

    /**
     * 获得可用的会员名
     * @param string $prefix
     * @param int $num
     * @return string
     */
    public function getMemberName($prefix = 'user_', $num = 0){
        if ($num < 1) {
            $num = rand(100, 899);
        }
        if (strlen($prefix) < 3) {
            $member_name = $prefix.$num;
        } else {
            $member_name = $prefix;
        }
        if (strlen($member_name) < 6) {
            $member_name = $member_name.$num;
        }
        $member = $this->findUser(0, $member_name);
        if(!empty($member)) {
            for ($i = 1;$i < 999;$i++) {
                $num += $i;
                $member_name = $prefix.$num;
                if (strlen($member_name) < 6) {
                    $member_name = 'user_'.$member_name;
                }
                $member = $this->findUser(0, $member_name);
                if(empty($member)) {//查询为空表示当前会员名可用
                    break;
                }
            }
        }
        return $member_name;
    }

    /**
     * 分享奖励纪念币
     * @param int $memberId 用户ID
     * @param int $rewardCoins 奖励纪念币数量
     * @return mixed
     */
    public function shareReward($memberId, $rewardCoins = 60)
    {
        $this->where('member_id', $memberId)->setInc('coins', $rewardCoins);
        $result = $this->where('member_id', $memberId)->value('coins');
        return $result;
    }

    /**
     * 纪念币充值
     * @param $memberId
     * @param $coins
     */
    public function rechareCoins($memberId, $coins)
    {
        $this->where('member_id', $memberId)->setInc('coins', $coins);
    }
}