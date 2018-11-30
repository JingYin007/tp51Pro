<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class Admin extends Validate
{

    protected $rule = [
        'user_name'    =>  'require|max:100',
        'picture'      =>  'require',
        'role_id'      =>  'number',
        'content'      =>  'require|max:500',
        '__token__'    =>  'require|token',

    ];
    protected $message  =   [
        'user_name.require'  =>  '管理员不能为空',
        'user_name.max'      =>  '管理员名称不能超过100个字符',
        'picture'            =>  '图片不能为空',
        'role_id'            =>  '角色不能为空',
        'content.require'    =>  '备注信息不能为空',
        'content.max'        =>  '备注信息不能超过500字符',
        '__token__'          =>  'Token非法操作或失效',
    ];
    /**
     * 定义情景
     * @var array
     */
    protected $scene = [
        'default'  =>  ['user_name','picture','role_id','content'],
        'token'    =>  ['__token__'],
        'cms_admin'=>  ['user_name','picture','content']
    ];
}