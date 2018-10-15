<?php

namespace Manage\Model;

use Top\Model;

class Files extends Model {
    protected $table = 'files';
    protected $pk = 'id';
    protected $map = [];

    public function upload($filename) {
        if (file_exists($filename)) {
            $hash = md5_file($filename);
        }
        $file = $this->getFileByHash($hash);
        if (!empty($file)) {
            @unlink($filename);
            return [
                'id' => (int)$file['id'],
                'path' => $file['path']
            ];
        } else {
            $filename = ltrim($filename, '.');
            $data = [
                'path' => $filename,
                'hash' => $hash,
                'create_time' => time()
            ];
            if ($id = $this->insert($data)) {
                return [
                    'id' => $id,
                    'path' => $filename
                ];
            }
            $this->error = '文件上传失败';
            return false;
        }
    }

    public function getFileByHash($hash) {
        return $this->where(['hash' => $hash])->find();
    }
	
	public function getFileById($id) {
        return $this->where(['id' => $id])->find();
	}
}