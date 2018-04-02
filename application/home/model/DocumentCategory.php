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

namespace app\home\model;

use app\admin\service\ToolsService;
use think\Db;
use think\Model;

/**
 * 文章模型
 * Class Article
 * @package app\home\model
 * @author andy <290648237@qq.com>
 * @date 2017/6/15
 */
class DocumentCategory extends Model
{

    /**
     * 获取所有分类
     * @param $categoryID
     * @return array
     */
    public static function getCategoryList($categoryID)
    {
        $map = [];

        if(is_array($categoryID)) {
            $idd = '';
            foreach($categoryID as $item) {
                $category_ids = self::where('pid', $item)->column('id');

                if($category_ids) {
                    array_push($category_ids, $item);
                    $idd .= ','.implode(',', $category_ids); // 查找category_id （包括子分类）下的所有文章
                }else {
                    $idd[] = $categoryID; // 查找某一个最底层分类下的文章
                }
            }
            $idd = substr($idd, 1);
            $map['id'] = ['in', explode(',', $idd)];
        }else {
            $category_ids = self::where('pid', $categoryID)->column('id');
            if($category_ids) {
                array_unshift($category_ids, $categoryID);
                $map['id'] = ['in', $category_ids]; // 查找category_id （包括子分类）下的所有文章
            }else {
                $map['id'] = $categoryID; // 查找某一个最底层分类下的文章
            }
        }

        $data = db('document_category')->where($map)->select();
        $resData = ToolsService::arr2tree($data);
        return $resData;
    }

    /**
     * 根据分类父ID获取文章分类
     * @param $categoryID
     * @param int $limit
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getCategoryByID($categoryID, $limit = 0)
    {
        $data = self::where('pid', $categoryID)->order('sort asc')->limit($limit)->select();
        return $data;
    }


    /**
     * 根据分类ID获取分类条件
     * 获取该分类（包括子分类）下的所有文章
     * @param int $categoryID
     * @return mixed
     */
    public static function getCMapByCid($categoryID = 0) {
        $category_ids = self::where('pid', $categoryID)->column('id');
        if($category_ids) {
            array_unshift($category_ids, $categoryID);
            $map['category_id'] = ['in', $category_ids]; // 查找category_id （包括子分类）下的所有文章
        }else {
            $map['category_id'] = $categoryID; // 查找某一个最底层分类下的文章
        }

        return $map;
    }

    /**
     * 根据分类ID获取分类名称
     * @param int $categoryID 分类ID
     * @return mixed
     */
    public static function getCategoryNameByID($categoryID)
    {
        return self::where('id', $categoryID)->value('title');
    }

    public static function getCategoryInfoByID($categoryID)
    {
        $data = self::where('id', $categoryID)->find();
        if($data['pid']) {
            // 过滤一级分类
            if(self::hasSub($categoryID)) {
                $data['sub'] = self::getCategoryByID($categoryID);
            }
        }

        return $data;
    }

    public static function hasSub($categoryID)
    {
        $data = self::where('pid', $categoryID)->count();
        return $data ? true : false;
    }
}












