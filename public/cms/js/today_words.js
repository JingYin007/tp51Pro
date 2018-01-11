/**
 * 导航菜单处理函数 包括 "添加"、"修改"
 * @param op_url
 * @param tag
 */
function ToOpTodayWords(op_url,tag) {
    var title = '';
    if(tag == 'add'){
        title = '添加今日赠言';
    }else {
        title = '今日赠言修改';
    }
    layer.open({
        type: 2,
        moveOut: true,
        title: title,
        maxmin: true, //开启最大化最小化按钮
        area: ['50%', '65%'],
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
function ToPostWordsDeal(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            dialog.tip(result.message);
            if(result.status == 1){
                setTimeout(function(){
                    window.parent.location.reload();
                    parent.layer.close(index);
                },2000);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}

/**
 * 删除导航菜单
 * @param id 菜单ID
 * @param toUrl 请求 URL
 * @constructor
 */
function ToDelTodayWord(id,toUrl) {
    var tag_token = $(".tag_token").val();
    var postData = {'id':id,'tag':'del','_token':tag_token};
    layer.msg('确定要删除此赠言吗？', {
        time: 0 //不自动关闭
        ,btn: ['确定', '离开']
        ,yes: function(index){
            afterDelTodayWord(toUrl,postData,id);
        }
    });
}

/**
 * 删除菜单数据后的页面处理
 * @param toUrl
 * @param postData
 * @param id
 */
function afterDelTodayWord(toUrl,postData,id) {
    $.post(
        toUrl,
        postData,
        function (result) {
            dialog.tip(result.message);
            if(result.status == 1){
                ToRemoveDiv(".tr-menu-"+id);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}

// 出去页面所显示的记录 传递 div
function ToRemoveDiv(tag) {
    $(tag).remove();
}

/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPage(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-menu-"+e.id+"\">\n" +
                        "                <td>"+e.id+"</td>\n" +
                        "                <td>"+e.from+"</td>\n" +
                        "                <td class=\"td-menu\"><img class='layui-circle' src='"+e.picture+"'></td>\n" +
                        "                <td>"+e.word+"</td>\n" +
                        "                <td>"+e.created_at +"</td>\n" +
                        "                <td>" +e.status_tip +"</td>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"editTodayWord('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\"></i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delTodayWord('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\"></i>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $(".tbody-navMenus").html(str_html);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}