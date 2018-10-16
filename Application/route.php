<?php
// 自定义路由规则

return [
    'detail' => [
        '[category][:id]',
        'Home/Article/detail'
    ],
	'manage' => [
		null,
		'Manage'
	]

];