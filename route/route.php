<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
/**
 * 前台页面
 */
Route::get('/','index');
Route::get('test','index/index/test');
Route::get('article/:id','index/index/article');
Route::get('/index/review','index/index/review');
Route::get('/index/contact','index/index/contact');


/**
 * 后台 CMS配置
 */
Route::get('cms/index','cms/index/index');
Route::get('cms/home','cms/index/home');
Route::get('cms/todayWord/index','cms/todayWord/index');
Route::any('cms/todayWord/add','cms/todayWord/add');
Route::any('cms/todayWord/edit/:id','cms/todayWord/edit');
Route::post('cms/todayWord/ajaxOpForPage','cms/todayWord/ajaxOpForPage');



/**
 * 工具类
 */
Route::post('api/upload/img_file','api/upload/img_file');











