<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/10/25
 * Time: 9:55
 */
namespace app\common\validate;
use \think\Validate;
class Article extends Validate
{
    protected $rule = [
        'title'     =>  'require|max:100',
        'list_order' =>  'require|number',
        'content'   =>  'require',

    ];
    protected $message  =   [
        'title.max'    =>  '标题不能超过100个字符',
        'title.require'=>   '标题不能为空',
        'list_order'        =>  '排序权重为整数',
        'content'        =>  '文章内容不能为空',
    ];
}