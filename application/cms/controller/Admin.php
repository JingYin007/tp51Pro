<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\XadminRoles;
use app\common\model\Xadmins;
use app\common\model\XnavMenus;
use think\Request;

class Admin extends CmsBase
{
    private $model;
    private $ar_model;
    private $menuModel;
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->model = new Xadmins();
        $this->ar_model = new XadminRoles();
        $this->menuModel = new XnavMenus();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 管理员数据列表
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $list = $this->model
            ->getAdminsForPage(1,$this->page_limit);
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
     * @return \think\response\View|void
     */
    public function add(Request $request){
        $adminRoles = $this->ar_model->getNormalRoles();
        if ($request->isPost()){
            $input = $request->post();
            $opRes = $tag = $this->model->addAdmin($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('add',[
                'adminRoles'=>$adminRoles
            ]);
        }
    }

    /**
     * @param Request $request
     * @param $id 标识ID
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        $adminRoles = $this->ar_model->getNormalRoles();
        $adminData = $this->model->getAdminData($id);
        if ($request->isPost()){
            $input = $request->param();
            $opRes = $this->model->editAdmin($id,$input);
            return showMsg($opRes['tag'],$opRes['message']);
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
        if ($request->isPost()){
            $curr_page = $request->post('curr_page',1);
            $list = $this->model->getAdminsForPage($curr_page,$this->page_limit);
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }

    }

    /*TODO -------------------------------------角色管理------------------------------*/

    /**
     * 读取角色列表
     * @return \think\response\View
     */
    public function role(){
        $adminRoles = $this->ar_model->getAllRoles();
        return view('role',[
            'roles' => $adminRoles
        ]);

    }

    /**
     * 角色添加功能
     * @param Request $request
     * @return \think\response\View|void
     */
    public function addRole(Request $request){
        if ($request->isPost()){
            $input = $request->post();
            $opRes = $this->ar_model->addRole($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            //TODO 获取所有可以分配的权限菜单
            $viewMenus = $this->menuModel->getNavMenus();
            return view('add_role',[
                'menus'=>$viewMenus,
            ]);
        }
    }

    /**
     * 更新 角色数据
     * @param Request $request
     * @param $id
     * @return \think\response\View|void
     */
    public function editRole(Request $request,$id){
        $roleData = $this->ar_model->getRoleData($id);
        if ($request->isPost()){
            $input = $request->param();
            $opRes = $this->ar_model->editRole($id,$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            //TODO 获取所有可以分配的权限菜单
            $viewMenus = $this->menuModel->getNavMenus();
            $arrMenuSelf = explode('|',$roleData['nav_menu_ids']);
            return view('edit_role',[
                'role' => $roleData,
                'menus' => $viewMenus,
                'menuSelf' => $arrMenuSelf,
            ]);
        }
    }




}
