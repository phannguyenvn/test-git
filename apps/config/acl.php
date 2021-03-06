<?php

/**
 * acl.php 26/10/2015
 * ----------------------------------------------
 *
 * @author      Phan Nguyen <phannguyen2020@gmail.com>
 * @copyright   Copyright (c) 2015, framework
 *
 * ----------------------------------------------
 * All Rights Reserved.
 * ----------------------------------------------
 */
return [
    'guest' => [
        'Site' => [
            'index' => '*',
            'error' => '*',
            'login' => '*'
        ],
        'Admin' => [
            'login' => '*'
        ]
    ],
    'member' => [
        'Site' => [
            'index' => '*',
            'error' => '*'
        ],
        'Admin' => [
            'login' => '*'
        ]
    ],
    'admin' => [
        'Site' => [
            'index' => '*',
            'error' => '*'
        ],
        'Admin' => [
            'index' => '*',
            'user' => '*',
            'login' => '*',
            'generator' => '*'
        ]
    ]
];
