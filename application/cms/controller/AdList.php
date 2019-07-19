<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\XadLists;
use think\Request;

/**
 * 广告管理处理类
 * Class AdList
 * @package app\cms\Controller
 */
class AdList extends CmsBase
{
    private $adModel;
    //定义每页的记录数
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->adModel = new XadLists();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 广告列表页
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $search = $request->param('str_search');
        $record_num = $this->adModel->getAdsCount($search);
        $list = $this->adModel->getAdsForPage(1,$this->page_limit,$search);
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
            $list = $this->adModel->getAdsForPage($curr_page,$this->page_limit,$search);
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }
    }

    /**
     * 增加广告功能
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request){
        if ($request->isPost()){
            $input = $request->post();
            $opRes = $this->adModel->addAdvertisement($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('add');
        }
    }

    /**
     * 编辑数据
     * @param Request $request
     * @param $id 广告ID
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        if($id == 0) $id = $request->param('id');
        $actData = $this->adModel->getAdByID($id);
        if ($request->isPost()){
            $input = $request->post();
            $opRes = $this->adModel->editAdvertisement($input['id'],$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('edit',[
                'actData'   => $actData,
            ]);
        }
    }

    /**
     * ajax 更改首页显示状态
     * @param Request $request
     */
    public function ajaxForShow(Request $request){
        $opRes = $this->adModel->updateForShow( $request->post('act_id'),$request->post('okStatus'));
        return showMsg($opRes['tag'],$opRes['message']);
    }

}
