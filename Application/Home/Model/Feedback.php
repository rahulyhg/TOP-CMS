<?php

namespace Home\Model;

use Top\Model;

class Feedback extends Model {
    protected $table = 'feedback';
    protected $pk = 'id';
    protected $map = [
        'username' => 'name',
        'mobile' => 'tel'
    ];

    public function add() {
        $data = $this->getData();
        if (!$data['title']) {
            $this->error = '请输入标题';
            return false;
        }
        if (!$data['name']) {
            $this->error = '请输入姓名';
            return false;
        }
        if (!$data['email']) {
            $this->error = '请输入邮箱';
            return false;
        }
        if (!$data['tel'] || mb_strlen($data['tel']) < 11) {
            $this->error = '手机号码格式不正确';
            return false;
        }
        $data['category_id'] = 29;
        $data['level'] = 0;
        $saveData = [];
        foreach ($data as $k => $v) {
            $saveData[$k] = $this->filter($v);
        }
        if ($this->insert($saveData)) {
            return true;
        }
        $this->error = '留言失败';
        return false;
    }
}