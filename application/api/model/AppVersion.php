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

use think\Model;

/**
 * App版本模型
 * Class Feedback
 * @package app\api\model
 * @author andy <290648237@qq.com>
 * @date 2017/8/3
 */
class AppVersion extends Model
{

    /**
     * 获取最新版本
     * @param $version
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getLatestVersion($version = 0)
    {
        $map = [
            'status' => 1
        ];

        $latestVersion = self::where($map)->order('create_at desc')->find();
        if ($latestVersion) {
            $latestVersion['url'] = get_url_with_domain($latestVersion['url']);
        }

        if ($version) {
            // App请求
            if ($latestVersion['version'] > $version) {
                // App端请求 如果有新的版本

                return $latestVersion;
            }else {
                return [];
            }
        }else {
            // PC 请求
            return $latestVersion;
        }

    }
}
