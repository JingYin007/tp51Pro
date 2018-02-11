<?php
namespace app\cms\controller;
use app\common\model\NavMenus;
use think\facade\Session;

/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/23
 * Time: 15:54
 */
class Index{
    private $menuModel;
    public function __construct()
    {
        $this->menuModel = new NavMenus();
    }

    /**
     * 后台首页
     * @return \think\response\View
     */
    public function index(){
        Session::set('name','hahhaha');
        $test = Session::get('name');

        var_dump($test);


        $menuList = $this->menuModel->getNavMenusShow();
        $data = [
            'menus' => $menuList,
        ];
        return view('index',$data);
    }
    public function home(){
        return view('home');
    }
}