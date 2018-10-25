<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/10/25
 * Time: 16:21
 */

namespace app\common\model;


use think\Model;

class BaseModel extends Model
{

    /**
     * @param $validate 此为传入的 Validate类
     * @param array $checkData 所要验证的数据组
     * @return array
     */
    public function validate($validate,$checkData = []){
        $checkFlag = false;
        if (!$validate->check($checkData)) {
            $errMsg = $validate->getError();
            $message = $errMsg?$errMsg:'验证失败';
        }else{
            $checkFlag = true;
            $message = '验证通过';
        }
        return ['tag'=>$checkFlag,'message'=>$message];
    }
}