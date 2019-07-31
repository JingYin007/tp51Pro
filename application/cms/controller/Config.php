<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2019/7/25
 * Time: 18:34
 */

namespace app\cms\Controller;


use app\common\controller\CmsBase;
use app\common\model\Xconfigs;
use think\Request;

/**
 * 配置项管理类
 * Class Config
 * @package app\cms\Controller
 */
class Config extends CmsBase
{
    protected $confModel;
    //定义每页的记录数
    private $page_limit;
    public function __construct()
    {
        parent::__construct();
        $this->confModel = new Xconfigs();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 数据列表页
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $search = $request->param('str_search');
        $type = $request->param("type","text");
        $configs = $this->confModel->getConfigsForPage(1, $this->page_limit, $search,$type);
        $record_num = $this->confModel->getConfigsCount($search, $type);
        $arrCount = $this->confModel->getEachTypeData();
        $data = [
            'configs' => $configs,
            'search' => $search,
            'type' => $type,
            'arrCount' => $arrCount,
            'record_num' => $record_num,
            'page_limit' => $this->page_limit,
        ];
        return view('index',$data);
    }

    /**
     * ajax 获取当前页面数据
     * @param Request $request
     */
    public function ajaxOpForConfigsPage(Request $request){
        if ($request->isPost()){
            $curr_page = $request->post('curr_page',1);
            $search = $request->post('str_search');
            $type = $request->param("type","text");
            $list = $this->confModel->getConfigsForPage($curr_page,$this->page_limit,$search,$type);
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }
    }

    /**
     * 进行配置项的添加
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request){
        if ($request->isPost()) {
            $input = $request->post();
            $opRes = $this->confModel->addConfig($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            return view('add');
        }
    }

    /**
     * 编辑配置项数据
     * @param Request $request
     * @param $id ID
     * @return \think\response\View|void
     */
    public function edit(Request $request,$id){
        if($id == 0) $id = $request->param('id');
        $confData = $this->confModel->getConfigByID($id);

        if ($request->isPost()){
            //TODO 修改对应的配置
            $input = $request->post();
            $opRes = $this->confModel->editConfig($input['id'],$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }else{
            return view('edit',[
                'confData'   => $confData,
            ]);
        }
    }
}