@extends('cms.layouts.cms')
@section('body-content')
    <form class="layui-form form-opNavMenu layui-form-pane">
        <input type="hidden" name="_token" class="tag_token" value="<?php echo csrf_token(); ?>">
        <div class="layui-form-item">
            <label class="layui-form-label">导航标题：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required"
                       value="{{$menuData['name']}}"
                       placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">请七个字以内</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">个性图标：</label>
            <div class="layui-upload layui-input-inline">
                <button type="button" name="img_upload" class="layui-btn btn_upload_img">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <img class="layui-upload-img img-upload-view" src="{{$menuData['icon']}}">
            </div>
        </div>

        <input type="hidden" class="post-url" value="{{url('cms/menu/edit/0')}}">
        <input type="hidden" name="id" value="{{$menuData['id']}}">
        <input type="hidden" name="icon" class="menu-icon" value="{{$menuData['icon']}}">
        <div class="layui-form-item">
            <label class="layui-form-label">父级导航：</label>
            <div class="layui-input-block">
                <select name="parent_id" lay-verify="required">
                    {{--<option value="0">根级导航</option>--}}
                    <option value="{{$menuData['parent_id']}}">{{$menuData['parent_name']}}</option>
                    @foreach($rootMenus as $vo)
                        @if($vo['id'] != $menuData['parent_id'] && $vo['id']!=$menuData['id'])
                            <option value="{{$vo['id']}}">{{$vo['name']}}</option>
                        @endif
                    @endforeach
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">action：</label>
            <div class="layui-input-inline">
                <input type="text" name="action" required
                       value="{{$menuData['action']}}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">(example:cms/menu)根级导航不需写</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排序：</label>
            <div class="layui-input-inline">
                <input type="number" name="list_order"
                       value="{{$menuData['list_order']}}" required lay-verify="required"
                       placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">(数字越大，排序越靠前)</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="status" value="1" title="正常"
                       @if ($menuData['status'] == 1)
                       checked
                       @endif;
                >
                <input type="radio" name="status" value="-1" title="无效"
                       @if ($menuData['status'] == -1)
                       checked
                       @endif;
                >
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block div-form-op">
                <button class="layui-btn" type="button" onclick="editNavMenu()"
                        lay-submit lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">放弃</button>
            </div>
        </div>
    </form>

@endsection

@section('single-content')
    <script src="{{asset('cms/js/nav_menu.js')}}"></script>
    <script src="{{asset('cms/js/moZhang.js')}}"></script>
    <script>
        //菜单修改按钮的点击事件
        function editNavMenu() {
            var postData = $(".form-opNavMenu").serialize();
            var toUrl = $(".post-url").val();
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




