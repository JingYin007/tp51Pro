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
Route::get('/','index/index/index');
Route::rule('app','index/index/index');
Route::get('article/:id','index/index/article');
Route::get('/index/review','index/index/review');
Route::get('/index/contact','index/index/contact');

/**
 * 后台 CMS配置
 */
Route::rule('cmsx','cms/index/index');
Route::get('cms/index/index','cms/index/index');
Route::get('cms/home','cms/index/home');
Route::any('cms/index/admin/:id','cms/index/admin');


Route::get('cms/menu/index','cms/navMenu/index');
Route::any('cms/menu/add','cms/navMenu/add');
Route::any('cms/menu/edit/:id','cms/navMenu/edit');
Route::any('cms/menu/auth/:id','cms/navMenu/auth');
Route::post('cms/menu/ajaxOpForPage','cms/navMenu/ajaxOpForPage');


Route::get('cms/todayWord/index','cms/todayWord/index');
Route::any('cms/todayWord/add','cms/todayWord/add');
Route::any('cms/todayWord/edit/:id','cms/todayWord/edit');
Route::post('cms/todayWord/ajaxOpForPage','cms/todayWord/ajaxOpForPage');

Route::get('cms/article/index','cms/article/index');
Route::any('cms/article/add','cms/article/add');
Route::any('cms/article/edit/:id','cms/article/edit');
Route::post('cms/article/ajaxOpForPage','cms/article/ajaxOpForPage');


Route::any('cms/admin/index','cms/admin/index');
Route::any('cms/admin/add','cms/admin/add');
Route::any('cms/admin/edit/:id', 'cms/admin/edit');
Route::post('cms/admin/ajaxOpForPage', 'cms/admin/ajaxOpForPage');

Route::any('cms/admin/role','cms/admin/role');
Route::any('cms/admin/addRole','cms/admin/addRole');
Route::any('cms/admin/editRole/:id', 'cms/admin/editRole');

Route::get('cms/login/index','cms/login/index');
Route::any('cms/login/logout','cms/login/logout');
Route::post('cms/login/ajaxLogin','cms/login/ajaxLogin');
Route::post('cms/login/ajaxCheckLoginStatus','cms/login/ajaxCheckLoginStatus');


/**
 * 工具类
 */
Route::post('api/upload/img_file','api/upload/img_file');
Route::any('api/upload/test','api/upload/test');

/**
 * Uni API 接口类，用于 uniApp 开发学习
 */
Route::any('uniapi/getArticleList','uniapi/index/getArticleList');
Route::any('uniapi/article','uniapi/index/getArticleInfo');







