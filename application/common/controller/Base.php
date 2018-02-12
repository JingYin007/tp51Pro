<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/17
 * Time: 19:02
 */
namespace app\common\controller;

use think\facade\Session;

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
            echo 'Sorry,请重新登录！';die;
        }
    }

}