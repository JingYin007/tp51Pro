<?php

namespace app\cms\controller;

use app\common\controller\CmsBase;
use app\common\model\Xcategorys;
use think\Request;
use think\Db;

/**
 * 商品分类
 * Class Category
 * @package app\cms\Controller
 */
class Category extends CmsBase
{
    protected $model;
    protected $page_limit;

    public function __construct()
    {
        parent::__construct();
        $this->model = new Xcategorys();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 获取商品分类列表数据
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request)
    {
        $search = $request->param('str_search');
        $catType = $request->param("CatType");
        $list = $this->model->getCmsCategoryForPage(1, $this->page_limit, $search, $catType);
        $num = $this->model->getCmsCategoryCount($search, $catType);
        $data = [
            'list' => $list,
            'search' => $search,
            'cat_type' => $catType,
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
            $catType = $request->post("CatType");
            $list = $this->model->getCmsCategoryForPage($curr_page, $this->page_limit, $search, $catType);
            return showMsg(1, 'success', $list);
        } else {
            return showMsg(0, 'sorry，请求不合法');
        }

    }

    /**
     * 添加产品分类
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request)
    {
        if ($request->isPost()) {
            $input = $request->post();
            $opRes = $this->model->addCategory($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $res = $this->model->getCategoryList(1);
            $data = [
                'cat_list' => $res
            ];
            return view('add', $data);
        }
    }

    /**
     * 更新分类数据
     * @param Request $request
     * @param $id 文章ID
     * @return \think\response\View|void
     */
    public function edit(Request $request, $id)
    {
        if ($request->isPost()) {
            $opRes = $this->model->updateCmsCategoryData($request->post());
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $cat = $this->model->getCmsCategoryByID($id);
            $res = $this->model->getCategoryList(1);
            $data =
                [
                    'cat' => $cat,
                    'cat_list' => $res
                ];
            return view('edit', $data);
        }
    }

    /**
     * ajax 更改首页显示状态
     * @param Request $request
     */
    public function ajaxForShow(Request $request)
    {
        $opRes = $this->model->updateForShow($request->post('cat_id'), $request->post('okStatus'));
        return showMsg($opRes['tag'], $opRes['message']);
    }
}
