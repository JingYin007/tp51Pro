<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class TodayWord extends Validate
{

    protected $rule = [
        'from'         =>  'require|max:100',
        'picture'      =>  'require',
        'word'         =>  'require|max:255',

    ];
    protected $message  =   [
        'word.require'  =>  '赠言不能为空',
        'word.max'      =>  '赠言不能超过255个字符',
        'from'          =>  '出处不规范',
        'picture'       =>  '图片不能为空',
    ];
}