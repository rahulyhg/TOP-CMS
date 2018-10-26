<?php

namespace Home\Controller;

use Top\Loader;

class Words extends Common {

    public function index() {
        $model = Loader::get('\Home\Model\Words');
        if ($model->add()) {
            $this->showJson('留言成功,我们会尽快联系您', 1);
        }
        $this->showJson($model->getError());
    }
}