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
    'progress' => [
        null,
        'Home/Article/lists/category/progress'
    ],
    'culture' => [
        null,
        'Home/Article/detail/category/culture/id/5'
    ],
    'honor' => [
        null,
        'Home/Article/detail/category/honor/id/6'
    ],
    'customer' => [
        null,
        'Home/Article/detail/category/customer/id/7'
    ],
    'online' => [
        null,
        'Home/Article/detail/category/online/id/8'
    ],
    'contact' => [
        null,
        'Home/Article/index/category/contactus'
    ],
    'recruit' => [
        null,
        'Home/Article/lists/category/recruit'
    ]
];