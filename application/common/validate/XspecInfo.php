<?php

namespace app\common\validate;
use \think\Validate;
class XspecInfo extends Validate
{
    protected $rule = [
        'spec_name'         =>  'require|max:100',
        'list_order'    =>  'require|number',
        'cat_id'       =>  'require|>:0',
        '__token__'     =>  'require|token',
    ];
    protected $message  =   [
        'spec_name.max'     =>  '名称不能超过100个字符',
        'spec_name.require' =>   '名称不能为空',
        'list_order'    =>  '排序权重为整数',
        'cat_id'       =>  '商品分类不能为空',
        '__token__'     =>  'Token非法操作或失效',
    ];

    protected $scene = [
        'default'  =>  ['spec_name','list_order','cat_id'],
        'token'    =>  ['__token__'],
    ];
}


