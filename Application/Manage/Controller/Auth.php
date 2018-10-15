<?php

namespace Manage\Controller;

use Top\Controller;
use Top\Loader;

class Auth extends Controller {

    public function index() {
        if (request()->isPost()) {
            $username = $this->filter($_POST['name']);
            $password = $this->filter($_POST['psw']);
            $model = Loader::get('\Manage\Model\Auth');
            $uid = $model->login($username, $password);
            if ($uid > 0) {
                $this->showJson('登录成功，正在跳转...', 1, ['url' => u('Manage/Index')]);
            }
            $this->showJson($model->getError());
        } else {
            $this->load();
        }
    }

    public function logout() {
        session('user_auth', 0);
        $this->redirect('Manage/Auth');
    }
}