<?php

namespace app\cms\Controller;

use app\common\model\Articles;
use think\Request;

class Article
{
    //
    private $model ;
    private $page_limit;
    public function __construct()
    {
        $this->model = new Articles();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

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
    public function add(Request $request){
        $method = $request->method();
        if($method == 'POST'){
            $input = $request->param();
            $this->model->addArticle($input);
            return showMsg(1,'文章添加成功');
        }else{
            return view('add');
        }
    }
    public function edit(Request $request,$id){
        $method = $request->method();
        if ($method == 'POST'){
            $this->model->updateCmsArticleData( $request->param());
            return showMsg(1,'文章更新成功');
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
