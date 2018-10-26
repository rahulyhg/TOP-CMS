<?php

namespace Home;


use Top\Loader;

class Helper {

    public static function getCategory($category = 0) {
        $model = Loader::get('\Manage\Model\Category');
        $data = $model->where(['pid' => $category])->select();
        return $data;
    }

    public static function getCategoryName($category = 0) {
        $model = Loader::get('\Manage\Model\Category');
        return $model->getCategoryById($category, 'title')['title'];
    }

    public static function getNavi($pid = 0) {
        $model = Loader::get('\Manage\Model\Channel');
        return $model->lists(['pid' => $pid]);
    }

    public static function getArticleLists($categoryName, $limit, $child = false) {
        // 当前所属分类信息
        $categoryModel = Loader::get('\Home\Model\Category');
        if ($child) {
            $category = $categoryModel->category($categoryName);
            $idsArray = $categoryModel->field('id')->where(['pid' => $category['id']])->select();
            $ids = [];
            for ($i = 0; $i < count($idsArray); $i++) {
                $ids[$i] = $idsArray[$i]['id'];
            }
        } else {
            $ids = $categoryModel->category($categoryName)['id'];
        }
        // 内容列表
        $lists = $categoryModel->lists($ids, 'level desc, create_time desc', $limit);
        return $lists;
    }

    public static function getPrevArticle($categoryId, $id, $default = '没有了') {
        $model = Loader::get('\Manage\Model\Article');
        $article = $model->getArticle($categoryId, 'id > ' . $id . ' and category_id = ' . $categoryId);
        if (empty($article)) {
            return [
                'url' => 'javascript:;',
                'title' => $default
            ];
        }
        $article['url'] = u('detail', [$categoryId, $article['id']]);
        return $article;

    }

    public static function getNextArticle($categoryId, $id, $default = '没有了') {
        $model = Loader::get('\Manage\Model\Article');
        $article = $model->getArticle($categoryId, 'id < ' . $id . ' and category_id = ' . $categoryId);
        if (empty($article)) {
            return [
                'url' => 'javascript:;',
                'title' => $default
            ];
        }
        $article['url'] = u('detail', [$categoryId, $article['id']]);
        return $article;
    }

    public static function getArticle($categoryId, $id) {
        $model = Loader::get('\Manage\Model\Article');
        $article = $model->getArticle($categoryId, ['id' => $id]);
        return $article;
    }

}