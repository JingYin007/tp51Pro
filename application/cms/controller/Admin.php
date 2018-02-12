<?php

namespace app\cms\Controller;

use app\common\controller\Base;
use app\common\model\AdminRoles;
use app\common\model\Admins;
use app\common\model\NavMenus;
use think\Request;

class Admin extends Base
{
    //
    private $model;
    private $ar_model;
    private $menuModel;
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->model = new Admins();
        $this->ar_model = new AdminRoles();
        $this->menuModel = new NavMenus();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 管理员数据列表
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $list = $this->model
            ->getadminsForPage(1,$this->page_limit);
        $search = $request->param('str_search');
        $record_num = $this->model->getAdminsCount();

        return view('index',
            [
                'admins' => $list,
                'search' => $search,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    /**
     * 添加新用户
     * @param Request $request
     */
    public function add(Request $request){
        $method = $request->Method();
        $adminRoles = $this->ar_model->getNormalRoles();
        if ($method == 'POST'){
            $input = $request->param();
            $tag = $this->model->addAdmin($input);
            if (is_numeric($tag) && $tag > 0){
                return showMsg(1,'新用户添加成功');
            }else{
                return showMsg(0,'Sorry,新用户添加失败');
            }
        }else{
            return view('add',[
                'adminRoles'=>$adminRoles
            ]);
        }
    }
    /**
     * @param Request $request
     * @param $id 标识ID
     */
    public function edit(Request $request,$id){
        $method = $request->Method();
        $adminRoles = $this->ar_model->getNormalRoles();
        $adminData = $this->model->getAdminData($id);
        if ($method == 'POST'){
            $input = $request->param();
            $tag = $this->model->editAdmin($id,$input);
            return showMsg($tag,'用户信息修改成功');
        }else{
            return view('edit',[
                'admin' => $adminData,
                'adminRoles' => $adminRoles
            ]);
        }
    }

    /**
     * 分页获取数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request){
        $curr_page = $request->input('curr_page',1);
        $list = $this->model->getadminsForPage($curr_page,$this->page_limit);
        return showMsg(1,'**',$list);
    }

    /*TODO -------------------------------------角色管理------------------------------*/
    /**
     * 读取角色列表
     * @param Request $request
     */
    public function role(Request $request){
        $adminRoles = $this->ar_model->getAllRoles();
        return view('role',[
            'roles' => $adminRoles
        ]);

    }

    /**
     * 角色添加功能
     * @param Request $request
     */
    public function addRole(Request $request){
        $method = $request->Method();
        if ($method == 'POST'){
            $input = $request->param();
            $tag = $this->ar_model->addRole($input);
            if ($tag){
                return showMsg(1,'新角色添加成功');
            }else{
                return showMsg(0,'新角色添加失败');
            }
        }else{
            //TODO 获取所有可以分配的权限菜单
            $viewMenus = $this->menuModel->getNavMenus();
            return view('add_role',[
                'menus'=>$viewMenus,
            ]);
        }
    }

    public function editRole(Request $request,$id){
        $method = $request->Method();
        $roleData = $this->ar_model->getRoleData($id);
        if ($method == 'POST'){
            $input = $request->param();
            $tag = $this->ar_model->editRole($id,$input);
            return showMsg($tag,'角色信息修改成功');
        }else{
            //TODO 获取所有可以分配的权限菜单
            $viewMenus = $this->menuModel->getNavMenus();
            $arrMenuSelf = explode('|',$roleData['nav_menu_ids']);
            return view('edit_Role',[
                'role' => $roleData,
                'menus' => $viewMenus,
                'menuSelf' => $arrMenuSelf,
            ]);
        }
    }












}
