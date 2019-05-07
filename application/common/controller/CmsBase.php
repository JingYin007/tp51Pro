<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/23
 * Time: 11:23
 */

namespace app\common\controller;

use app\common\model\Xadmins;
use think\Db;
use think\facade\Session;
use think\Request;

/**
 * 此类主要用于后台控制类的初始化操作
 * Class CmsBase
 * @package app\common\controller
 */
class CmsBase extends Base
{
    /**
     * 初始化处理数据
     * Base constructor.
     */
    public function __construct()
    {
        parent::__construct();
        $this->initAuth();
    }

    /**
     * 进行权限控制
     */
    public function initAuth()
    {
        $authFlag = false;
        $hasCmsAID = Session::has('cmsMoTzxxAID');
        if (!$hasCmsAID) {
            $message = "You are offline,please logon again!";
        } else {
            $cmsAID = Session::get('cmsMoTzxxAID');
            //TODO 判断当前用户是否具有此操作权限
            $checkAuth = $this->checkCmsAdminAuth($cmsAID);
            $authFlag = $checkAuth;
            $message = $checkAuth ? "权限正常" : "Sorry,You don't have permission!";
        }
        if (!$authFlag) {
            return showMsg($authFlag, $message);
        };
    }

    /**
     * 检查权限
     * @param int $adminID
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function checkCmsAdminAuth($adminID = 0)
    {
        $action = trim(strtolower(request()->action()));
        $request_url = trim(strtolower($_SERVER["REQUEST_URI"]));
        $authUrl = explode($action, $request_url)[0] . $action;
        //对待检测的URL 忽略大小写
        $adminModel = new Xadmins();
        $checkTag = $adminModel->checkAdminAuth($adminID, $authUrl);
        return $checkTag;
    }

}