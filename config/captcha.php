<?php
/**
 * 验证码配置信息
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/12/3
 * Time: 16:39
 */
return [
    // 验证码加密密钥
    'seKey'    => 'ThinkPHP.CN.moTzxx',

    // 验证码字符集合
    'codeSet'  => '2347abcdefhijkmnprtuvwxyACEFGHJKLMNPRTUVWXY',

    'length'   => 4,
    'fontSize' => 77,
    'useImgBg' => true,
    // 使用中文验证码
    'useZh'    => false,
    ];