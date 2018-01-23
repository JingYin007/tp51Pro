<?php
namespace app\cms\controller;
use app\common\model\NavMenus;

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