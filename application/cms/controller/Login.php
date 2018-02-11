<?php

namespace app\cms\Controller;

use app\common\model\Admins;
use think\facade\Session;
use think\Request;

class Login
{
    //
    private $adminModel;
    public function __construct()
    {
        $this->adminModel = new Admins();
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
            if ($cmsAID){
                return showMsg(1,'正在登录状态');
            }else{
                return showMsg(0,'未在登录状态');
            }
        }else{
            return showMsg(0,'sorry,您的请求不合法！');
        }
    }
}
