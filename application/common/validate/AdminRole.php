<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class AdminRole extends Validate
{

    protected $rule = [
        'user_name'    =>  'require|max:100',
        'nav_menu_ids' =>  'require',
        'status'       =>  'number',
        '__token__'    =>  'require|token',
    ];
    protected $message  =   [
        'user_name.require'  =>  '角色名称不能为空',
        'user_name.max'      =>  '角色名称不能超过100个字符',
        'nav_menu_ids'       =>  '权限下的菜单 不能为空',
        'status'             =>  '状态不规范',
        '__token__'          =>  'Token非法操作或失效',
    ];

    /**
     * 定义情景
     * @var array
     */
    protected $scene = [
        'default'  =>  ['user_name','nav_menu_ids','status'],
        'token'    =>  ['__token__'],
    ];
}