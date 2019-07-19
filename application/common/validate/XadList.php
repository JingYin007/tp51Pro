<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class XadList extends Validate
{

    protected $rule = [
        'ad_name'         =>  'require|max:100',
        'act_img'         =>  'require',
        'ad_url'         =>  'require',
        'ad_tag'         =>  'require',
        'start_time'         =>  'require',
        'end_time'         =>  'require|gt:start_time',
        '__token__'    =>  'require|token',
    ];
    protected $message  =   [
        'ad_name.require'  =>  '标题不能为空',
        'ad_name.max'      =>  '标题不能超过255个字符',
        'original_img'          =>  '配图未添加',
        'ad_url'          =>  'adURL 路径未添加',
        'ad_tag.require'          =>  '标识字符串未添加',
        'start_time.require'    => '开始时间不能为空',
        'start_time'    => '开始时间不能为空',
        'end_time'  =>  '结束时间不能早于开始时间',
        '__token__'     =>  'Token非法操作或失效',
    ];

    /**
     * 定义情景
     * @var array
     */
    protected $scene = [
        'default'  =>  ['ad_name','original_img','ad_url','ad_tag','start_time','end_time'],
        'token'    =>  ['__token__'],
    ];
}