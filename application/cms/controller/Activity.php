<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\Xactivitys;
use app\common\model\Xcategorys;
use think\Request;

class Activity extends CmsBase
{
    private $actModel;
    private $categoryModel;
    //定义每页的记录数
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->actModel = new Xactivitys();
        $this->categoryModel = new Xcategorys();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 商品活动列表页
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $search = $request->param('str_search');
        $record_num = $this->actModel->getActsCount($search);
        $list = $this->actModel->getActsForPage(1,$this->page_limit,$search);
        return view('index',
            [
                'acts' => $list,
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
            $list = $this->actModel->getActsForPage($curr_page,$this->page_limit,$search);
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }
    }

    /**
     * 增加新活动标题 功能
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request){
        if ($request->isPost()){
            $input = $request->post();
            $opRes = $this->actModel->addActivity($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            //获取所有的商品二级分类
            $categoryList = $this->categoryModel->getCategoryList(2);
            return view('add',['categoryList' => $categoryList]);
        }
    }

    /**
     * 编辑活动数据
     * @param Request $request
     * @param $id 菜单ID
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        if($id == 0) $id = $request->param('id');
        $actData = $this->actModel->getActByID($id);
        $actGoods = $this->actModel
            ->getActGoods($id);
        //获取所有的商品二级分类
        $categoryList = $this->categoryModel->getCategoryList(2);
        if ($request->isPost()){
            //TODO 修改对应的菜单
            $input = $request->post();
            $opRes = $this->actModel->editActivity($input['id'],$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('edit',[
                'actData'   => $actData,
                'actGoods'  =>$actGoods,
                'categoryList' => $categoryList
            ]);
        }
    }

    /**
     * ajax 更改首页显示状态
     * @param Request $request
     */
    public function ajaxForShow(Request $request){
        $opRes = $this->actModel->updateForShow( $request->post('act_id'),$request->post('okStatus'));
        return showMsg($opRes['tag'],$opRes['message']);
    }

}
