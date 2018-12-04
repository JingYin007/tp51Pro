<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\NavMenus;
use think\facade\Session;
use think\Request;

class NavMenu extends CmsBase
{
    private $menuModel;
    //定义每页的记录数
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->menuModel = new NavMenus();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 菜单导航列表页
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $search = $request->param('str_search');
        $record_num = $this->menuModel->getNavMenusCount($search);
        $list = $this->menuModel->getNavMenusForPage(1,$this->page_limit,$search);
        return view('index',
            [
                'menus' => $list,
                'search' => $search,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    /**
     * ajax 获取当前页面数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request){
        if ($request->isPost()){
            $curr_page = $request->post('curr_page',1);
            $search = $request->post('str_search');
            $list = $this->menuModel->getNavMenusForPage($curr_page,$this->page_limit,$search);
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }
    }

    /**
     * 增加新导航标题 功能
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request){
        $rootMenus = $this->menuModel->getNavMenus();
        if ($request->isPost()){
            $input = $request->param();
            $opRes = $this->menuModel->addNavMenu($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('add',[
                'rootMenus'=>$rootMenus,
            ]);
        }
    }

    /**
     * 赋予权限
     * @param Request $request
     * @param $id 菜单ID
     * @return \think\response\View|void
     */
    public function auth(Request $request,$id){
        $authMenus = $this->menuModel->getAuthChildNavMenus($id);
        if ($request->isPost()){
            $input = $request->param();
            $opRes = $this->menuModel->addNavMenu($input,$id);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('auth',[
                'authMenus'=>$authMenus,
                'parent_id' => $id
            ]);
        }
    }

    /**
     * 编辑导航菜单数据
     * @param Request $request
     * @param $id 菜单ID
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        $rootMenus = $this->menuModel->getNavMenus();
        if($id == 0) $id=$request->param('id');
        $menuData = $this->menuModel->getNavMenuByID($id);
        if ($request->isPost()){
            //TODO 修改对应的菜单
            $input = $request->post();
            $opRes = $this->menuModel->editNavMenu($input['id'],$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('edit',[
                'rootMenus' => $rootMenus,
                'menuData' => $menuData
            ]);
        }
    }
}
