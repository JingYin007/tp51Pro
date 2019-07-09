
/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageUsers(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = "";
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-order-"+e.id+"\">\n" +
                        "        <td>"+e.id+"</td>\n" +
                        "        <td>\n" +
                        "            <img class=\"user_avatar layui-nav-img\" src=\""+e.user_avatar+"\">\n" +
                        "        </td>\n" +
                        "        <td>\n" +
                        "            <span class=\"span-FF9233\">"+e.nick_name+" </span>\n" +
                        "        </td>\n" +
                        "        <td>"+e.sex+"</td>\n" +
                        "        <td>\n" +
                        "            <span class=\"span-FF9233\">"+e.user_name+" </span>\n" +
                        "        </td>\n" +
                        "\n" +
                        "        <td>\n" +
                        "            <span class=\"span-7EC0EE\">"+e.integral+"</span><br>\n" +
                        "        </td>\n" +
                        "        <td>"+e.user_status_tip+"</td>\n" +
                        "        <td>"+e.reg_time2+"</td>\n" +
                        "        <td>\n" +
                        "            <div class=\"layui-btn-group\">\n" +
                        "                <button class=\"layui-btn layui-btn-normal layui-btn-sm\" title=\"状态审核\"\n" +
                        "                        onclick=\"checkToStatus('"+e.id+"')\">\n" +
                        "                    <i class=\"layui-icon\">&#xe60e;</i>\n" +
                        "                </button>\n" +
                        "            </div>\n" +
                        "        </td>\n" +
                        "    </tr>";
                });
                $(".tbody-users").html(str_html);
                layui.form.render();//细节！这个好像要渲染一下！
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}