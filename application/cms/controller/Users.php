<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2019/4/26
 * Time: 10:10
 */

namespace app\cms\controller;


use app\common\controller\CmsBase;
use app\common\model\Xusers;
use think\Request;

/**
 * 用户管理类
 * Class Users
 * @package app\cms\Controller
 */
class Users extends CmsBase
{
    protected $model;
    protected $page_limit;

    public function __construct()
    {
        parent::__construct();
        $this->model = new Xusers();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 用户列表数据
     * @param Request $request
     * @return \think\response\View
     */
    public function index(Request $request){
        $search = $request->param('str_search',null);
        $user_type = $request->param('user_type',0);
        $users = $this->model->getCmsUsersForPage(1, $this->page_limit, $search,$user_type);
        $record_num = $this->model->getCmsUsersCount($search,$user_type);
        $data = [
            'users' => $users,
            'search' => $search,
            'user_type' => $user_type,
            'record_num' => $record_num,
            'page_limit' => $this->page_limit,
        ];
        return view('index', $data);
    }

    /**
     * 分页获取列表数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request)
    {
        if ($request->isPost()) {
            $curr_page = $request->post('curr_page', 1);
            $search = $request->post('str_search','');
            $user_type = $request->post('user_type',0);
            $list = $this->model->getCmsUsersForPage($curr_page, $this->page_limit, $search,$user_type);
            return showMsg(1, 'success', $list);
        } else {
            return showMsg(0, 'sorry，请求不合法');
        }
    }

    /**
     * ajax 更新用户状态
     * @param Request $request
     */
    public function ajaxUpdateUserStatus(Request $request){
        if ($request->isPost()) {
            $user_id = $request->post('user_id', 0);
            $user_status = $request->post('user_status',0);
            $opRes = $this->model->updateUserStatus($user_id, $user_status);
            return showMsg($opRes['status'], $opRes['message']);
        } else {
            return showMsg(0, 'sorry，请求不合法');
        }
    }
}