<?php
namespace app\cms\controller;
use app\common\controller\Base;
use app\common\model\Admins;
use app\common\model\NavMenus;
use think\facade\Session;

/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/23
 * Time: 15:54
 */
class Index extends Base{
    private $menuModel;
    private $adminModel;
    public function __construct()
    {
        parent::__construct();
        $this->menuModel = new NavMenus();
        $this->adminModel = new Admins();
    }

    /**
     * 后台首页
     * @return \think\response\View
     */
    public function index(){
        $cmsAID = Session::get('cmsAID');
        $menuList = $this->menuModel->getNavMenusShow($cmsAID);
        if (!$cmsAID || !$menuList){
            //TODO 页面跳转至登录页
            return redirect('cms/article/index',302);
        }else{
            $adminInfo = $this->adminModel->getAdminData($cmsAID);
            $data = [
                'menus' => $menuList,
                'admin' => $adminInfo,
            ];
            return view('index',$data);
        }
    }
    public function home(){
        return view('home');
    }
}