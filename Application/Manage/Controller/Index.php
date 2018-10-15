<?php

namespace Manage\Controller;

use Top\Loader;

class Index extends Manage {

    public function index() {
        $menu = Loader::get('\Manage\Model\Menu');
        $menuList = $menu->lists(['pid' => 0]);
        $this->params('rules', $this->userRules);
        $this->params('menu_list', $menuList);
        $this->load();
    }

    public function welcome() {
        $this->load('', [
            'info' => '欢迎使用'
        ]);
    }

    public function clear() {
        remove_dir('./Temps/');
        $this->showJson('缓存清除成功', 1);
    }
}