<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * 公用的方法  返回json数据，进行信息的提示
 * @param $status 状态
 * @param string $message 提示信息
 * @param array $data 返回数据
 */
function showMsg($status,$message = '',$data = array()){
    $result = array(
        'status' => $status,
        'message' =>$message,
        'data' =>$data
    );
    exit(json_encode($result));
}
/**
 * 进行图片数据的上传，写入表 xupload_imgs
 * @param string $slide_show
 * @param int $tag_id
 * @param int $type 0：商品轮播图  1：订单评论图片
 */
function uploadSlideShow($slide_show = '',$tag_id = 0,$type = 0){
    $arrSlideShow = explode(",",$slide_show);
    foreach ($arrSlideShow as $value){
        if ($value){
            $addData = [
                'tag_id' => $tag_id,
                'type'  => $type,
                'picture' => $value,
                'add_time' => date('Y-m-d H:m:s', time()),

            ];
            Db('xupload_imgs')
                ->insert($addData);
        }
    }
}