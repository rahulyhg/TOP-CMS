<?php

namespace Home\Model;

use Top\Config;
use Top\Model;
use Top\Loader;

class Article extends Model {

    public function getContent($category, $id) {
        $categoryModel = Loader::get('\Manage\Model\Category');
        if (is_numeric($category)) {
            $categoryId = $categoryModel->getCategoryById($category, 'id')['id'];
        } else {
            $categoryId = $categoryModel->getCategoryByName($category, 'id')['id'];
        }
        if (!$categoryId) {
            $this->error = '分类不存在';
            return false;
        }
        $model = Loader::get('\Manage\Model\Article');
        $article = $model->getArticle($categoryId, ['id' => $id]);
        if (empty($article)) {
            $this->error = '文档不存在';
            return false;
        }
        return $article;
    }

    public function getSearchCategogry() {
        $ids = \Manage\Helper::Config('SEARCH_CATEGORY');
        $categoryArray = explode(',', $ids);
        return $categoryArray;
    }

    public function search($keywords, $category = '', $limit = false, $count = false) {
        $categoryArray = $this->getSearchCategogry();
        if (!in_array($category, $categoryArray)) {
            $this->error = '该分类无法被搜索~';
            return false;
        }
        $cate = (new Category())->category($category);
        $table = Loader::get('\Manage\Model\Category')->getTableNameByCategoryId($cate['id']);
        $model = new Model($table);
        $where = "category_id = $category and (title like '%{$keywords}%' or content like '%{$keywords}%')";
        if ($count) {
            $data = $model->where($where)->count();
        } else {
            $data = $model->where($where)->limit($limit)->select();
        }
        return $data;
    }
}