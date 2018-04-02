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

use think\Db;
use think\Model;

/**
 * 文章模型
 * Class Document
 * @package app\home\model
 * @author andy <290648237@qq.com>
 * @date 2017/6/15
 */
class Document extends Model
{

    /**
     * 获取文章列表API
     * @param int $page
     * @param int $size
     * @param string $sort
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getArticleList($page = 1, $size = 20, $sort = 'create_at desc', $categoryId = 0)
    {
        $map['d.status'] = 1;
        if($categoryId){
            $map['d.category_id'] = $categoryId;
        }

        $data = Db::view('document d', '*')
            ->view('document_article a', 'content', 'a.doc_id=d.id')
            ->where($map)
            ->page($page, $size)
            ->order($sort)
            ->select();

        if ($data) {
            foreach ($data as $key=>$item) {
                $data[$key]['image'] = get_url_with_domain($item['image']);
            }
        }

        return $data;
    }

    /**
     * 根据ID获取详情
     * @param int $id 文章ID
     * @return array|false|\PDOStatement|string|Model
     */
    public static function getArticleByID($id)
    {
        $data = Db::view('document d', '*')
            ->view('document_article a', 'content', 'a.doc_id=d.id')
            ->where('d.id', $id)
            ->find();

        if ($data) {
            $data['image'] = get_url_with_domain($data['image']);
        }
        return $data;
    }

    /**
     * 根据分类ID获取该分类下的文章
     * @param int $category_id 分类ID
     * @param int $page 页码
     * @param int $limit 数量
     * @param string $sort 排序规则
     * @return array
     */
    public static function getArticlesByCategoryID($category_id = 0, $page = 1, $limit = 5, $sort = 'create_at desc')
    {
        $map = [
            'status' => 1
        ];
        if($category_id) {
            $map['category_id'] = DocumentCategory::getCMapByCid((int)$category_id)['category_id'];
        }

        $data = self::where($map)->page($page, $limit)->order($sort)->select();
        $total = self::where($map)->count();

        $pageTotal = ceil($total/$limit);

        $cName = DocumentCategory::getCategoryNameByID($category_id);
        $resData = [
            'cid' => $category_id,
            'cName' => $cName,
            'list' => $data,
            'total' => $total,
            'pageTotal' => $pageTotal
        ];

        return $resData;
    }

    /**
     * 文章访问量+1
     * @param int $id 文章ID
     */
    public static function setViewInc($id)
    {
        self::where('id', $id)->setInc('view');
    }

    /**
     * 获取上一篇/下一篇
     * @param int $id
     * @return array
     */
    public static function getFrontAfterArticles($id = 0){

        $previous = [];
        $next = [];

        if($id){
            //上一篇
            $previous = self::where("id<".$id)->order('id desc')->limit('1')->find();

            //下一篇
            $next = self::where("id>".$id)->order('id desc')->limit('1')->find();


        }else{
            self::getError('新闻ID错误');
        }

        return [$previous, $next];
    }

    /**
     * 获取推荐文章列表
     * @param int $page
     * @param int $size
     * @param string $sort
     * @param int $categoryId
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getRecommendArticles($page = 1, $size = 5, $sort = 'view desc,create_at desc', $categoryId = 0)
    {

        $map = [
            'd.status' => 1,
            'd.is_top' => 1
        ];

        // 根据分类ID获取推荐文章
        if ($categoryId) {
            $map['d.category_id'] = $categoryId;
        }

        $data = Db::view('document d', '*')
            ->view('document_article a', 'content', 'a.doc_id=d.id')
            ->where($map)
            ->page($page, $size)
            ->order($sort)
            ->select();

        if ($data) {
            foreach ($data as $key=>$item) {
                $data[$key]['image'] = get_url_with_domain($item['image']);
            }
        }

        return $data;
    }



}












