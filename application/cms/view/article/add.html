@extends('cms.layouts.cms')
@section('body-content')
    <form class="layui-form form-opArticle layui-form-pane" >
        <input type="hidden" name="_token" class="tag_token" value="<?php echo csrf_token(); ?>">
        <div class="layui-form-item">
            <label class="layui-form-label">文章标题：</label>
            <div class="layui-input-inline">
                <input type="text" name="title" required lay-verify="required"
                       value=""
                       placeholder="请输入标题" autocomplete="off" class="layui-input article-title">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">文章配图：</label>
            <div class="layui-upload layui-input-inline">
                <button type="button" name="img_upload" class="layui-btn btn_upload_img">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <img class="layui-upload-img img-upload-view" src="">
            </div>
        </div>

        <input type="hidden" name="picture" class="menu-icon" value="">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文章摘要：</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="abstract"  required
                          lay-verify="required" class="layui-textarea">
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="status" value="1" title="显示" checked>
                <input type="radio" name="status" value="-1" title="删除">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序：</label>
            <div class="layui-input-inline">
                <input type="number" name="list_order"
                       value="0" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">(数字越大，排序越靠前)</div>
        </div>


        <div class="layui-form-item layui-form-text ">
            <label class="layui-form-label">文章内容：</label>
            <div class="layui-input-block div-article-content">
                <script id="ue-container" name="content"  type="text/plain">
                </script>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-input-block div-form-op">
                <button class="layui-btn" type="button" onclick="addArticle()">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">放弃</button>
            </div>
        </div>
    </form>

@endsection

@section('single-content')
    <script src="{{asset('cms/js/today_words.js')}}"></script>
    <script src="{{asset('cms/js/moZhang.js')}}"></script>
    @include('home.layouts.ueditor-js')
    <script>
        //修改按钮的点击事件
        function addArticle() {
            var toUrl = "{{url('cms/article/add')}}";
            var postData = $(".form-opArticle").serialize();
            ToPostPopupsDeal(toUrl,postData);
        }

        layui.use('upload', function(){
            var upload = layui.upload;
            var tag_token = $(".tag_token").val();
            //普通图片上传
            var uploadInst = upload.render({
                elem: '.btn_upload_img'
                ,type : 'images'
                ,exts: 'jpg|png|gif' //设置一些后缀，用于演示前端验证和后端的验证
                //,auto:false //选择图片后是否直接上传
                //,accept:'images' //上传文件类型
                ,url: '/api/upload/img_file'
                ,data:{'_token':tag_token}
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('.img-upload-view').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    dialog.tip(res.message);
                    //如果上传成功
                    if(res.status ==1){
                        $('.menu-icon').val(res.data.url);
                    }
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    return layer.msg('上传失败,请重新上传');
                }
            });
        });
    </script>
@endsection
