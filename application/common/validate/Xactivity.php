<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/11/20
 * Time: 17:18
 */

namespace app\common\validate;


use think\Validate;

class Xactivity extends Validate
{

    protected $rule = [
        'title' => 'require|max:100',
        'act_img' => 'require',
        'act_url' => 'require',
        'act_tag' => 'require|unique:xactivitys',
        '__token__' => 'require|token',
    ];
    protected $message = [
        'title.require' => '标题不能为空',
        'title.max' => '标题不能超过255个字符',
        'act_img' => '配图未添加',
        'act_url' => 'appURL 路径未添加',
        'act_tag.require' => '标识字符串未添加',
        'act_tag.unique' => '此标识字符串已存在',
        '__token__' => 'Token非法操作或失效',
    ];

    /**
     * 定义情景
     * @var array
     */
    protected $scene = [
        'default' => ['title', 'act_img', 'act_url', 'act_tag'],
        'token' => ['__token__'],
    ];
}