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

namespace app\admin\controller;

use app\admin\service\DataService;
use app\admin\service\ToolsService;
use think\Db;

/**
 * 内容管理
 * Class Document
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/6/13
 */
class Document extends BasicAdmin
{

    /**
     * 指定文档表
     * @var string
     */
    protected $table = 'Document';

    /**
     * 指定文档内容表
     * @var string
     */
    protected $articleTable = 'DocumentArticle';

    /**
     * 指定文章分类表
     * @var string
     */
    protected $categoryTable = 'DocumentCategory';

    /**
     * 指定文档标签表
     * @var string
     */
    protected $tagsTable = 'DocumentTags';

    /***************************** 文章分类管理 *****************************/

    /**
     * 文章分类管理
     */
    public function category()
    {
        $this->title = '文章分类管理';
        $db = Db::name($this->categoryTable)->order('sort asc, id asc');
        parent::_list($db, false);
    }

    /**
     * 文章分类 列表数据处理
     * @param array $data
     */
    protected function _category_data_filter(&$data)
    {
        foreach ($data as &$vo) {
            $vo['ids'] = join(',', ToolsService::getArrSubIds($data, $vo['id']));
        }
        $data = ToolsService::arr2table($data);
    }

    /**
     * 添加、编辑文章分类
     */
    public function addCategory() {
        return $this->_form($this->categoryTable, 'categoryform');
    }

    /**
     * 文档分类 表单数据前缀方法
     * @param array $vo
     */
    protected function _addCategory_form_filter(&$vo) {
        $this->_article_form_filter($vo);
    }



    /**
     * 删除文章分类
     */
    public function delCategory() {
        if (DataService::update($this->categoryTable)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /***************************** 文档内容管理 *****************************/

    /**
     * 文章列表
     */
    public function article()
    {
        $this->title = '文章管理';
        $get = $this->request->get();

        // 根据分类搜索文章
        if(isset($get['cid']) && $get['cid'] !== '' && $get['cid'] != '-1') {
            $cateIds = $this->_searchByCategory($get['cid']);
            if($cateIds !== '') {
                $db = Db::name($this->table)->where('category_id', 'in', $cateIds);
            }else {
                $db = Db::name($this->table)->where('category_id', $get['cid']);
            }
        }else {
            // 实例Query对象
            $db = Db::name($this->table);
        }

        // 应用搜索条件
        foreach (['title', 'status', 'is_top'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                $db->where($key, 'like', "%{$get[$key]}%");
            }
        }

        // 文章分类名称
        $data = parent::_list($db, true, false);
        foreach($data['list'] as $key=>$list) {
            $data['list'][$key]['cname'] = Db::name($this->categoryTable)->where('id', $list['category_id'])->value('title');
        }

        // 获取文章分类
        $menus = $this->_getDocumentCategory();
        $this->assign('menus', $menus);

        return $this->fetch('', $data);
    }

    /**
     * 根据文章分类搜索
     * @param int $cid 商品分类id
     * @return array|string
     */
    private function _searchByCategory($cid) {
        $cateData = Db::name($this->categoryTable)->where('pid', $cid)->field('id')->select();
        $cateIds = [];
        foreach ($cateData as $cate) {
            $cateIds[] = $cate['id'];

        }
        $cateIds = implode(',', $cateIds);
        return $cateIds;
    }

    /**
     * 获取文章分类 辅助方法
     * @return array
     */
    private function _getDocumentCategory() {
        // 文章分类处理
        $_menus = Db::name($this->categoryTable)->order('sort asc,id asc')->select();
//        $_menus[] = ['name' => '顶级分类', 'id' => '0', 'pid' => '-1'];
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

    /**
     * 添加文章
     * @return array|string
     */
    public function add()
    {
        $params = $this->request->param();

        if ($this->request->isPost()) {
            unset($params['spm']);

            $vo = $params;
            // 提交
            if(isset($vo['id'])) {
                // document_tags 删除所有文章标签 重新添加
                db($this->tagsTable)->where('doc_id', $vo['id'])->delete();

                // 更新
                unset($vo['tags'], $vo['content']);
                $vo['update_at'] = time();

                // 更新document表
                db($this->table)->update($vo);

                // 更新document_article表
                db('document_article')->update(['doc_id' => $vo['id'], 'content' => $params['content']]);


                $doc_id = $vo['id'];

            }else {
                unset($vo['tags'], $vo['content']);

                $vo['create_at'] = time();
                // 插入document表
                $doc_id = db($this->table)->insertGetId($vo);

                // 插入document_article表
                db('document_article')->insert(['doc_id' => $doc_id, 'content' => $params['content']]);

            }

            // 处理标签
            if($params['tags'] != '') {
                $tags = explode(',', $params['tags']);

                foreach ($tags as $tag) {
                    $tagName = Db::name('tags')->where('name', $tag)->value('name');
                    // 如果标签不存在 则将此标签加入标签表
                    if($tagName == null){
                        DataService::save(db('tags'), ['name' => $tag]);
                    }
                    $tag_id = db('tags')->where('name', $tag)->value('id');
                    // 插入 document_tags表
                    db($this->tagsTable)->insert(['doc_id' => $doc_id, 'tag_id' => $tag_id]);
                }
            }

            $doc_id !== false ? $this->success('恭喜，保存成功哦！', url('/').'admin.html#'.url('article').'?spm='.$this->spm) : $this->error('保存失败，请稍候再试！');
        }else {
            // 显示
            $data = [];
            if(isset($params['id'])) {
                $title = '编辑文章';
                $data = db($this->table)->find($params['id']);
                $data['content'] = db('document_article')->where('doc_id', $params['id'])->value('content');

                // 获取标签
                $tags = db($this->tagsTable)->where('doc_id', $params['id'])->select();
                if($tags) {
                    // 存在标签
                    foreach ($tags as $tag) {
                        $resultTags[] = db('tags')->where('id', $tag['tag_id'])->value('name');
                    }
                    $data['tags'] = implode(',', $resultTags);
                }
            }else {
                $title = '新增文章';
            }

            // 上级分类处理
            $_menus = Db::name($this->categoryTable)->order('sort asc,id asc')->select();
            $_menus[] = ['title' => '顶级分类', 'id' => '0', 'pid' => '-1'];
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

            $this->assign('menus', $menus);
            $this->assign('title', $title);

            return $this->fetch('articleform', ['vo' => $data]);
        }
    }

    /**
     * 文章分类 表单数据前缀方法
     * @param array $vo
     */
    protected function _article_form_filter(&$vo) {
        if ($this->request->isGet()) {
            // 上级分类处理
            $_menus = Db::name($this->categoryTable)->order('sort asc,id asc')->select();
            $_menus[] = ['title' => '顶级分类', 'id' => '0', 'pid' => '-1'];
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

            $this->assign('menus', $menus);
        }
    }

    /**
     * 删除文章
     */
    public function del() {
        $doc_id = $this->request->param('id');

        if (DataService::update($this->table)) {
            DataService::update($this->articleTable, ['doc_id' => $doc_id]); // 删除内容
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }

    /**
     * 文章 待审核 0
     */
    public function forbid() {
        if (DataService::update($this->table)) {
            $this->success("状态改为待审核成功！", '');
        }
        $this->error("状态改为待审核失败，请稍候再试！");
    }

    /**
     * 文章 已审核 1
     */
    public function resume() {
        if (DataService::update($this->table)) {
            $this->success("状态改为已审核成功！", '');
        }
        $this->error("状态改为已审核失败，请稍候再试！");
    }

    /**
     * 文章 取消推荐 0
     */
    public function unRecommend() {
        if (DataService::update($this->table)) {
            $this->success("取消推荐成功！", '');
        }
        $this->error("取消推荐失败，请稍候再试！");
    }

    /**
     * 文章 推荐置顶 1
     */
    public function recommend() {
        if (DataService::update($this->table)) {
            $this->success("推荐置顶成功！", '');
        }
        $this->error("推荐置顶失败，请稍候再试！");
    }


    /**
     * 文章标签搜索建议 ajax
     *
     * @return \think\response\Json
     */
    public function tagSuggest()
    {
        $db = Db::name('tags');

        $keyword = $this->request->get('q');

        // 应用搜索条件
        $db->where('name', 'like', "%{$keyword}%");

        // 文章分类名称
        $data = parent::_list($db, true, false);

        $suggest = [];
        foreach($data['list'] as $vo) {
            $suggest[] = $vo['name'];
        }
        $result = [
            'results' => $suggest
        ];
        return json($result);
    }


}
