<?php

namespace app\cms\Controller;

use app\common\model\TodayWords;

class TodayWord
{
    //
    private $model;
    private $page_limit;
    public function __construct()
    {
        $this->model = new TodayWords();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 今日赠言 列表首页
     */
    public function index(){
        $list = $this->model->getTodayWordsForPage(1,$this->page_limit);
        $search = '';
        $record_num = $this->model->getTodayWordsCount();

        return view('index',
            [
                'menus' => $list,
                'search' => $search,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    /**
     * 增加新赠言
     */
    public function add(Request $request){
        $Tag = $request->getMethod();
        if ($Tag == 'POST'){
            $input = $request->except('_token');
            $this->model->addTodayWord($input);
            return showMsg(1,'添加成功');
        }else{
            return view('cms.todayWords.add');
        }
    }

    /**
     * 编辑新赠言
     * @param Request $request
     * @param $id 赠言标识 ID
     */
    public function edit(Request $request,$id){
        $Tag = $request->getMethod();
        $todayWordData = $this->model->getTodayWord($id);
        if ($Tag == 'POST'){
            //TODO 修改对应的菜单
            $input = $request->except('_token');
            $opID = $input['id'];
            $tag = $this->model->editTodayWord($opID,$input);
            return showMsg($tag,'修改成功');
        }else{
            return view('cms.todayWords.edit',[
                'todayWordData' => $todayWordData
            ]);
        }
    }

    /**
     * ajax 获取新一页的赠言数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request){
        $curr_page = $request->input('curr_page',1);
        $list = $this->model->getTodayWordsForPage($curr_page,$this->page_limit);
        return showMsg(1,'**',$list);
    }
}
