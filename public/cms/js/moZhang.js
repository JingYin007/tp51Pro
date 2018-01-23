/*自定义js事件 by:moTzxx*/

$(document).ready(function () {
    /**
     * 左侧导航栏 显示与隐藏的设置
     */
    $(".layui-header .menu-switch").click(function () {
        var leftView = $(".layui-bg-black");
        var hidden = leftView.is(':hidden');
        var layui_body = $(".layui-layout-admin .layui-body");
        var layui_footer = $(".layui-layout-admin .layui-footer");
        leftView.animate({width: 'toggle'});
        if(hidden){
            //如果当前 左侧导航栏是隐藏状态
            slide_leftView(layui_body,1);
            slide_leftView(layui_footer,1);
        }else {
            //如果当前 左侧导航栏是显示状态
            slide_leftView(layui_body,0);
            slide_leftView(layui_footer,0);
        }
    });

    $(".layui-tab-title .layui-this").click(function () {
        var tag = $(this).hasClass('title-selected');
        if(!tag){
            $(".layui-tab-title .layui-this").removeClass('title-selected');
            $(this).addClass('title-selected');
            var url = $(this).attr('url');
            $(".layui-body .iframe-body").attr('src',url);
        }
    });

    $(".layui-side-scroll .a-to-Url").click(function () {
        var action = $(this).attr('action');
        $(".layui-body .iframe-body").attr('src',action);

    });

    // 全屏切换
    $("#FullScreen").click(function () {
        var fullscreenElement =
            document.fullscreenElement ||
            document.mozFullScreenElement ||
            document.webkitFullscreenElement;

        if (fullscreenElement == null) {
            entryFullScreen();
            $("#FullScreen span").html('退出全屏');
            $(".layui-nav-item .img-FullScreen").attr('src','../cms/images/icon/fullscreen_exit.png')
        } else {
            exitFullScreen();
            $("#FullScreen span").html('全屏');
            $(".layui-nav-item .img-FullScreen").attr('src','../cms/images/icon/fullscreen.png')
        }
    });

    $(".mul-to-Url").click(function () {
        var all_nav = $('.layui-nav-child').parent();
        all_nav.removeClass('layui-nav-itemed');
        $(this).parent().parent().parent().addClass('layui-nav-itemed');
    });
    $(".single-to-Url").click(function () {
        var all_nav = $('.layui-nav-item');
        all_nav.removeClass('layui-nav-itemed');
    });





});

/**
 * 控制左侧导航栏 显示/隐藏
 * @param viewTag 对应标签
 * @param tag 1：显示  0：隐藏
 */
function slide_leftView(viewTag,tag) {
    if (tag){
        viewTag.animate({left:parseInt(viewTag.css('left'),200) == 200 ? + viewTag.outerWidth() : 200});
    }else {
        viewTag.animate({left:parseInt(viewTag.css('left'),10) == 0 ? - viewTag.outerWidth() : 0});
    }
}


// 进入全屏：
function entryFullScreen() {
    var docE = document.documentElement;
    if (docE.requestFullScreen) {
        docE.requestFullScreen();
    } else if (docE.mozRequestFullScreen) {
        docE.mozRequestFullScreen();
    } else if (docE.webkitRequestFullScreen) {
        docE.webkitRequestFullScreen();
    }
}

// 退出全屏
function exitFullScreen() {
    var docE = document;
    if (docE.exitFullscreen) {
        docE.exitFullscreen();
    } else if (docE.mozCancelFullScreen) {
        docE.mozCancelFullScreen();
    } else if (docE.webkitCancelFullScreen) {
        docE.webkitCancelFullScreen();
    }
}

// 除去页面所显示的记录 传递 div
function ToRemoveDiv(tag) {
    $(tag).remove();
}

/**
 * 导航菜单处理函数 包括 "添加"、"修改"
 * @param op_url URL 地址
 * @param tag 操作标识：add / edit
 * @param title
 * @constructor
 */
function ToOpenPopups(op_url,title) {
    layer.open({
        type: 2,
        moveOut: true,
        title: title,
        maxmin: true, //开启最大化最小化按钮
        area: ['70%', '65%'],
        content: op_url, //可以出现滚动条
        //content: [op_url, 'no'], //如果你不想让iframe出现滚动条
    });
}
/**
 * 对导航菜单的 ajax请求处理
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToPostPopupsDeal(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            dialog.tip(result.message);
            if(result.status == 1){
                setTimeout(function(){
                    window.parent.location.reload();
                    //parent.layer.close(index);
                },2000);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}
/**
 * 删除记录
 * @param id 记录ID
 * @param toUrl 请求 URL
 * @constructor
 */
function ToDelItem(id,toUrl,remove_class) {
    var tag_token = $(".tag_token").val();
    var postData = {'id':id,'tag':'del','_token':tag_token};
    layer.msg('确定要删除此条记录吗？', {
        time: 0 //不自动关闭
        ,btn: ['确定', '离开']
        ,yes: function(index){
            afterDelItem(toUrl,postData,remove_class);
        }
    });
}
function afterDelItem(toUrl,postData,remove_class) {
    $.post(
        toUrl,
        postData,
        function (result) {
            dialog.tip(result.message);
            if(result.status == 1){
                ToRemoveDiv(remove_class);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}