<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>moTzxx - CMS</title>
    <!-- load layui -->
    @include('layouts.layui')
    <!-- 加载公共文件  -->
    <link  href="{{asset('cms/css/zhang.css')}}" rel="stylesheet">
    <script type='text/javascript' src="{{asset('cms/js/moZhang.js')}}" ></script>

</head>
<body id="body-login">
<div class="div-video">
    <video class="video-player" preload="auto" autoplay="autoplay" loop="loop">
        <source src="{{asset('cms/file/loginVideo.mp4')}}" type="video/mp4">
        <!-- 此视频文件为支付宝所有，在此仅供样式参考，如用到商业用途，请自行更换为其他视频或图片，否则造成的任何问题使用者本人承担，谢谢 -->
    </video>
</div>

<div class="video_mask"></div>
<div class="div-login">
    <form class="layui-form layui-form-pane"  id="form-login">
        <div class="layui-form-item">
            <label class="layui-form-label">用户</label>
            <div class="layui-input-inline">
                <input type="text" name="user_name" required
                       lay-verify="required" placeholder="请输入用户名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required
                       lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <input type="hidden" name="_token" class="tag_token" value="<?php echo csrf_token(); ?>">
        <div class="layui-form-item">
            <div class="layui-input-block div-form-op">
                <button class="layui-btn btn-login" type="button" onclick="adminLogin()"
                        lay-submit lay-filter="formDemo">登录</button>
                <button type="reset"  class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

</body>
<script>
    window.onload = function(){
        //要初始化的东西 TODO 我就奇怪为啥有的代码在$(document).function()中就不行！！！
        $(window).resize(function(){
            if($(".video-player").width() > $(window).width()){
                $(".video-player").css({"height":$(window).height(),"width":"auto","left":-($(".video-player").width()-$(window).width())/2});
            }else{
                $(".video-player").css({"width":$(window).width(),"height":"auto","left":-($(".video-player").width()-$(window).width())/2});
            }
        }).resize();
    };
    $(document).on('keydown', function() {
        if(event.keyCode == 13) {
            $(".btn-login").click();
        }
    });
    function adminLogin() {
        var toUrl = "{{url('cms/login/ajaxLogin')}}";
        var postData = $("#form-login").serialize();
        var indexUrl = "{{url('cms/index')}}";
        $.post(
            toUrl,
            postData,
            function (result) {
                if(result.status == 1){
                    window.location.href = indexUrl;
                }else{
                    //失败
                    layer.msg(result.message);
                }
            },"JSON");
    }
</script>
</html>