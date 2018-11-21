<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class NavMenu extends Validate
{

    protected $rule = [
        'name'         =>  'require|max:100',
        'icon'      =>  'require',

    ];
    protected $message  =   [
        'name.require'  =>  '菜单不能为空',
        'name.max'      =>  '菜单不能超过255个字符',
        'icon'          =>  '图标未添加',
    ];
}