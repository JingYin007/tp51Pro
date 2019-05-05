<?php
//                                   乐百川
//
//                                   _ooOoo_
//                                  o8888888o
//                                  88" . "88
//                                  (| -_- |)
//                                  0\  =  /0
//                                ___/'---'\___
//                              .' \\|     |// '.
//                             / \\|||  :  |||// \
//                            / _||||| -:- |||||- \
//                           |    | \\\ - /// |    \
//                           | .-\  ''\---/''  /-. |
//                           \ . -\___ '-' ___/- . /
//                         ___'. .'   /--.--\  '. .'___
//                       /."" '< '.___\_<|>_/___.' >' "".\
//                      | | :  `- \'.;'\ _ /';.'/ -`  : | |
//                      \  \ '_.   \_ __\ /__ _/   .-` /  /
//                  =====`-.____`.___ \_____/ ___.-`___.-'=====
//                                   '=-----='
//                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                            佛祖保佑        永无Bug
//

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


