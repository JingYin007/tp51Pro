<?php

namespace app\cms\Controller;

use app\common\controller\Base;
use app\common\model\Articles;
use think\Request;

class Article extends Base
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
            $tag = $this->model->updateCmsArticleData( $request->param());
            if ($tag){
                $content = '文章更新成功';
            }else{
                $content = 'Sorry,文章更新失败';
            }
            return showMsg($tag,$content);
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
