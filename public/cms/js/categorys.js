/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageCategorys(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-article-"+e.cat_id+"\">\n" +
                        "                <td>"+e.cat_id+"</td>\n" +
                        "                <td>"+e.cat_name+"</td>\n" +
                        "                <td class=\"td-menu\"><img src='"+e.icon+"'></td>\n" +
                        "                <td>"+e.parent_name +"</td>\n" +
                        "                <td>"+e.list_order +"</td>\n" +
                        "                <td><input type=\"checkbox\" class=\"switch_checked\" lay-filter=\"switchCatID\"\n" +
                        "switch_cat_id=\""+e.cat_id+"\" lay-skin=\"switch\""+e.status_checked+" lay-text=\"显示|隐藏\">"+
                        "                </td>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"editCategory('"+e.cat_id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delCategory('"+e.cat_id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $(".tbody-categorys").html(str_html);
                layui.form.render();//细节！这个好像要渲染一下！
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}