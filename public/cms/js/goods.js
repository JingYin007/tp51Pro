/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageGoods(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-article-"+e.goods_id+"\">\n" +
                        "                <td>"+e.goods_id+"</td>\n" +
                        "                <td class=\"td-goods_name-\">"+e.goods_name+"</td>\n" +
                        "                <td class=\"td-goods\"><img src='"+e.thumbnail+"'></td>\n" +
                        "                <td class=\"td-goods_name\">"+e.cat_name +"</td>\n" +
                        "                <td class=\"td-greyxx\">"+e.reference_price +"</td>\n" +
                        "                <td class=\"td-selling_price\">"+e.selling_price +"</td>\n" +
                        "                <td class=\"td-stock\">"+e.stock +"</td>\n" +
                        "                <td class=\"td-weight\">"+e.list_order +"</td>\n" +
                        "                <td>"+e.updated_at +"</td>\n" +
                        "                <td><input type=\"checkbox\" class=\"switch_checked\" lay-filter=\"switchGoodsID\"\n" +
                        "switch_goods_id=\""+e.goods_id+"\" lay-skin=\"switch\""+e.status_checked+" lay-text=\"上架|下架\">"+
                        "                </td>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"editGoods('"+e.goods_id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delGoods('"+e.goods_id+"')\">\n" +
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