<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/17
 * Time: 19:02
 */
namespace app\common\controller;

use think\facade\Session;
use think\Request;

class Base
{
    /**
     * 初始化处理数据
     * Base constructor.
     */
    public function __construct()
    {
        $this->init();
    }


    public function init(){
        $cmsAID = Session::get('cmsAID');
        if (!$cmsAID){
            //TODO 判断当前用户是否具有此操作权限
            echo '<br>';
            echo '<br>';
            echo '<br>';
            echo '<center>';
            echo '<h3> Sorry,您没有此操作权限，请重新登录！</h3>';
            echo '</center>';
            die;
        }
    }

}