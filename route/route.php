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

//后台导航菜单管理
Route::get('cms/menu/index','cms/navMenu/index');
Route::any('cms/menu/add','cms/navMenu/add');
Route::any('cms/menu/edit/:id','cms/navMenu/edit');
Route::any('cms/menu/auth/:id','cms/navMenu/auth');
Route::post('cms/menu/ajaxOpForPage','cms/navMenu/ajaxOpForPage');

//今日赠言管理
Route::get('cms/todayWord/index','cms/todayWord/index');
Route::any('cms/todayWord/add','cms/todayWord/add');
Route::any('cms/todayWord/edit/:id','cms/todayWord/edit');
Route::post('cms/todayWord/ajaxOpForPage','cms/todayWord/ajaxOpForPage');

//文章管理
Route::get('cms/article/index','cms/article/index');
Route::any('cms/article/add','cms/article/add');
Route::any('cms/article/edit/:id','cms/article/edit');
Route::post('cms/article/ajaxOpForPage','cms/article/ajaxOpForPage');

//管理员
Route::any('cms/admin/index','cms/admin/index');
Route::any('cms/admin/add','cms/admin/add');
Route::any('cms/admin/edit/:id', 'cms/admin/edit');
Route::post('cms/admin/ajaxOpForPage', 'cms/admin/ajaxOpForPage');

//角色管理
Route::any('cms/admin/role','cms/admin/role');
Route::any('cms/admin/addRole','cms/admin/addRole');
Route::any('cms/admin/editRole/:id', 'cms/admin/editRole');

//后台登录管理
Route::get('cms/login/index','cms/login/index');
Route::any('cms/login/logout','cms/login/logout');
Route::post('cms/login/ajaxLogin','cms/login/ajaxLogin');
Route::post('cms/login/ajaxCheckLoginStatus','cms/login/ajaxCheckLoginStatus');

/**
 * 网站业务
 */

//分类管理
Route::get('cms/category/index','cms/category/index');
Route::any('cms/category/add','cms/category/add');
Route::any('cms/category/edit/:id','cms/category/edit');
Route::post('cms/category/ajaxOpForPage','cms/category/ajaxOpForPage');
Route::post('cms/category/ajaxForShow','cms/category/ajaxForShow');

//商品管理
Route::get('cms/goods/index','cms/goods/index');
Route::any('cms/goods/add','cms/goods/add');
Route::any('cms/goods/edit/:id','cms/goods/edit');
Route::post('cms/goods/ajaxOpForPage','cms/goods/ajaxOpForPage');
Route::post('cms/goods/ajaxPutaway','cms/goods/ajaxPutaway');
Route::post('cms/goods/ajaxDelUploadImg','cms/goods/ajaxDelUploadImg');
Route::post('cms/goods/ajaxGetCatGoodsForActivity','cms/goods/ajaxGetCatGoodsForActivity');

//属性管理
Route::get('cms/specInfo/index','cms/specInfo/index');
Route::any('cms/specInfo/add','cms/specInfo/add');
Route::any('cms/specInfo/edit/:id','cms/specInfo/edit');
Route::post('cms/specInfo/ajaxOpForPage','cms/specInfo/ajaxOpForPage');
Route::post('cms/specInfo/ajaxGetSpecInfoFstByCat','cms/specInfo/ajaxGetSpecInfoFstByCat');
Route::post('cms/specInfo/ajaxGetSpecInfoBySpecFst','cms/specInfo/ajaxGetSpecInfoBySpecFst');

//活动管理
Route::get('cms/activity/index','cms/activity/index');
Route::any('cms/activity/add','cms/activity/add');
Route::any('cms/activity/edit/:id','cms/activity/edit');
Route::post('cms/activity/ajaxOpForPage','cms/activity/ajaxOpForPage');
Route::post('cms/activity/ajaxForShow','cms/activity/ajaxForShow');

//用户管理
Route::get('cms/users/index','cms/users/index');
Route::post('cms/users/ajaxOpForPage','cms/users/ajaxOpForPage');
Route::post('cms/users/ajaxUpdateUserStatus','cms/users/ajaxUpdateUserStatus');





/**
 * 工具类
 */
Route::post('api/upload/img_file','api/upload/img_file');
Route::any('api/upload/test','api/upload/test');

/**
 * Uni API 接口类，用于 uniApp 开发学习
 */
Route::any('uniapi/getArticleList','uniapi/index/getArticleList');
Route::post('uniapi/article','uniapi/index/getArticleInfo');







