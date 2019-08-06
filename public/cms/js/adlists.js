/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageAdvertisement(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-act-"+e.id+"\">\n" +
                        "                <td>"+e.id+"</td>\n" +
                        "                <td>"+e.ad_name+"</td>\n" +
                        "                <td><img src='"+e.original_img+"'></td>\n" +
                        "                <td class=\"td-ad_tag\">"+e.ad_tag +"</td>\n" +
                        "                <td>"+e.ad_url +"</td>\n" +
                        "                <td>"+e.start_time+"<hr/>"+ e.end_time +"</td>\n" +
                        "                <td>"+e.type_tip +"</td>\n" +
                        "                <td><input type=\"checkbox\" class=\"switch_checked\" lay-filter=\"switchActID\"\n" +
                        "switch_act_id=\""+e.id+"\" lay-skin=\"switch\""+e.status_checked+" lay-text=\"显示|隐藏\">"+
                        "                </td>\n" +
                        "                <td>"+e.list_order +"</td>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"editAdvertisement('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delAdvertisement('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $(".tbody-ads").html(str_html);
                layui.form.render();//细节！这个好像要渲染一下！
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}