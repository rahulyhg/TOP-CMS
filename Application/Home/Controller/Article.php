<?php

namespace Home\Controller;

use Top\Loader;
use Vendor\Page;

class Article extends Common {

    /**
     * 频道页
     * @param string $category
     */
    public function index($category = '') {
        // 当前所属分类信息
        $categoryModel = Loader::get('\Home\Model\Category');
        $category = $categoryModel->category($category);
        if (empty($category)) {
            $this->error($categoryModel->getError());
        }
        $this->params('category', $category);
        $this->cache()->view($category['index_template']);
    }

    /**
     * 列表页
     * @param string $category
     */
    public function lists($category = '') {
        // 当前所属分类信息
        $categoryModel = Loader::get('\Home\Model\Category');
        $category = $categoryModel->category($category);
        if (empty($category)) {
            $this->error($categoryModel->getError());
        }
        // 内容列表
        $total = $categoryModel->lists($category['id'], false, false, true);
        $page = new Page($category['list_row'], $total);
        $order = 'level desc, create_time desc';
        $lists = $categoryModel->lists($category['id'], $order, "$page->startNum, $page->listNum");
        $this->params('page', $page->homeShow());
        $this->params('lists', $lists);
        $this->params('category', $category);
        $this->cache()->view($category['list_template']);
    }

    /**
     * 详情页
     * @param string $category
     * @param string $id
     */
    public function detail($category = '', $id = '') {
        $id = (int)((!$id) ? $_GET['id'] : $id);
        $category = (!$category) ? $_GET['category'] : $category;
        // 当前所属分类信息
        $categoryModel = Loader::get('\Home\Model\Category');
        $categoryInfo = $categoryModel->category($category);
        // 当前文章内容
        $article = Loader::get('\Home\Model\Article');
        $info = $article->getContent($category, $id);
        // 文章不存在处理
        if ($info === false) {
            $this->error($article->getError());
        }
        // 当前所属分类配置的详情模板
        $categoryTemplate = $categoryInfo['detail_template'];
        // 如果当前文档单独配置了详情模板则优先使用
        $template = (!$categoryTemplate) ? $info['detail_template'] : $categoryTemplate;
        $this->params('category', $categoryInfo);
        $this->params('info', $info);
        $this->cache()->view($template);
    }

    public function search($keywords = '', $category = '') {
        $keywords = $this->filter($keywords);
        $model = Loader::get('\Home\Model\Article');
        $categorys = $model->getSearchCategogry();
        if (!$category) $category = $categorys[0];
        // $page = new Page(2, $model->search($keywords, $category, false, true));
        $lists = $model->search($keywords, $category);
        // $this->params('page', $page->show());
        $this->params('category_id', $category);
        $this->params('keywords', $keywords);
        $this->params('categorys', $categorys);
        $this->params('lists', $lists);
        $this->view();
    }
}