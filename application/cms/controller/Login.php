<?php

namespace app\cms\Controller;

use app\common\model\Admins;
use app\common\model\NavMenus;
use think\facade\Session;
use think\Request;

class Login
{
    //
    private $adminModel;
    private $navMenuModel;
    public function __construct()
    {
        $this->adminModel = new Admins();
        $this->navMenuModel = new NavMenus();
    }

    public function index(Request $request){
        Session::set('cmsAID',null);
        return view('index');
    }
    public function ajaxLogin(Request $request){
        $method = $request->Method();
        if ($method == 'POST'){
            $input = $request->param();
            $tag = $this->adminModel->adminLogin($input);
            if ($tag){
                Session::set('cmsAID', $tag);
                return showMsg(1,'登录成功');
            }else{
                return showMsg(0,'登录失败，请检查您的信息');
            }
        }else{
            return showMsg(0,'sorry,您的请求不合法！');
        }
    }

    public function ajaxCheckLoginStatus(Request $request)
    {
        $method = $request->Method();
        if ($method == 'POST'){
            $cmsAID = Session::get('cmsAID');
            $nav_menu_id = $request->param('nav_menu_id');
            //TODO 判断当前菜单是否属于他的权限内
            $checkTag = $this->navMenuModel->checkNavMenuMan($nav_menu_id,$cmsAID);
            if ($cmsAID && $checkTag){
                return showMsg(1,'正在登录状态');
            }else{
                return showMsg(0,'未在登录状态');
            }
        }else{
            return showMsg(0,'sorry,您的请求不合法！');
        }
    }
}
