<?php
namespace app\index\controller;

use app\common\model\Xarticles;
use app\common\model\TodayWords;

class Index
{
    private $articleModel;
    private $todayWordModel;

    public function __construct()
    {
        $this->articleModel = new Xarticles();
        $this->todayWordModel = new TodayWords();
    }

    /**
     * PC 端首页
     * @return \think\response\View
     */
    public function index()
    {
        $todayWordsData = $this->todayWordModel->getTodayWord();
        $articleList = $this->articleModel->getArticleList();
        $recommendList = $this->articleModel->getRecommendList();
        $photos = $this->articleModel->getPhotos();

        $data = [
            'name'=>'MoTzxx',
            'list' => $articleList,
            'todayWord'=>$todayWordsData,
            'recommendList' => $recommendList,
            'photos' => $photos
        ];
        return view('index',$data);
    }

    /**
     * 文章列表页
     * @return \think\response\View
     */
    public function review(){

        $articleList = $this->articleModel->getArticleList();
        $data = [
            'name'=>'MoTzxx',
            'List'=>$articleList,
        ];
        return view('review',$data);
    }
    public function contact(){
        return view('contact');
    }

    /**
     * 文章详情页
     * @param $id 文章ID
     * @return \think\response\View
     */
    public function article($id)
    {
        $articleInfo = $this->articleModel->getInfoByID(intval($id));
        $data = [
            'name'=>'MoTzxx',
            'article'=>$articleInfo,
        ];
        return view('article',$data);
    }


}
