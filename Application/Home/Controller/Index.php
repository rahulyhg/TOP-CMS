<?php

namespace Home\Controller;

use Top\Controller;

class Index extends Controller {

    public function index() {
        $this->cache()->view();
    }

}
