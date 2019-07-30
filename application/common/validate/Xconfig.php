<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class Xconfig extends Validate
{

    protected $rule = [
        'title'         =>  'require|max:100',
        'tag'         =>  'require|max:50|unique:xconfigs',
        'value'         =>  'require|max:100',
        'type'         =>  'require|max:20',
        'tip'         =>  'require|max:100',
        '__token__'    =>  'require|token',
    ];
    protected $message  =   [
        'title.require'  =>  '标题不能为空',
        'title.max'      =>  '标题不能超过100个字符',
        'tag.require'          =>  '标签字符不能为空',
        'tag.max'      =>  '标签不能超过100个字符',
        'tag.unique'          =>  '此标识字符串已存在',
        'value.require'          =>  '取值信息未添加',
        'value.max'      =>  '取值信息不能超过100个字符',
        'type.require'          =>  '配置类型未添加',
        'type.max'    => '类型长度已超',
        'tip.require'    => '提示信息不能为空',
        'tip.max'      =>  '提示信息不能超过100个字符',
        '__token__.require'     =>  'Token不能为空',
        '__token__.token'     =>  'Token非法操作或已过期',
    ];

    /**
     * 定义情景
     * @var array
     */
    protected $scene = [
        'default'  =>  ['title','tag','value','type','tip'],
        'token'    =>  ['__token__'],
    ];
}