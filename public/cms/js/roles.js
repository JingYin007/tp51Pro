/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageRoles(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    var bgStr = 'layui-bg-';
                    var bgStr2 = '';
                    var tag = (e.role_id)%5;
                    if(tag == 1){
                        bgStr2 = "orange";
                    }else if(tag == 2){
                        bgStr2 = "green";
                    }else if(tag == 3){
                        bgStr2 = "cyan";
                    }else if(tag == 4){
                        bgStr2 = "black";
                    }else {
                        bgStr2 = "blue";
                    }
                    bgStr += bgStr2;


                    str_html +=
                        "<tr class=\"tr-admin-"+e.id+"\">\n" +
                        "                <td>"+e.id+"</td>\n" +
                        "                <td>"+e.user_name+"</td>\n" +
                        "                <td><span class='layui-badge-dot " +bgStr+
                        "'></span>&nbsp;&nbsp;"+e.role_name+"</td>\n"+

                        "                <td>"+e.created_at +"</td>\n" +
                        "                <td>" +e.status_tip +"</td>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"editAdmin('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\"></i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delAdmin('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\"></i>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $(".tbody-admins").html(str_html);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}

//父级菜单的选择
$(".table-nav-menus .td-menu-parent").click(function () {
    //判断当前是否选中状态
    var tag = $(this).children("input[type='checkbox']").is(':checked');
    if(tag){
        //TODO 此时为选中状态
        $(this).next().children(".layui-form-checkbox").addClass("layui-form-checked");
        var cb_menu = $(this).next().children(".cb-nav-menu");
        for (var i = 0; i < cb_menu.length; i++) {cb_menu[i].checked = true;}
        $(this).next().children(".cb-nav-menu").attr('disabled',false);
    }else {
        $(this).next().children(".layui-form-checkbox").removeClass("layui-form-checked");
        $(this).next().children(".cb-nav-menu").attr('disabled',true);
        var cb_menu = $(this).next().children(".cb-nav-menu");

        for (var i = 0; i < cb_menu.length; i++) {cb_menu[i].checked = false;}
    }
});
/**
 * 获取所有被选中的导航菜单
 */
function dealSelNavMenuIDs() {
    var navmenuIDs = "";
    $(".table-nav-menus input[type='checkbox']:checked").each(function(i)
    {
        navmenuIDs += $(this).val()+"|";
    });
    $(".nav_menu_ids").val(navmenuIDs);
}