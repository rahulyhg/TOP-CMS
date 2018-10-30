<?php
// 自定义路由规则

return [
    'detail' => [
        '[category][id]',
        'Home/Article/detail'
    ],
    'index' => [
        null,
        'Home/Index/index'
    ],
    'lists' => [
        '[category]',
        'Home/Article/lists'
    ],
    'all' => [
        '[category]',
        'Home/Article/all'
    ],
    'page' => [
        '[category]',
        'Home/Article/index'
    ],
    'search' => [
        '[keywords][:category]',
        'Home/Article/search'
    ],
	'manage' => [
		null,
		'Manage'
	],
    'login' => [
        null,
        'Manage/Auth/index'
    ],

    // 其他新增路由

    'synopsis' => [
        null,
        'Home/Article/detail/category/synopsis/id/1'
    ],
    'contact' => [
        null,
        'Home/Article/detail/category/contact/id/2'
    ],
    'environment' => [
        null,
        'Home/Article/lists/category/environment'
    ],
    'news' => [
        null,
        'Home/Article/lists/category/news'
    ],
    'search' => [
        '[keywords]',
        'Home/Article/search'
    ],
    'words' => [
        null,
        'Home/Words/index'
    ]
];