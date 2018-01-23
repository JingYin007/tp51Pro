<?php
namespace app\cms\controller;
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/23
 * Time: 15:54
 */
class Index{
    public function __construct()
    {
    }

    /**
     * 后台首页
     * @return \think\response\View
     */
    public function index(){
        $data = [
            'menus' => [],
        ];
        return view('index',$data);
    }
    public function home(){
        return view('home');
    }
}