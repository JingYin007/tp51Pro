<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\Xarticles;
use think\Request;

/**
 * 文章管理类
 * Class Article
 * @package app\cms\Controller
 */
class Article extends CmsBase
{
    protected $model;
    protected $page_limit;

    public function __construct()
    {
        parent::__construct();
        $this->model = new Xarticles();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 获取文章列表数据
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request)
    {
        $search = $request->param('str_search');
        $articles = $this->model->getCmsArticlesForPage(1, $this->page_limit, $search);
        $record_num = $this->model->getCmsArticlesCount($search);
        $data = [
            'articles' => $articles,
            'search' => $search,
            'record_num' => $record_num,
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
            $list = $this->model->getCmsArticlesForPage($curr_page, $this->page_limit, $search);
            return showMsg(1, 'success', $list);
        } else {
            return showMsg(0, 'sorry，请求不合法');
        }

    }

    /**
     * 添加文章
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request)
    {
        if ($request->isPost()) {
            $input = $request->param();
            $opRes = $this->model->addArticle($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            return view('add');
        }
    }

    /**
     * 更新文章数据
     * @param Request $request
     * @param $id 文章ID
     * @return \think\response\View|void
     */
    public function edit(Request $request, $id)
    {
        if ($request->isPost()) {
            $opRes = $this->model->updateCmsArticleData($request->param());
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $article = $this->model->getCmsArticleByID($id);
            $comments = [];
            $data =
                [
                    'article' => $article,
                    'comments' => $comments,
                ];
            return view('edit', $data);
        }
    }

    /**
     * ajax 更改文章推荐标记
     * @param Request $request
     */
    public function ajaxForRecommend(Request $request)
    {
        $opRes = $this->model->updateForRecommend($request->post('article_id'), $request->post('okStatus'));
        return showMsg($opRes['tag'], $opRes['message']);
    }
}
