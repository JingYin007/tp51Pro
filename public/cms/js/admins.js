/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageAdmins(toUrl,postData) {
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