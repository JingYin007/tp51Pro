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
        'icon'         =>  'require',
        '__token__'    =>  'require|token',
    ];
    protected $message  =   [
        'name.require'  =>  '菜单不能为空',
        'name.max'      =>  '菜单不能超过255个字符',
        'icon'          =>  '图标未添加',
        '__token__'     =>  'Token非法操作或失效',
    ];

    /**
     * 定义情景
     * @var array
     */
    protected $scene = [
        'default'  =>  ['name','icon'],
        'token'    =>  ['__token__'],
    ];
}