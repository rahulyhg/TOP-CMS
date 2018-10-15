<?php

namespace Home;


use Top\Loader;

class Helper {

    public static function getCategory($category = 0) {
        $model = Loader::get('\Manage\Model\Category');
        if (!is_numeric($category)) {
            $category = $model->field('id')->where(['category_name' => $category])->find()['id'];
        }
        return $model->getTree($category);
    }

    public static function getCategoryName($category = 0) {
        $model = Loader::get('\Manage\Model\Category');
        return $model->getCategoryById($category, 'category_title')['category_title'];
    }

    public static function getNavi($pid = 0) {
        $model = Loader::get('\Manage\Model\Channel');
        return $model->lists(['pid' => $pid]);
    }

}