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
class Xcategory extends Validate
{
    protected $rule = [
        'cat_name'         =>  'require|max:100',
        'list_order'    =>  'require|number',
        // 'content'       =>  'require',
        '__token__'     =>  'require|token',
    ];
    protected $message  =   [
        'cat_name.max'     =>  '标题不能超过100个字符',
        'cat_name.require' =>   '标题不能为空',
        'list_order'    =>  '排序权重为整数',
        // 'content'       =>  '文章内容不能为空',
        '__token__'     =>  'Token非法操作或失效',
    ];

    protected $scene = [
        'default'  =>  ['cat_name','list_order'],
        'token'    =>  ['__token__'],
    ];
}


