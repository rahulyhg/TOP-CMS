<?php

namespace Home\Controller;

use Top\Controller;

class Index extends Controller {

    public function index() {
        $this->params('message', 'Hello world !');
        $this->cache()->view();
    }

}
