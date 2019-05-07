<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\Xcategorys;
use app\common\model\XspecInfos;
use think\Request;
use think\Db;

class SpecInfo extends CmsBase
{
    private $model;
    private $page_limit;
    private $categoryModel;

    public function __construct()
    {
        parent::__construct();
        $this->model = new XspecInfos();
        $this->categoryModel = new Xcategorys();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 获取属性列表数据
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request)
    {
        $search = $request->param('str_search');
        $catID = $request->param("catID");
        $specFstID = $request->param("specFstID");
        $categoryList = $this->categoryModel->getCategoryList(2);
        $list = $this->model->getCmsSpecInfoForPage(1, $this->page_limit, $search, intval($catID), intval($specFstID));
        $num = $this->model->getCmsSpecInfoCount($search, intval($catID), intval($specFstID));
        $data = [
            'list' => $list,
            'search' => $search,
            'catID' => $catID,
            'specFstID' => $specFstID,
            'categoryList' => $categoryList,
            'num' => $num,
            'page_limit' => $this->page_limit,
        ];
        return view('index', $data);
    }

    /**
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request)
    {
        if ($request->isPost()) {
            $curr_page = $request->post('curr_page', 1);
            $search = $request->post('str_search');
            $catID = $request->param("catID");
            $specFstID = $request->param("specFstID");
            $list = $this->model->getCmsSpecInfoForPage($curr_page, $this->page_limit, $search, intval($catID), intval($specFstID));
            return showMsg(1, 'success', $list);
        } else {
            return showMsg(0, 'sorry，请求不合法');
        }

    }

    /**
     * 添加属性分类
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request)
    {
        if ($request->isPost()) {
            $input = $request->post();
            $opRes = $this->model->addSpecInfo($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $categoryList = $this->categoryModel->getCategoryList(2);
            $data = [
                'categoryList' => $categoryList
            ];
            return view('add', $data);
        }
    }

    /**
     * 更新属性数据
     * @param Request $request
     * @param $id 属性 ID
     * @return \think\response\View|void
     */
    public function edit(Request $request, $id)
    {
        if ($request->isPost()) {
            $opRes = $this->model->updateCmsSpecInfoData($request->post());
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $categoryList = $this->categoryModel->getCategoryList(2);
            $specInfo = $this->model->getCmsSpecInfoByID($id);
            $data =
                [
                    'categoryList' => $categoryList,
                    'specInfo' => $specInfo
                ];
            return view('edit', $data);
        }
    }

    /**
     * ajax 根据商品分类查询 父级属性
     * @param Request $request
     */
    public function ajaxGetSpecInfoFstByCat(Request $request)
    {
        $seledCatID = $request->post("seledCatID");
        $goodsList = $this->model->getSpecInfoFstByCat($seledCatID);
        $status = 1;
        $message = "success";
        if (!$goodsList) {
            $status = 0;
            $message = "未查到父级属性数据";
        }
        return showMsg($status, $message, $goodsList);
    }

    /**
     * ajax 根据商品分类查询 父级属性
     * @param Request $request
     */
    public function ajaxGetSpecInfoBySpecFst(Request $request)
    {
        $seledSpecFstID = $request->post("seledSpecFstID");
        $specInfoList = $this->model->getSpecInfoBySpecFst(intval($seledSpecFstID));
        $status = 1;
        $message = "success";
        if (!$specInfoList) {
            $status = 0;
            $message = "未查到子级属性数据";
        }
        return showMsg($status, $message, $specInfoList);
    }
}
