<?php

namespace app\cms\Controller;

use app\common\controller\CmsBase;
use app\common\model\TodayWords;
use think\Request;

class TodayWord extends CmsBase
{
    //
    private $model;
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->model = new TodayWords();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 今日赠言 列表首页
     */
    public function index(Request $request){
        $search = $request->get('str_search');
        $list = $this->model->getTodayWordsForPage(1,$this->page_limit,$search);
        $record_num = $this->model->getTodayWordsCount($search);

        return view('index',
            [
                'todayWords' => $list,
                'search' => $search,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    /**
     * 增加新赠言
     */
    public function add(Request $request){
        $Tag = $request->Method();
        if ($Tag == 'POST'){
            $input = $request->post();
            $opRes = $this->model->addTodayWord($input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('add');
        }
    }

    /**
     * 编辑新赠言
     * @param Request $request
     * @param $id
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        $Tag = $request->Method();
        $opID = intval($id);
        $todayWordData = $this->model->getTodayWord($opID);
        if ($Tag == 'POST'){
            //TODO 修改对应的菜单
            $input = $request->post();
            $opRes = $this->model->editTodayWord($opID,$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('edit',[
                'todayWordData' => $todayWordData
            ]);
        }
    }

    /**
     * ajax 获取新一页的赠言数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request){
        $curr_page = $request->param('curr_page',1);
        $list = $this->model->getTodayWordsForPage($curr_page,$this->page_limit);
        return showMsg(1,'**',$list);
    }
}
