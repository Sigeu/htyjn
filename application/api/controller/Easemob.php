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

use app\api\model\MemberModel;

use axios\tpr\core\Api;
use service\EasemobService;
use think\Db;

/**
 * 环信通信 API
 * Class Easemob
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/7/4
 */
class Easemob extends Api
{

    /**
     * 初始化环信账号信息
     * @return mixed
     */
    private function get_options() {
        /**
         * 本地测试环信账号信息
         */
//        $options['client_id']='YXA6Zyu5IB_lEee89pPb6PIgmA';
//        $options['client_secret']='YXA6havSPCf7BsKFpfvA3RCykr1ynDY';
//        $options['org_name']='1162170413115802';
//        $options['app_name']='htmoodle';

        /**
         * 环拓环信账号信息
         */
        $options['client_id']='YXA61SeBQDn7Eeevz51kVYEa1A';
        $options['client_secret']='YXA64OQBA2rXUjtbRjUqg4QbuGYdqJg';
        $options['org_name']='1127170417178975';
        $options['app_name']='htmemorial';

        return $options;
    }

    /**
     *
     * @desc andy-注册环信用户 如果不传用户ID 则批量注册数据库中所有用户到环信__注意：批量注册动作只允许在网站上线之前，上线后，不允许批量注册用户，否则会影响群组
     * @method post
     * @parameter int member_name 用户ID（可选）默认为“”_如果不传member_name，则批量注册所有用户
     * @parameter string multiRegisterCode 批量注册执行码（可选）
     * @response
     */
    public function emchatRegisterUser($memberName = '', $user = []) {

        if ($memberName == '') {
            $memberName = isset($this->param['member_name']) ? $this->param['member_name'] : '';
        }
        $multiRegisterCode = isset($this->param['multiRegisterCode']) ? $this->param['multiRegisterCode'] : '';

        // 检查用户是否存在
        if ($memberName != '') {
            MemberModel::self()->exits($memberName) ? true : $this->wrong(404, '用户不存在');
        }

        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        if ($memberName != '' && $multiRegisterCode == '') {
            $sUserData = MemberModel::self()->findUser(0, $memberName);

            //注册单个用户
            // 生成唯一用户名 密码
            $hUser = array(
                'username' => $sUserData['member_id'].uniqid(),
                'password' => md5($sUserData['member_id'].uniqid())
            );

            $user['hx_username'] = $hUser['username'];
            $user['hx_password'] = $hUser['password'];

            $sUser = [
                'hx_username' => $hUser['username'],
                'hx_password' => $hUser['password']
            ];

            if ($sUserData['hx_username'] != '') {
                // 数据库中存在 则先删除环信用户信息 再更新服务器环信用户信息 update()
                $hx->deleteUser($sUserData['hx_username']); // 删除环信用户
                $hx->createUsers($hUser); // 重新注册环信用户

                // 在本地数据库中更新环信用户名/密码
                $res = MemberModel::self()->updateUser($sUser, $sUserData['member_id']); // 更新数据
            }else {
                // 数据库中不存在 则注册环信用户 add()
                $hx->createUsers($hUser); // 注册环信用户

                // 将环信用户名/密码保存到本地数据库
                $res = MemberModel::self()->updateUser($sUser, $sUserData['member_id']); // 插入数据
            }
        } else {

            if ($multiRegisterCode != 'lucifer') {
                $this->wrong(500, '批量注册执行码错误');
            }
            // 批量注册用户
            //从网站获取所有用户 id
            $userDatas = MemberModel::self()->where('is_deleted', 0)->select();

            foreach ($userDatas as $userData) {
                // 生成唯一用户名 密码
                $hUser = array(
                    'username' => $userData['member_id'].uniqid(),
                    'password' => md5($userData['member_id'].uniqid())
                );

                $sUser = [
                    'hx_username' => $hUser['username'],
                    'hx_password' => $hUser['password']
                ];

                if ($userData['hx_username'] != '') {
                    // 数据库中存在 则先删除环信用户信息 再更新服务器环信用户信息 update()
                    $hx->deleteUser($userData['hx_username']); // 删除环信用户
                    $hx->createUsers($hUser); // 重新注册环信用户

                    // 在本地数据库中更新环信用户名/密码
                    $res = MemberModel::self()->updateUser($sUser, $userData['member_id']); // 更新数据
                }else {
                    // 数据库中不存在 则注册环信用户 add()
                    $hx->createUsers($hUser); // 注册环信用户

                    // 将环信用户名/密码保存到本地数据库
                    $res = MemberModel::self()->updateUser($sUser, $userData['member_id']); // 插入数据
                }
            }
        }

        return $res;
    }

    /**
     *
     * @desc andy-创建环信群组
     * @method post
     * @response
     */
    public function emchatCreateGroup($groupName, $owner, $groupDesc = '', $isPublic = 1, $maxUsers = 200, $members = [])
    {

        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $isPublic ? $isPublic = true : $isPublic = false;

        $options ['groupname'] = $groupName;
        $options ['desc'] = $groupDesc;
        $options ['public'] = $isPublic;
        $options['maxusers'] = $maxUsers;
        $options ['owner'] = $owner;
        $options['members'] = $members;
        $res = $hx->createGroup($options);

        if (isset($res['error'])) {
            // 建群组失败 返回失败信息
            return '';
        }else {
            return $res['data']['groupid'];
        }
    }

    /**
     *
     * @desc andy-更新环信群信息
     * @param $groupId
     * @param string $groupName
     * @param string $groupDesc
     * @return bool
     */
    public function emchatUpdateGroup($groupId, $groupName = '', $groupDesc = '')
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $options ['groupname'] = $groupName;
        $options ['description'] = $groupDesc;
        $res = $hx->modifyGroupInfo($groupId, json_encode($options));

        if (isset($res['error'])) {
            // 更新群组信息失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

    /**
     *
     * @desc andy-添加环信群成员
     * @param $groupId
     * @param $username
     * @return bool
     */
    public function emchatCreateGroupMember($groupId, $username)
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $res = $hx->addGroupMember($groupId, $username);

        if (isset($res['error'])) {
            // 添加群组成员失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

    /**
     *
     * @desc andy-移除环信群成员
     * @param $groupId
     * @param $username
     * @return bool
     */
    public function emchatRemoveGroupMember($groupId, $username)
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $res = $hx->addGroupMember($groupId, $username);

        if (isset($res['error'])) {
            // 移除群组成员失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

    /**
     *
     * @desc andy-添加环信群管理员
     * @param $groupId
     * @param $newAdmin
     * @return bool
     */
    public function emchatCreateGroupManager($groupId, $newAdmin)
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $options['newadmin'] = $newAdmin;

//        dump($options);die;
        $res = $hx->addGroupManager($groupId, json_encode($options));

        if (isset($res['error'])) {
            // 添加群组管理员失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

    /**
     *
     * @desc andy-移除环信群管理员
     * @param $groupId
     * @param $oldAdmin
     * @return bool
     */
    public function emchatRemoveGroupManager($groupId, $oldAdmin)
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $res = $hx->deleteGroupManager($groupId, $oldAdmin);

        if (isset($res['error'])) {
            // 移除群组管理员失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

    /**
     *
     * @desc andy-环信禁言用户
     * @param $groupId
     * @param $username
     * @param $muteDuration
     * @return bool
     */
    public function emchatForbiddenTalk($groupId, $username, $muteDuration = 3600)
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());

        $options = [
            'usernames' => $username,
            'mute_duration' => $muteDuration
        ];

        $res = $hx->addForbiddenTalk($groupId, json_encode($options));

        if (isset($res['error'])) {
            // 群组禁言用户失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

    /**
     *
     * @desc andy-环信取消禁言用户
     * @param $groupId
     * @param $username
     * @return bool
     */
    public function emchatDeleteForbiddenTalk($groupId, $username)
    {
        // 环信对象实例化
        $hx = new EasemobService($this->get_options());


        $res = $hx->deleteForbiddenTalk($groupId, $username);

        if (isset($res['error'])) {
            // 群组禁言用户失败 返回失败信息
            return false;
        }else {
            return true;
        }
    }

}
