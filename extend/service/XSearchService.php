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

namespace service;

/**
 * Excel 讯搜服务类
 * Class XSearchService
 * @package service
 * @author andy <290648237@qq.com>
 * @date 2017/8/21
 */
class XSearchService
{

    private $_xindex;

    private $_xsearch;

    private $_project;

    public function __construct($project)
    {
        // 引入xunsearch入口文件
//        require_once dirname(__FILE__).'/../xunsearch/sdk/php/lib/XS.php';
        vendor('xunsearch.sdk.php.lib.XS');

        //初始化
        $xs = new \XS($project);

        $this->_project = $project;
        $this->_xindex = $xs->index;
        $this->_xsearch = $xs->search;
        $this->_xsearch->setCharset('UTF-8');
        $this->_xsearch->setFuzzy();
        $this->_xsearch->setAutoSynonyms();

    }


    /**
     * 清空索引
     */
    public function clearIndex()
    {

        $this->_xindex->clean();
    }


    /**
     * 增加内容
     * @param $data
     * @param int $update
     */
    public function index($data, $update = 0)
    {

        // 创建文档对象

        $doc = new \XSDocument;
        $doc->setFields($data);

        // 添加或更新到索引数据库中
        if (!$update) {
            $this->_xindex->add($doc);
        } else {
            $this->_xindex->update($doc);
        }
    }


    public function SetSearchOrder($fields, $reverse = false)
    {
        $this->_xsearch->setMultiSort($fields, $reverse);
    }


    /**
     * 全文检索关键字
     * @param string $keyWord 关键字
     * @param int $row 需返回数据行数
     * @param int $jnum 跳过前多少行
     * @return array
     */
    public function SmartSearch($keyWord, $row = 20, $jnum = 0)
    {

        $this->_xsearch->setQuery($keyWord); //支持同义词搜索，默认打开
        $this->_xsearch->setLimit($row, $jnum); //设置返回结果最多为 5 条，并跳过前 10 条
        $docs = $this->_xsearch->search(); //执行搜索，将搜索结果文档保存在 $docs 数组中
        $count = $this->_xsearch->count(); //获取搜索结果的匹配总数估算值
        if ($count <= 0) {
            //没有找到结果，就启用搜索建议，并返回搜索建议的第一个搜索结果
            $Words = $this->_xsearch->getExpandedQuery($keyWord);

            if (is_array($Words) && !empty($Words)) {
                $this->_xsearch->setQuery($Words[0]); //支持同义词搜索，默认打开
            } else {
                $this->_xsearch->setQuery('美国');
            }
            $this->_xsearch->setLimit($row, $jnum); //设置返回结果最多为 5 条，并跳过前 10 条
            $docs = $this->_xsearch->search(); //执行搜索，将搜索结果文档保存在 $docs 数组中
            $count = $this->_xsearch->count(); //获取搜索结果的匹配总数估算值

        }
        return array($docs, $count);
    }

    /**
     * 精确搜索
     * @param $keyWord
     * @param int $row
     * @param int $jnum
     * @return array
     */
    public function exactSearch($keyWord, $row = 20, $jnum = 0)
    {
        $this->_xsearch->setFuzzy(false);
        $this->_xsearch->setQuery($keyWord); //支持同义词搜索，默认打开
        $this->_xsearch->setLimit($row, $jnum); //设置返回结果最多为 $row 条，并跳过前 $jnum 条
        $docs = $this->_xsearch->search(); //执行搜索，将搜索结果文档保存在 $docs 数组中
        $count = $this->_xsearch->count(); //获取搜索结果的匹配总数估算值

        return array($docs, $count);
    }

    /**
     * 获取搜索建议
     * @param $keyWord
     * @param $num
     * @return array
     */
    public function getSuggest($keyWord, $num)
    {
        $data = $this->_xsearch->getExpandedQuery($keyWord);
        foreach ($data as $key => $value) {
            if ($key <= $num) {
                $resData[] = $value;
            }

        }
        return $resData;
    }


}

?>