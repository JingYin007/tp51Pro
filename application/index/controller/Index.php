<?php
namespace app\index\controller;

use app\index\model\Articles;
use app\index\model\TodayWords;

class Index
{
    private $articleModel;
    private $todayWordModel;

    public function __construct()
    {
        $this->articleModel = new Articles();
        $this->todayWordModel = new TodayWords();
    }

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

    public function test()
    {
        $article = new Articles();

        $data = [
            'name'=>'MoTzxx',
            'todayWord'=>[],
            ];
        return view('test',$data);
    }

}
