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

namespace app\admin\model;

use app\api\controller\Easemob;
use app\api\model\MemberModel;
use think\Db;
use think\Model;

class Hall extends Model
{

    public static function self(){
        return new self();
    }

    /**
     * 关联查询 单人馆
     * @return \think\model\relation\HasOne
     */
    public function hallOne()
    {
        return $this->hasOne('HallOne', 'hall_id')->bind([
            'one_img',
            'one_name',
            'one_sex',
            'one_ethnic',
            'one_birthday',
            'one_death',
            'one_relation',
            'one_rest_address',
            'one_epitaph',
            'one_lingpai_style'
        ]);
    }

    /**
     * 关联查询 双人馆
     * @return \think\model\relation\HasOne
     */
    public function hallTwo()
    {
        return $this->hasOne('HallTwo', 'hall_id')->bind([
            'two_img1',
            'two_name1',
            'two_sex1',
            'two_ethnic1',
            'two_birthday1',
            'two_death1',
            'two_lingpai_style1',

            'two_img2',
            'two_name2',
            'two_sex2',
            'two_ethnic2',
            'two_birthday2',
            'two_death2',
            'two_lingpai_style2',
            'two_relation',
            'two_describe',
        ]);
    }

    /**
     * 关联查询 家族馆
     * @return \think\model\relation\HasOne
     */
    public function hallFamily()
    {
        return $this->hasOne('HallFamily', 'hall_id')->bind([
            'family_img',
            'family_theme',
            'family_lingpai_style',
            'family_libeiren',
            'family_ancestral_home',
            'family_spirit',
        ]);
    }

    /**
     * 根据ID获取详情
     * @param $id
     * @param string $relation
     * @return static
     */
    public static function getDataById($id, $relation = '')
    {
        $data = self::get($id, $relation);
        return $data;
    }

    /**
     * 关联添加/更新纪念馆
     * @param int $id
     * @param string $relation
     * @param array $hallData
     * @return false|int
     */
    public function saveData($id = 0, $relation = '', $hallData = [])
    {

//        dump($hallData);die;
        // hall_img
        if (($hallData['hall_type'] == 1) && isset($hallData['hallOne']['one_img'])) {
            // 单人馆
            $hallData['hall_img'] = $hallData['hallOne']['one_img'];
        }else {
            // 多人馆 应用纪念馆风格图片style_img
            if ($hallData['hall_style']) {
                $hallData['hall_img'] = HallStyle::getDataById($hallData['hall_style'])['style_img'];
            }
        }

        if ($id) {
            // 更新数据
            $hallModel = self::get($id);

            // 自动更新时间字段
            $hallData['update_at'] = time();
            $hallData[$relation]['update_at'] = time();
            $res = $hallModel->together($relation)->save($hallData);

        } else {
            // 插入数据
            $hallModel = new self();

            //自动更新时间字段
            $hallData['create_at'] = time();
            $hallData[$relation]['create_at'] = time();

            $res = $hallModel->together($relation)->save($hallData);

            if ($res) {
                // 插入成功 创建该纪念馆群
                $hallSubId = self::getLastInsID();
                if ($relation == 'hallOne') {
                    $hallSubModel = new HallOne();
                }elseif($relation == 'hallTwo') {
                    $hallSubModel = new HallTwo();
                }elseif($relation == 'hallFamily') {
                    $hallSubModel = new HallFamily();
                }

                $hallId = $hallSubModel->where('id', $hallSubId)->value('hall_id');

                $memberId = 1; // todo 纪念馆创建者用户ID 后续优化
                $user = MemberModel::self()->findUser($memberId, '', 'member_id, hx_username');

                $this->createGroup($hallId, $user);
            }
        }

        return $res;
    }

    /**
     * 关联删除纪念馆
     * @param $id
     * @param string $relation
     * @return int
     */
    public function deleteData($id, $relation = '')
    {
        $hallModel = self::get($id);
        $res = $hallModel->together($relation)->delete();

        if ($res) {
            // TODO 同时删除该纪念馆的所有群、追思留言、追忆文选、追忆相册
//        $hallGroupModel = new HallGroup();
//        $hallGroupModel->where('hall_id', $id)->delete();
            Db::name('HallGroup')->where('hall_id', $id)->delete();
            Db::name('HallLeaveMessage')->where('hall_id', $id)->delete();
            Db::name('HallArticle')->where('hall_id', $id)->delete();
        }

        return $res;
    }

    public static function createGroup($hallId, $user)
    {


        $hallInfo = self::get($hallId);

        $groupName =  $hallInfo['hall_name'].'1群';
        $owner = $user['member_id'];
        $hxOwner = $user['hx_username'];

        $isPublic = 1;
        $maxUsers = 200;
        $members = [];

        // 创建环信群组
        $easemodApi = new Easemob();
        $groupId = $easemodApi->emchatCreateGroup($groupName, $hxOwner, '', $isPublic, $maxUsers, $members);

        // 保存群组信息到数据库
        $data = [
            'hall_id' => $hallId,
            'name' => $groupName,
            'announcement' => '',
            'introduction' => '',
            'is_public' => $isPublic,
            'max_users' => $maxUsers,
            'hx_group_id' => $groupId,
            'create_by' => $owner,
            'create_at' => time(),
        ];

        $result = HallGroup::createGroup($data);



        return true;
    }

    public static function getHallTypeById($hallId)
    {
        $result = self::where('id', $hallId)->value('hall_type');
        return $result;
    }

    /**
     * 获取纪念关系列表
     * @return mixed
     */
    public static function getRelationShip()
    {
        $relationShip = config('relationship');
        return $relationShip;
    }

    /**
     * 获取民族列表
     * @return mixed
     */
    public static function getNationList()
    {
        $data = config('ethnic');

        return $data;
    }

    /**
     * 根据ID获取民族信息
     * @param int $nationId
     * @return mixed
     */
    public static function getNationById($nationId)
    {
        $nationList = self::getNationList();

        $data = null;
        if ($nationId) {
            $data = [
                'id' => $nationId,
                'name' => $nationList[$nationId]
            ];
        }

        return $data;
    }

}
