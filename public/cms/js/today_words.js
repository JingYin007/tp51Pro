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