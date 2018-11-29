<?php
namespace app\cms\controller;
use app\common\controller\Base;
use app\common\controller\CmsBase;
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
        $cmsAID = Session::get('cmsMoTzxxAID');
        if (!$cmsAID){
            return redirect('cms/login/index');
        }
    }

    /**
     * 后台首页
     * @return \think\response\View
     */
    public function index(){
        //获取 登录的管理员有效期ID
        $cmsAID = Session::get('cmsMoTzxxAID');
        $menuList = $this->menuModel->getNavMenusShow($cmsAID);
        if (!$cmsAID || !$menuList){
            //TODO 页面跳转至登录页
            return redirect('cms/login/index');
        }else{
            $adminInfo = $this->adminModel->getAdminData($cmsAID);
            $data = [
                'menus' => $menuList,
                'admin' => $adminInfo,
            ];
            return view('index',$data);
        }
    }

    /**
     * 首页显示 可自定义呗
     * @return \think\response\View
     */
    public function home(){
        return view('home');
    }
}