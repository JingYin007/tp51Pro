<?php
namespace app\cms\controller;
use app\common\model\Admins;
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
    private $adminModel;
    public function __construct()
    {
        $this->menuModel = new NavMenus();
        $this->adminModel = new Admins();
    }

    /**
     * 后台首页
     * @return \think\response\View
     */
    public function index(){
        $cmsAID = Session::get('cmsAID');
        if (!$cmsAID){
            header('Location:http://tp51pro.com/cms/login/index');die;
        }
        $menuList = $this->menuModel->getNavMenusShow($cmsAID);
        $adminInfo = $this->adminModel->getAdminData($cmsAID);
        $data = [
            'menus' => $menuList,
            'admin' => $adminInfo,
        ];
        return view('index',$data);
    }
    public function home(){
        return view('home');
    }
}