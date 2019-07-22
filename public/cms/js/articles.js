/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageArticles(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-article-"+e.id+"\">\n" +
                        "                <td>"+e.id+"</td>\n" +
                        "                <td>《"+e.title+"》</td>\n" +
                        "                <td class=\"td-article\"><img src='"+e.picture+"'></td>\n" +
                        "                <td> <p class=\"p-article-abstract\">"+e.abstract+"</p></td>\n" +
                        "                <td>"+e.updated_at +"</td>\n" +
                        "                <td>"+e.list_order +"</td>\n" +
                        "                <td><input type=\"checkbox\" class=\"switch_checked\" lay-filter=\"switchArticleID\"\n" +
                        "switch_article_id=\""+e.id+"\" lay-skin=\"switch\""+e.status_checked+" lay-text=\"推荐|NO\">"+
                        "                </td>\n" +
                        "                <td>"+e.updated_at +"</td>\n" +
                        "                <td>" +e.status_tip +"</td>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"editArticle('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delArticle('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $(".tbody-articles").html(str_html);
                layui.form.render();//细节！这个好像要渲染一下！
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}