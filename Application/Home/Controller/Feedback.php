<?php

namespace Home\Controller;

use Vendor\Verify;

class Feedback extends Common {

    public function index() {
        if (request()->isPost()) {
            $code = $_POST['code'];
            if (strtolower($code) != session('verify_code')) {
                $this->error('验证码输入错误');
            }
            $model = new \Home\Model\Feedback();
            if ($model->add()) {
                $this->success('留言成功,我们会尽快和您取得联系');
            } else {
                $this->error($model->getError());
            }
        }
    }

    public function verify() {
        $code = new Verify(4, 2, 40, 100);
        session('verify_code', strtolower($code->getCode()));
        $code->outImage();
    }
}