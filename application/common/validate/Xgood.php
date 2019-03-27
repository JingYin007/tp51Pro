<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/10/25
 * Time: 9:55
 */
namespace app\common\validate;
use \think\Validate;
class Xgood extends Validate
{
    protected $rule = [
        'goods_name'         =>  'require|max:100',
        'list_order'    =>  'require|number',
        'cat_id'        =>  'require|number',
        'reference_price'        =>  'require|float',
        'selling_price'        =>  'require|lt:reference_price',
        'stock'    =>  'require|number',
        'details'       =>  'require',
        '__token__'     =>  'require|token',
    ];
    protected $message  =   [
        'goods_name.max'     =>  '商品名称不能超过100个字符',
        'goods_name.require' =>   '商品名称不能为空',
        'list_order'    =>  '排序权重为整数',
        'stock'    =>  '库存为整数',
        'reference_price'    =>  '参考价为小数',
        'selling_price'    =>  '售价不能高于参考价',
        'cat_id'    =>  '分类不能为空',
        'details'       =>  '商品详情不能为空',
        '__token__'     =>  'Token非法操作或失效',
    ];

    protected $scene = [
        'default'  =>  ['goods_name','list_order','details','stock','cat_id','reference_price','selling_price'],
        'token'    =>  ['__token__'],
    ];
}