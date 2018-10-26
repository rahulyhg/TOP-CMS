<?php

namespace Home\Model;

use Top\Model;

class Words extends Model {
    protected $table = 'words';
    protected $pk = 'id';
    protected $map = [
        'tel' => 'mobile'
    ];

    public function add() {
        $data = $this->getData();
        $save = [];
        foreach ($data as $key=>$value) {
            if (!$value) {
                $this->error = '请完整填写表单';
                return false;
            }
            $save[$key] = $this->filter($value);
        }
        $save['level'] = 0;
        $save['category_id'] = 62;
        $save['create_time'] = time();
        if ($this->insert($save)) {
            return true;
        }
        $this->error = '留言失败';
        return false;
    }

}