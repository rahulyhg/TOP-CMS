<?php

namespace Home\Model;

use Top\Model;
use Top\Loader;

class Article extends Model {

    public function getContent($categoryName, $id) {
        $categoryModel = Loader::get('\Manage\Model\Category');
        $categoryId = $categoryModel->getCategoryByName($categoryName, 'id')['id'];
        if (!$categoryId) {
            $this->error = '分类不存在';
            return false;
        }
        $model = Loader::get('\Manage\Model\Article');
        $article = $model->getContentById($categoryId, $id);
        if (empty($article)) {
            $this->error = '文档不存在';
            return false;
        }
        return $article;
    }
}