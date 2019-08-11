<?php

namespace app\api\controller;

use think\Request;

class Upload
{
    /**
     * 单一图片的上传操作
     * @param Request $request
     */
    public function img_file(Request $request)
    {
        $status = 0;
        $data = [];
        if ($request->Method()== 'POST') {
            $file = $request->file('file');
            // 移动到框架应用根目录/upload/ 目录下
            $info = $file->move('upload');
            if ($info){
                //把反斜杠(\)替换成斜杠(/) 因为在windows下上传路是反斜杠径
                $getSaveName=str_replace("\\","/",$info->getSaveName());
                $fileUrl = '/upload/'.$getSaveName;
                $status = 1;
                $data['url'] = $fileUrl;
                $message = '上传成功';
            }else{
                $message = "上传失败 ".$file->getError();
            }
        } else {
            $message = "参数错误";
        }
        return showMsg($status, $message,$data);
    }

}
