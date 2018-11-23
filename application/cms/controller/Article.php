<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\Articles;
use think\Request;

class Article extends CmsBase
{
    //
    private $model ;
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->model = new Articles();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 获取文章列表数据
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){

        $articles = $this->model->getCmsArticleList();
        $search = $request->param('str_search');
        $record_num = count($articles);

        $data = [
            'articles' => $articles,
            'search' => $search,
            'record_num' => $record_num,
            'page_limit' => $this->page_limit,
        ];
        return view('index',$data);
    }

    /**
     * 添加文章
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request){
        $method = $request->method();
        if($method == 'POST'){
            $input = $request->param();
            $opRes = $this->model->addArticle($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('add');
        }
    }

    /**
     * 更新文章数据
     * @param Request $request
     * @param $id
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        $method = $request->method();
        if ($method == 'POST'){
            $opRes = $this->model->updateCmsArticleData( $request->param());
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            $article = $this->model->getCmsArticleByID($id);
            $comments = [];
            $data =
                [
                    'article'=>$article,
                    'comments'=> $comments,
                ];
            return view('edit',$data);
        }
    }
}
