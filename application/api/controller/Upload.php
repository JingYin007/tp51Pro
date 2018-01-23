<?php

namespace app\api\Controller;

use think\Request;

class Upload
{
    public function img_file(Request $request)
    {
        $status = 0;
        $data = [];
        if ($request->Method()== 'POST') {
            $file = $request->file('file');
            // 移动到框架应用根目录/upload/ 目录下
            $info = $file->move('upload');
            if ($info){
                $fileUrl = '/upload/'.$info->getSaveName();
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
