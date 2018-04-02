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

namespace app\api\model;

use service\XSearchService;
use think\Db;
use think\Model;

/**
 * 纪念馆模型
 * Class Hall
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/7/5
 */
class Hall extends Model
{

    /**
     * 关联查询 纪念馆风格
     * @return mixed
     */
    public function hallStyle()
    {
        return $this->belongsTo('HallStyle', 'hall_style')->field('id, style_position, style_name, style_img, style_num, skin_dir, skin_type, skin_hall_type');
    }

    /**
     * 关联查询 纪念馆大厅风格
     * @return mixed
     */
    public function hallWorshipStyle()
    {
        return $this->belongsTo('HallWorshipStyle', 'hall_worship_style')->field('id, style_name, style_img, style_big_img, style_num, kuang_img');
    }

    /**
     * 关联查询 纪念馆音乐
     * @return mixed
     */
    public function hallMusic()
    {
        return $this->belongsTo('HallMusic', 'hall_music')->field('id, music_name, music_url, music_type');
    }

    /**
     * 关联查询纪念馆创建者
     * @return mixed
     */
    public function member()
    {
        return $this->belongsTo('MemberModel', 'hall_member_id')->field('member_id, member_name, member_avatar, member_sex, member_nickname, hx_username');
    }

    /**
     * 关联查询 单人馆
     * @return \think\model\relation\HasOne
     */
    public function hallOne()
    {
        return $this->hasOne('HallOne', 'hall_id');
    }

    /**
     * 关联查询 双人馆
     * @return \think\model\relation\HasOne
     */
    public function hallTwo()
    {
        return $this->hasOne('HallTwo', 'hall_id');
    }

    /**
     * 关联查询 家族馆
     * @return \think\model\relation\HasOne
     */
    public function hallFamily()
    {
        return $this->hasOne('HallFamily', 'hall_id');
    }

    /**
     * 关联查询 纪念馆群
     * @return \think\model\relation\HasMany
     */
    public function hallGroup()
    {
        return $this->hasMany('HallGroup', 'hall_id');
    }

    /**
     * 判断纪念馆是否存在
     * @param int $id 纪念馆ID
     * @return int|string
     */
    public static function exist($id)
    {
        $result = self::where('id', $id)->count();
        return $result;
    }

    /**
     * PC端获取纪念馆列表
     * @param int $hallType
     * @param int $isFamous 默认0 0 包括名人馆 1 名人馆 2 私人馆
     * @param int $famousType
     * @param string $sort
     * @param int $page
     * @param int $size
     * @param array $relationList
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getDatas($hallType = 0, $isFamous = 0, $famousType = 0, $sort = 'create_at desc', $page = 1, $size = 20, $relationList = [], $memberId = 0, $keywords = '')
    {
        $map = [
//            'is_need_password' => 1, // 纪念馆是否需要密码访问 1 不需要 2 需要
            'hall_status' => 1, // 纪念馆状态 1 正常 2 锁定
        ];

        // 根据纪念馆类型查询
        if ($hallType) {
            $map['hall_type'] = $hallType;
        }

        // 根据是否名人馆查询
//        $map['famous_type'] = 0;
        if ($isFamous == 1) {
            // 名人馆
            $map['famous_type'] = ['gt', 0];

            if ($famousType) {
                // 查询某个名人类型下的所有名人馆
                $map['famous_type'] = $famousType;
            }
        }elseif ($isFamous == 2) {
            // 私人馆
            $map['famous_type'] = 0;
        }

        // 根据用户ID查询
        if ($memberId) {
            $map['hall_member_id'] = $memberId;
        }
        
        // 根据关键词搜索查询
        if ($keywords != '') {
            $map['hall_name'] = ['like', "%{$keywords}%"];
        }
        
        $data = self::where($map)->relation($relationList)->order($sort)->page($page, $size)->select();
        $total = self::where($map)->relation($relationList)->count();
//        dump($data);die;
        if ($data) {
            foreach ($data as $key=>$item) {

                $hallRelation = false;
                if ($item['hall_type'] == 1) {
                    $hallInfo = Db::name('hall_one')->where('hall_id', $item['id'])->field('one_birthday, one_death')->find();
                    if (!$hallInfo) {
                        // 无数据 unset
                        unset($data[$key]);
                    }else {
                        //如果是单人馆 则获取逝者生日和忌日
                        $item['one_birthday'] = $hallInfo['one_birthday'];
                        $item['one_death'] = $hallInfo['one_death'];
                        $hallRelation = true;
                    }


                }elseif ($item['hall_type'] == 2) {
                    // 双人馆 显示风格图片
                    if ($item['hall_style']) {
                        $hallStyleInfo = HallStyle::get($item['hall_style']);
                        $skinDirPath = get_root_url().'/static/home/hall_skins/'.$hallStyleInfo['skin_hall_type'].'/'.$hallStyleInfo['skin_type'].'/'.$hallStyleInfo['skin_dir'].'/';
                        $data[$key]['hall_img'] = $skinDirPath.'jpg.jpg';
                        $hallRelation = true;
                    }
                }elseif ($item['hall_type'] == 3){
                    $hallInfo = Db::table('tp_hall_family')->where('hall_id', $item['id'])->field('family_theme, family_libeiren, family_ancestral_home, family_spirit')->find();
                    if (!$hallInfo) {
                        // 无数据 unset
                        unset($data[$key]);
                    }else {
                        // 家族馆 获取信息
                        $item['family_theme'] = $hallInfo['family_theme'];
                        $item['family_libeiren'] = $hallInfo['family_libeiren'];
                        $item['family_ancestral_home'] = $hallInfo['family_ancestral_home'];
                        $item['family_spirit'] = $hallInfo['family_spirit'];

                        // 家族成员 TODO
                        $groupList = HallGroup::getGroupList($item['id'])['list'];
                        $memberCount = 0;
                        foreach ($groupList as $group) {
                            $memberCount += HallGroupMember::getGroupMemberCount($group['id']);
                        }
                        $item['family_member'] = $memberCount;

                        // 家族馆 显示风格图片
                        if ($item['hall_style']) {
                            $hallStyleInfo = HallStyle::get($item['hall_style']);
                            $skinDirPath = get_root_url().'/static/home/hall_skins/'.$hallStyleInfo['skin_hall_type'].'/'.$hallStyleInfo['skin_type'].'/'.$hallStyleInfo['skin_dir'].'/';
                            $data[$key]['hall_img'] = $skinDirPath.'jpg.jpg';
                        }
                        $hallRelation = true;
                    }

                }

                if ($hallRelation) {
                    // 根据纪念馆祭拜值获取纪念馆等级
                    $item['hall_level'] = HallLevel::getHallLevelByExp($item['memorial_value']);

                    $item['hall_img'] = get_url_with_domain($item['hall_img']);

                    // 获取会员昵称
                    $memberInfo = MemberModel::get($item['hall_member_id']);
                    $item['member_name'] =$memberInfo['member_name'];
                    $item['member_nickname'] = $memberInfo['member_nickname'];

                    // 如果设置关联纪念馆音乐 则拼装url 否则不执行
                    if (in_array('hall_music', $relationList)) {
                        !empty($item['hall_music']) ? $item['hall_music']['music_url'] = get_url_with_domain($item['hall_music']['music_url']) : $item['hall_music'] = null;
                    }
                }


                // 如果是单人馆 则获取逝者生日和忌日
//                if ($item['hall_type'] == 1) {
//                    $hallOneInfo = Db::table('tp_hall_one')->where('hall_id', $item['id'])->field('one_birthday, one_death')->find();
//                    $item['one_birthday'] = $hallOneInfo['one_birthday'];
//                    $item['one_death'] = $hallOneInfo['one_death'];
//                }else {
//                    // 多人馆 显示风格图片
////                    $item['hall_img'] = HallStyle::get($item['hall_style'])['style_img'];
//                    if ($item['hall_style']) {
//                        $hallStyleInfo = HallStyle::get($item['hall_style']);
//
//                        $skinDirPath = get_root_url().'/static/home/hall_skins/'.$hallStyleInfo['skin_hall_type'].'/'.$hallStyleInfo['skin_type'].'/'.$hallStyleInfo['skin_dir'].'/';
//                        $data[$key]['hall_img'] = $skinDirPath.'jpg.jpg';
//
//                    }
//                }
//
//                if ($item['hall_type'] == 3) {
//                    // 家族馆 获取信息
//                    $hallFamilyInfo = Db::table('tp_hall_family')->where('hall_id', $item['id'])->field('family_theme, family_libeiren, family_ancestral_home, family_spirit')->find();
//                    $item['family_theme'] = $hallFamilyInfo['family_theme'];
//                    $item['family_libeiren'] = $hallFamilyInfo['family_libeiren'];
//                    $item['family_ancestral_home'] = $hallFamilyInfo['family_ancestral_home'];
//                    $item['family_spirit'] = $hallFamilyInfo['family_spirit'];
//
//                    // 家族成员 TODO
//                    $groupList = HallGroup::getGroupList($item['id'])['list'];
//                    $memberCount = 0;
//                    foreach ($groupList as $group) {
//                        $memberCount += HallGroupMember::getGroupMemberCount($group['id']);
//                    }
//
//                    $item['family_member'] = $memberCount;
//
//                }




//                // 获取会员昵称
//                $memberInfo = MemberModel::get($item['hall_member_id']);
//                $item['member_name'] =$memberInfo['member_name'];
//                $item['member_nickname'] = $memberInfo['member_nickname'];
//
//                // 如果设置关联纪念馆音乐 则拼装url 否则不执行
//                if (in_array('hall_music', $relationList)) {
//                    !empty($item['hall_music']) ? $item['hall_music']['music_url'] = get_url_with_domain($item['hall_music']['music_url']) : $item['hall_music'] = null;
//                }

            }
        }

        $totalPage = ceil($total / $size);
        $result['list'] = $data;
        $result['total'] = $total;
        $result['page'] = $totalPage;
        $result['size'] = $size;
        return $result;
    }

    /**
     * 根据搜索词获取纪念馆列表
     *
     * @param string $keywords
     * @param int $page
     * @param int $size
     * @return array|false|\PDOStatement|string|\think\Collection
     */
    public static function getDataByKeywords($keywords = '', $page = 1, $size = 50)
    {
        $data = self::getDatas(1, 1, 0, 'memorial_value desc', $page, $size, [], 0, $keywords);
        
        return $data;
    }

    /**
     * 根据首字母搜索纪念馆列表
     * @param string $letter
     * @return array
     */
    public static function getDataByLetter($letter = '')
    {
        // 根据首字母搜索
        $data = self::getDataByLetterFirst($letter);

        return $data;
    }

    /**
     * 根据纪念馆首字母获取纪念馆列表
     * @param string $letter
     * @return array
     */
    public static function getDataByLetterFirst($letter = '')
    {
        $data = self::getDatas(1, 1, 0, 'memorial_value desc', 1, 50);

        $resData = [];
        foreach($data['list'] as $vo) {
            $hallFirstLetter = getinitial($vo['hall_name']);
            if ($hallFirstLetter == $letter) {
                // 纪念馆名称首字母等于请求的字母
                $resData[] = $vo;
            }
        }
        return $resData;
    }
    
    /**
     * APP 获取纪念馆列表
     * @param int $loginUid
     * @param int $hallType
     * @param int $memberId
     * @param string $sort
     * @param int $page
     * @param int $size
     * @param array $relationList
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getHallList($loginUid = 0, $hallType = 0, $memberId = 0, $sort = 'create_at desc', $page = 1, $size = 20, $relationList = [], $search = '', $isFamous = 0)
    {
        $map = [
//            'is_need_password' => 1, // 纪念馆是否需要密码访问 1 不需要 2 需要
            'hall_status' => 1, // 纪念馆状态 1 正常 2 锁定
        ];

        // 根据纪念馆类型查询
        if ($hallType) {
            if ($hallType == 12) {
                // 普通单人馆和双人馆
                $map['hall_type'] = ['in', [1,2]];
            }else {
                $map['hall_type'] = $hallType;
            }
        }

        // 根据用户ID查询
        if ($memberId) {
            $map['hall_member_id'] = $memberId;
        }

        // 根据纪念馆名称查询
        if ($search) {
            $map['hall_name'] = ['like', "%{$search}%"];
        }

        // 查询名人馆
        if ($isFamous) {
            if ($isFamous == 1) {
                $map['famous_type'] = ['gt', 0];
            }else {
                $map['famous_type'] = ['eq', 0];
            }
        }

        $data = self::relation($relationList)->where($map)->order($sort)->page($page, $size)->select();

//        dump($data);die;
        if ($data) {
            foreach ($data as $key=>$item) {
                $hallRelation = false;




                $hallInfo = [];

                // 如果是单人馆 则获取逝者生日和忌日等信息
                if ($item['hall_type'] == 1) {
                    $hallInfo = Db::table('tp_hall_one')
                        ->where('hall_id', $item['id'])
                        ->field('one_img, one_birthday, one_death, one_epitaph, one_lingpai_style')
                        ->find();

//                    dump($hallInfo);die;
                    if (!$hallInfo) {
                        // 无数据 unset
                        unset($data[$key]);
                    }else {
                        // 灵牌样式
                        $item['one_lingpai_style'] = HallLingpaiStyle::getDataById($hallInfo['one_lingpai_style']);

                        // 拼装图片地址
                        if ($item['one_lingpai_style']) {
                            $item['one_lingpai_style']['style_img'] = get_url_with_domain($item['one_lingpai_style']['style_img']);
                            $item['one_lingpai_style']['style_big_img'] = get_url_with_domain($item['one_lingpai_style']['style_big_img']);
                        }
                        if ($hallInfo['one_img']) {
                            $hallInfo['one_img'] = get_url_with_domain($hallInfo['one_img']);
                        }
                        unset($hallInfo['one_lingpai_style']);
                        $hallRelation = true;
                    }



                }elseif ($item['hall_type'] == 2){
                    // 双人馆
                    $hallInfo = Db::table('tp_hall_two')
                        ->where('hall_id', $item['id'])
                        ->field('two_img1, two_name1, two_birthday1, two_death1, two_lingpai_style1, two_img2, two_name2, two_birthday2, two_death2, two_lingpai_style2, two_describe')
                        ->find();

                    if (!$hallInfo) {
                        // 无数据 unset
                        unset($data[$key]);
                    }else {
                        // 灵牌样式
                        $item['two_lingpai_style1'] = HallLingpaiStyle::getDataById($hallInfo['two_lingpai_style1']);
                        $item['two_lingpai_style2'] = HallLingpaiStyle::getDataById($hallInfo['two_lingpai_style2']);

                        // 拼装图片地址
                        if ($item['two_lingpai_style1']) {
                            $item['two_lingpai_style1']['style_img'] = get_url_with_domain($item['two_lingpai_style1']['style_img']);
                            $item['two_lingpai_style1']['style_big_img'] = get_url_with_domain($item['two_lingpai_style1']['style_big_img']);
                        }
                        if ($item['two_lingpai_style2']) {
                            $item['two_lingpai_style2']['style_img'] = get_url_with_domain($item['two_lingpai_style2']['style_img']);
                            $item['two_lingpai_style2']['style_big_img'] = get_url_with_domain($item['two_lingpai_style2']['style_big_img']);
                        }
                        $hallInfo['two_img1'] = get_url_with_domain($hallInfo['two_img1']);
                        $hallInfo['two_img2'] = get_url_with_domain($hallInfo['two_img2']);

                        unset($hallInfo['two_lingpai_style1'], $hallInfo['two_lingpai_style2']);
                        $hallRelation = true;
                    }


                }elseif ($item['hall_type'] == 3){
                    // 家族馆
                    $hallInfo = Db::table('tp_hall_family')
                        ->where('hall_id', $item['id'])
                        ->field('family_img, family_theme, family_lingpai_style, family_libeiren, family_ancestral_home, family_spirit')
                        ->find();

                    if (!$hallInfo) {
                        // 无数据 unset
                        unset($data[$key]);
                    }else {
                        // 灵牌样式
                        $item['family_lingpai_style'] = HallLingpaiStyle::getDataById($hallInfo['family_lingpai_style']);

                        // 拼装图片地址
                        if ($item['family_lingpai_style']) {
                            $item['family_lingpai_style']['style_img'] = get_url_with_domain($item['family_lingpai_style']['style_img']);
                            $item['family_lingpai_style']['style_big_img'] = get_url_with_domain($item['family_lingpai_style']['style_big_img']);
                        }
                        $hallInfo['family_img'] = get_url_with_domain($hallInfo['family_img']);

                        unset($hallInfo['family_lingpai_style']);
                        $hallRelation = true;
                    }


                }


                if ($hallRelation) {
                    // 根据纪念馆祭拜值获取纪念馆等级
                    $item['hall_level'] = HallLevel::getHallLevelByExp($item['memorial_value']);

                    // 获取会员昵称
                    $memberInfo = MemberModel::get($item['hall_member_id']);
                    $item['member_name'] =$memberInfo['member_name'];
                    $item['member_nickname'] = $memberInfo['member_nickname'];

                    // 拼装图片地址
                    $item['hall_img'] = get_url_with_domain($item['hall_img']);
                    if ($item['hall_style']) {
                        // 如果有纪念馆风格
                        $hallStyleInfo = HallStyle::get($item['hall_style']['id']);
                        $skinDirPath = get_root_url().'/static/home/hall_skins/'.$hallStyleInfo['skin_hall_type'].'/'.$hallStyleInfo['skin_type'].'/'.$hallStyleInfo['skin_dir'].'/';

                        if ($item['hall_type'] == 1) {
                            // 单人馆
                            $item['hall_style']['style_img'] = $skinDirPath.'guan_bg.jpg';
                            $item['hall_style']['kuang_img'] = $skinDirPath.'kuang.png';

                        }elseif ($item['hall_type'] == 2) {
                            // 双人馆
                            $item['hall_style']['style_img'] = $skinDirPath.'yuan_bg_6.jpg';
                            $item['hall_style']['kuang_img'] = $skinDirPath.'kuang.png';

                            // 多人馆 显示风格缩略图
                            $item['hall_img'] = $skinDirPath.'jpg.jpg';

                        }elseif ($item['hall_type']  == 3) {
                            // 家族馆
                            $item['hall_style']['style_img'] = $skinDirPath.'yuan_bg_6.jpg';
                            $item['hall_style']['yuan_title_img'] = $skinDirPath.'yuan_title.png';
                            $item['hall_style']['yuan_txt_img'] = $skinDirPath.'yuan_txt.png';

                            // 多人馆 显示风格缩略图
                            $item['hall_img'] = $skinDirPath.'jpg.jpg';
                        }

                    }

                    if ($item['hall_worship_style']) {
                        $item['hall_worship_style']['style_img'] = get_url_with_domain($item['hall_worship_style']['style_img']);
                        $item['hall_worship_style']['style_big_img'] = get_url_with_domain($item['hall_worship_style']['style_big_img']);
                        $item['hall_worship_style']['kuang_img'] = get_url_with_domain($item['hall_worship_style']['kuang_img']);
                    }


                    // 纪念馆分享地址
                    $item['share_url'] = get_url_with_domain(url('home/Hall/shareUrl'));
                    // 判断当前登录用户是否关注过此纪念馆
                    $item['has_followed'] = 0;
                    $hasFollowed = HallFollow::exist(['member_id' => $loginUid, 'hall_id' => $item['id']]);
                    if ($hasFollowed) {
                        $item['has_followed'] = 1;
                    }

                    // 如果设置关联纪念馆音乐 则拼装url 否则不执行
                    if (in_array('hall_music', $relationList)) {
                        !empty($item['hall_music']) ? $item['hall_music']['music_url'] = get_url_with_domain($item['hall_music']['music_url']) : $item['hall_music'] = null;
                    }

                    $s = $item->toArray();

                    $data[$key] = array_merge($s, $hallInfo);
                }
            }
        }

        return $data;
    }

    /**
     * 根据纪念馆ID获取详情
     * @param int $id 纪念馆ID
     * @param array $relationList 需要关联的数据表
     * @param int $memberId 当前登录用户ID
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getInfoById($id, $relationList = [], $memberId = 0)
    {
        $info = self::find($id);

        if (!$info) {
            return null;
        }

        // TODO 根据纪念馆状态获取纪念馆信息 如果需要密码访问 请输入正确的密码 如果隐藏了 其他用户无法查看此纪念馆

        // 根据纪念馆祭拜值获取纪念馆等级
        $hallLevel = HallLevel::getHallLevelByExp($info['memorial_value']);
        $result = [];

        $hallInfo = [];

        if ($info['hall_type'] == 1) {
            // 单人馆
            $hallInfo = Db::table('tp_hall_one')
                ->where('hall_id', $id)
                ->field('id, hall_id, create_at, update_at', true)
                ->find();

            $result = self::relation($relationList)->find($id);

            $result['hall_level'] = $hallLevel; // 纪念馆等级

            // 灵牌样式
            $result['one_lingpai_style'] = HallLingpaiStyle::getDataById($hallInfo['one_lingpai_style']);
            $result['one_ethnic'] = self::getNation($hallInfo['one_ethnic']);

            // 拼装图片地址
            if ($result['one_lingpai_style']) {
                $result['one_lingpai_style']['style_img'] = get_url_with_domain($result['one_lingpai_style']['style_img']);
                $result['one_lingpai_style']['style_big_img'] = get_url_with_domain($result['one_lingpai_style']['style_big_img']);
            }
            $hallInfo['one_img'] = get_url_with_domain($hallInfo['one_img']);

            unset($hallInfo['one_ethnic'], $hallInfo['one_lingpai_style']);

        } elseif ($info['hall_type'] == 2) {
            // 双人馆
            $hallInfo = Db::table('tp_hall_two')
                ->where('hall_id', $id)
                ->field('id, hall_id, create_at, update_at', true)
                ->find();

            $result = self::relation($relationList)->find($id);

            $result['hall_level'] = $hallLevel; // 纪念馆等级

            // 灵牌样式
            $result['two_lingpai_style1'] = HallLingpaiStyle::getDataById($hallInfo['two_lingpai_style1']);
            $result['two_lingpai_style2'] = HallLingpaiStyle::getDataById($hallInfo['two_lingpai_style2']);
            $result['two_ethnic1'] = self::getNation($hallInfo['two_ethnic1']);
            $result['two_ethnic2'] = self::getNation($hallInfo['two_ethnic2']);

            // 拼装图片地址
            if ($result['two_lingpai_style1']) {
                $result['two_lingpai_style1']['style_img'] = get_url_with_domain($result['two_lingpai_style1']['style_img']);
                $result['two_lingpai_style1']['style_big_img'] = get_url_with_domain($result['two_lingpai_style1']['style_big_img']);
            }
            if ($result['two_lingpai_style2']) {
                $result['two_lingpai_style2']['style_img'] = get_url_with_domain($result['two_lingpai_style2']['style_img']);
                $result['two_lingpai_style2']['style_big_img'] = get_url_with_domain($result['two_lingpai_style2']['style_big_img']);
            }
            $hallInfo['two_img1'] = get_url_with_domain($hallInfo['two_img1']);
            $hallInfo['two_img2'] = get_url_with_domain($hallInfo['two_img2']);

            unset($hallInfo['two_ethnic1'], $hallInfo['two_ethnic2'], $hallInfo['two_lingpai_style1'], $hallInfo['two_lingpai_style2']);

        }elseif ($info['hall_type'] == 3) {
            // 家族馆
            $hallInfo = Db::table('tp_hall_family')
                ->where('hall_id', $id)
                ->field('id, hall_id, create_at, update_at', true)
                ->find();

            $result = self::relation($relationList)->find($id);

            $result['hall_level'] = $hallLevel; // 纪念馆等级

            // 灵牌样式
            $result['family_lingpai_style'] = HallLingpaiStyle::getDataById($hallInfo['family_lingpai_style']);

            // 拼装图片地址
            if ($result['family_lingpai_style']) {
                $result['family_lingpai_style']['style_img'] = get_url_with_domain($result['family_lingpai_style']['style_img']);
                $result['family_lingpai_style']['style_big_img'] = get_url_with_domain($result['family_lingpai_style']['style_big_img']);
            }
            $hallInfo['family_img'] = get_url_with_domain($hallInfo['family_img']);

            unset($hallInfo['family_lingpai_style']);
        }

        // 纪念馆分享地址
        if ($info) {
            $result['share_url'] = get_url_with_domain(url('home/Hall/shareUrl'));
            $result['hall_url'] = get_url_with_domain(url('/g/'.$id));
            // 判断当前登录用户是否关注过此纪念馆
            $result['has_followed'] = 0;
            $hasFollowed = HallFollow::exist(['member_id' => $memberId, 'hall_id' => $id]);
            if ($hasFollowed) {
                $result['has_followed'] = 1;
            }
        }

        $result['hall_img'] = get_url_with_domain($result['hall_img']);

        // 拼装图片地址
        // 纪念馆风格图片
        if ($info['hall_style']) {
            // 如果有纪念馆风格
            $hallStyleInfo = HallStyle::get($result['hall_style']['id']);
            $skinDirPath = get_root_url().'/static/home/hall_skins/'.$hallStyleInfo['skin_hall_type'].'/'.$hallStyleInfo['skin_type'].'/'.$hallStyleInfo['skin_dir'].'/';

            if ($info['hall_type'] == 1) {
                // 单人馆
                $result['hall_style']['style_img'] = $skinDirPath.'guan_bg.jpg';
                $result['hall_style']['kuang_img'] = $skinDirPath.'kuang.png';

            }elseif ($info['hall_type'] == 2) {
                // 双人馆
                $result['hall_style']['style_img'] = $skinDirPath.'yuan_bg_6.jpg';
                $result['hall_style']['kuang_img'] = $skinDirPath.'kuang.png';

                // 多人馆 显示风格缩略图
                $result['hall_img'] = $skinDirPath.'jpg.jpg';

            }elseif ($result['hall_type']  == 3) {
                // 家族馆
                $result['hall_style']['style_img'] = $skinDirPath.'yuan_bg_6.jpg';
                $result['hall_style']['yuan_title_img'] = $skinDirPath.'yuan_title.png';
                $result['hall_style']['yuan_txt_img'] = $skinDirPath.'yuan_txt.png';

                // 多人馆 显示风格缩略图
                $result['hall_img'] = $skinDirPath.'jpg.jpg';
            }

        }

        if ($info['hall_worship_style']) {
            $result['hall_worship_style']['style_img'] = get_url_with_domain($result['hall_worship_style']['style_img']);
            $result['hall_worship_style']['style_big_img'] = get_url_with_domain($result['hall_worship_style']['style_big_img']);
            $result['hall_worship_style']['kuang_img'] = get_url_with_domain($result['hall_worship_style']['kuang_img']);
        }

        // 如果设置关联纪念馆音乐 则拼装url 否则不执行
        if (in_array('hall_music', $relationList)) {
            !empty($result['hall_music']) ? $result['hall_music']['music_url'] = get_url_with_domain($result['hall_music']['music_url']) : $result['hall_music'] = null;
        }

        $s = $result->toArray();


        $result = array_merge($s, $hallInfo);

        return $result;
    }

    /**
     * 根据ID获取民族信息
     * @param int $nationId
     * @return mixed
     */
    public static function getNation($nationId)
    {
        $nationList = \config('ethnic');

        $data = null;
        if ($nationId) {
            $data = [
                'id' => $nationId,
                'name' => $nationList[$nationId]
            ];
        }
        return $data;
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
     * 纪念馆访问量+1
     * @param int $id 纪念馆ID
     */
    public static function setViewInc($id)
    {
        self::where('id', $id)->setInc('view');
    }

    /**
     * 纪念馆大厅祭拜排行
     * @param int $hallId 纪念馆ID
     * @param string $rankType 排行类型 默认为：total_rank 总排行：total_rank 日排行：day_rank
     * @param int $page 页码
     * @param int $size 数量
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function worshipRank($hallId, $rankType = 'total_rank', $page = 1, $size = 20, $memberId = 0)
    {
//        config('database.prefix', '');
//
//        $map = [
//            'w.hall_id' => $hallId
//        ];

        $map = '';
        if ($hallId) {
            $map .= 'WHERE w.hall_id = '.$hallId;
        }

        if ($rankType == 'day_rank') {
            // 日排行
//            $list = Db::table("tp_mall_worship")
//                ->where($map)
//                ->whereTime('w.duration', 'today')
//                ->alias("w")
//                ->join('yun_member m','w.user_id = m.member_id')
//                ->field("sum(w.goods_memorial_integral) as hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar")
//                ->order("hall_integral desc")
//                ->page($page,$size)
//                ->group('member_id')
//                ->select();
//            $total = Db::table("tp_mall_worship")
//                ->where($map)
//                ->whereTime('w.duration', 'today')
//                ->alias("w")
//                ->join('yun_member m','w.user_id = m.member_id')
//                ->field("sum(w.goods_memorial_integral) as sum, m.member_id, m.member_name, m.member_nickname, m.member_avatar")
//                ->order("sum desc")
//                ->group('member_id')
//                ->count();

            // AND to_days(w.duration) = to_days(now())
            if ($hallId) {
                $map .= ' AND to_days(from_unixtime(w.duration)) = to_days(now())';
            }else {
                $map .= 'to_days(from_unixtime(w.duration)) = to_days(now())';
            }

            $query = "SELECT sum(w.goods_memorial_integral) as hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar FROM tp_mall_worship AS w
                                   LEFT JOIN yun_member AS m ON w.user_id = m.member_id
                                   ".$map." GROUP BY m.member_id";

            $list = Db::query($query." ORDER BY hall_integral desc LIMIT ".($page-1) * $size.", $size");
            $total = count(Db::query($query));
        }else {
            // 总排行
//            $list = Db::table("tp_member_worship")
//                ->where($map)
//                ->alias("w")
//                ->join('yun_member m','w.member_id = m.member_id')
//                ->field("w.hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar")
//                ->order("w.member_integral desc")
//                ->page($page,$size)
//                ->group('member_id')
//                ->select();
//            $total = Db::table("tp_member_worship")
//                ->where($map)
//                ->alias("w")
//                ->join('yun_member m','w.member_id = m.member_id')
//                ->field("w.hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar")
//                ->group('member_id')
//                ->count();

            $query = "SELECT w.hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar FROM tp_member_worship AS w
                                   LEFT JOIN yun_member AS m ON w.member_id = m.member_id
                                   ".$map." GROUP BY member_id";

            $list = Db::query($query." ORDER BY w.member_integral desc LIMIT ".($page-1) * $size.", $size");
            $total = count(Db::query($query));
        }

        $currentOrder = 0;
        if ($list) {
            foreach ($list as $key=>$item) {
                $list[$key]['memorial_order'] = $size*($page - 1) + $key + 1;
                $list[$key]['member_avatar'] = get_url_with_domain($item['member_avatar']);
                // 当前登录用户排在第几
                if ($memberId && $item['member_id'] == $memberId) {
                    $currentOrder = $size*($page - 1) + $key + 1;
                }

            }
        }

        $totalPage = ceil($total / $size);
        $data['list'] = $list;
        $data['total'] = $total;
        $data['page'] = $totalPage;
        $data['size'] = $size;
        $data['current_order'] = $currentOrder;

        return $data;
    }

    /**
     * 纪念馆排行
     * @param string $rankType 排行类型 默认为：total_rank 总排行：total_rank 日排行：day_rank
     * @param int $page 页码
     * @param int $size 数量
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function hallRank($rankType = 'total_rank', $page = 1, $size = 20)
    {
//        config('database.prefix', '');

        $map = [

        ];

        if ($rankType == 'day_rank') {
            // 日排行
            $list = Db::name("member_worship")
                ->where($map)
                ->whereTime('w.duration', 'today')
                ->alias("w")
//                ->join('yun_member m','w.user_id = m.member_id')
                ->join('tp_hall h','w.hall_id = h.id')
//                ->field("w.hall_id, sum(w.hall_integral) as hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar, h.hall_name")
                ->field("w.hall_id, sum(w.hall_integral) as hall_integral, h.hall_name, h.hall_img, h.hall_type, h.hall_style")
                ->order("hall_integral desc")
                ->page($page,$size)
                ->group('hall_id')
                ->select();
            $total = Db::name("member_worship")
                ->where($map)
                ->whereTime('w.duration', 'today')
                ->alias("w")
//                ->join('yun_member m','w.user_id = m.member_id')
                ->join('tp_hall h','w.hall_id = h.id')
//                ->field("w.hall_id, sum(w.hall_integral) as hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar, h.hall_name")
                ->field("w.hall_id, sum(w.hall_integral) as hall_integral, h.hall_name, h.hall_img, h.hall_type, h.hall_style")
                ->group('hall_id')
                ->count();
        }else {
            // 总排行
            $list = Db::name("hall")
                ->where($map)
//                ->alias("h")
//                ->join('yun_member m','h.member_id = m.member_id')
//                ->field("h.id as hall_id, h.memorial_value as hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar, h.hall_name")
                ->field("id as hall_id, memorial_value as hall_integral, hall_name, hall_img, hall_type, hall_style")
                ->order("hall_integral desc")
                ->page($page,$size)
                ->select();
            $total = Db::name("hall")
                ->where($map)
//                ->alias("h")
//                ->join('yun_member m','h.member_id = m.member_id')
//                ->field("h.id as hall_id, h.memorial_value as hall_integral, m.member_id, m.member_name, m.member_nickname, m.member_avatar, h.hall_name")
                ->field("id as hall_id, memorial_value as hall_integral, hall_name, hall_img, hall_type, hall_style")
                ->count();
        }

        if ($list) {
            foreach ($list as $key=>$item) {
//                $list[$key]['hall_order'] = $key + 1;
                $list[$key]['hall_order'] = $size*($page - 1) + $key + 1;
                $list[$key]['hall_img'] = get_url_with_domain($item['hall_img']);

                if (!in_array($item['hall_type'], [1, 6])) {
                    // 多人馆 显示风格图片
                    $styleImg = Db::table('tp_hall_style')->find($item['hall_style'])['style_img'];
                    $list[$key]['hall_img'] = get_url_with_domain($styleImg);
                }

                unset($list[$key]['hall_type'], $list[$key]['hall_style']);
            }
        }
        $totalPage = ceil($total / $size);
        $data['list'] = $list;
        $data['total'] = $total;
        $data['page'] = $totalPage;
        $data['size'] = $size;

        return $data;
    }


    /**
     * 编辑纪念馆状态
     * @param int $hallId 纪念馆ID
     * @param int $hallStatus 纪念馆状态
     * @param string $callPassword 访问密码
     * @return $this
     */
    public static function modifyHallState($hallId, $hallStatus = 0, $callPassword = '')
    {
        if ($hallStatus == 1) {
            // 关闭纪念馆 任何用户无法访问该馆及留言
            // hall_status 2    1正常 2关闭
            $data = [
                'hall_status' => 2
            ];

        }elseif ($hallStatus == 2) {
            // 所有人可见 所有用户都可以访问该馆
            // is_visible = 1, is_need_password = 1, call_password = ''
            $data = [
                'is_visible' => 1,
                'is_need_password' => 1,
                'call_password' => ''
            ];

        }elseif ($hallStatus == 3) {
            // 密码访问 is_visible = 1, is_need_password = 2, call_password = 'bbb'
            $data = [
                'is_visible' => 1,
                'is_need_password' => 2,
                'call_password' => $callPassword
            ];

        }elseif ($hallStatus == 4) {
            // 隐藏
            // is_visible = 2, is_need_password = 1, call_password = ''
            $data = [
                'is_visible' => 2,
                'is_need_password' => 1,
                'call_password' => ''
            ];

        }

        $data['update_at'] = time(); // 更新时间

        $result = self::where('id', $hallId)->update($data);

        return $result;
    }

    /**
     * 获取我关注的纪念馆
     * @param int $memberId 用户ID
     * @param int $isFamous 是否名人馆 默认为全部
     * @param int $page 页码
     * @param int $size 数量
     * @return mixed
     */
    public static function getMyFollowingHall($memberId = 0, $isFamous = 0, $page = 1, $size = 20)
    {

        $map = [];
        $map['f.member_id'] = $memberId;
        if ($isFamous) {
            $map['h.famous_type'] = ['gt', 0];
        }

        $data = Db::name("hall")
            ->where($map)
            ->alias("h")
            ->join('tp_hall_follow f','f.hall_id = h.id')
            ->field("h.*, f.hall_id, f.member_id")
            ->order("create_at desc")
            ->page($page,$size)
            ->group('hall_id')
            ->select();

        $resData = [];
        if ($data) {
            // 获取纪念馆详情
            foreach ($data as $item) {
                $resData[] = self::getInfoById($item['id'], ['hall_style', 'hall_worship_style', 'hall_music'], $memberId);
            }
        }
        return $resData;
    }


    /**
     * 纪念馆索引重建
     *
     * @param int $updata
     */
    public static function reBuildList($updata = 0)
    {
        $xs = new XSearchService('yjn_hall'); // 实例化xunsearch服务

        // 清空数据缓存
        $xs->clearIndex();
        echo "clear ok";

        $data = self::select();

        // 更新数据索引
        foreach ($data as $value) {
            $value = $value->toArray();
            $xs->index($value, $updata);
            dump($value);
            echo $value['id'].'===========is OK';
        }
    }

    /**
     * 纪念馆搜索
     *
     * @param $keyword
     * @param int $page
     * @param int $size
     * @return array
     */
    public static function hallSearch($keyword, $page = 1, $size = 20)
    {
        $xs = new XSearchService('yjn_hall'); // 实例化xunsearch服务

        $start = ($page-1) * $size;
        list($data, $count) = $xs->SmartSearch($keyword, $size, $start);
        $resData = array();
        foreach($data as $key => $value) {
            $resData[$key]['id']        = $value->id;
            $resData[$key]['hall_name']      = $value->hall_name;
            $resData[$key]['create_at']      = $value->create_at;
            $resData[$key]['update_at']   = $value->update_at;
            $resData[$key]['view']  = $value->view;
        }
        return array($resData, $count);
    }

    /**
     * 纪念馆追忆文选列表
     *
     * @param int $hallType 纪念馆类型（可选默认为“0”）__如果传入“12”表示普通单人馆和双人馆
     * @param int $isFamous 是否名人馆（可选默认为“0”）__0-所有__1-名人__2-普通个人馆
     * @param int $page 页码
     * @param int $size 数量
     * @param string $sort 排序方式
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function hallArticleList($hallType = 1, $isFamous = 0, $page = 1, $size = 20, $sort = 'create_at desc')
    {
        $map['h.hall_type'] = $hallType;
        if ($isFamous == 1){
            // 名人馆
            $map['h.famous_type'] = ['gt', 0];
        }elseif($isFamous == 2){
            // 普通个人馆
            $map['h.famous_type'] = ['eq', 0];
        }else {
            // 所有馆
        }
        $data = Db::name("hall_article")
            ->where($map)
            ->alias("a")
            ->join('tp_hall h','a.hall_id = h.id')
            ->field("a.*, h.hall_type, h.famous_type")
            ->order($sort)
            ->page($page, $size)
            ->group('hall_id')
            ->select();

        return $data;
    }
}
