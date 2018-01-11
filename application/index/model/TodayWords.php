<?php
namespace app\index\model;
use think\Db;
use \think\Model;
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */

class TodayWords extends Model
{

    public function getTodayWord(){
        $random = rand(1,7);
        $res = $this
            //->select('*')
            ->where('id',$random)
            ->find();
        return $res;
    }

}