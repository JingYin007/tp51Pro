
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

/**
 * 当sku库存量变化时，对应总库存进行更新
 */
function onblur_sku_stock() {
    var input_goods_stock = 0;
    $('.input-sku-stock').each(function () {
        input_goods_stock += Number($(this).val());
    });
    $(".input-goods_stock").val(input_goods_stock);
}
/**
 * 点击删除属性信息
 * @param specID
 */
function delSpecInfoValue(specID) {
    //此时应该将对应的数据也删除
    for (var i = 0; i < arrSpecFull.length; i++) {
        if (arrSpecFull[i]["spec_id"] == specID) {
            arrSpecFull.splice(i, 1);
        }
    }
    ToRemoveDiv(".tr-specInfo-value-" + specID);
    goToMakeSaleGoodsMsg(arrSpecFull);
}

/**
 * 生成 "销售规格" 展示数据
 * @param arrSpecFull 源数组
 */
function goToMakeSaleGoodsMsg(arrSpecFull) {
    //console.log(arrSpecFull);
    var mLen = arrSpecFull.length;
    var index = 0;
    var digui = function (arr1, arr2) {
        var res = [];
        res["spec_info"] = [];
        arr1["spec_info"].forEach(function (m) {
            arr2["spec_info"].forEach(function (n) {
                var singleArr = [];
                singleArr["spec_name"] = m["spec_name"] + "," + n["spec_name"];
                singleArr["spec_id"] = m["spec_id"] + "," + n["spec_id"];
                res["spec_info"].push(singleArr);
            });
        });
        index++;
        if (index <= mLen - 1) {
            //TODO 這裏麻煩啊啊啊啊
            return digui(res, arrSpecFull[index])
        } else {
            return res;
        }
    };
    var resultArr = [];
    if (mLen >= 2) {
        resultArr = digui(arrSpecFull[index], arrSpecFull[++index]);
    } else {
        resultArr["spec_info"] = [];
        arrSpecFull[0]["spec_info"].forEach(function (m) {
            var singleArr = [];
            singleArr["spec_name"] = m["spec_name"];
            singleArr["spec_id"] = m["spec_id"];
            resultArr["spec_info"].push(singleArr);
        });
    }
    //console.log(resultArr);
    $(".tbody-specInfo-msg").html("");
    $.each(resultArr["spec_info"], function (i, e) {
        var eachHtml = "<tr>\n" +
            "                <td>" + e.spec_name +
            "<input type='hidden' name=\"sku_arr[" + e.spec_id + "][spec_id]\" value='" + e.spec_id + "'>" +
            "<input type='hidden' name=\"sku_arr[" + e.spec_id + "][spec_name]\" value='" + e.spec_name + "'>" +
            "                </td>\n" +
            "<td>\n" +
            "                    <div class=\"layui-upload layui-input-inline\">\n" +
            "                        <button type=\"button\" class=\"layui-btn btn_sku_upload_img\"\n" +
            "                         lay-data=\"{sku_index:"+i+"}\">\n" +
            "                            <i class=\"layui-icon\">&#xe67c;新</i>\n" +
            "                        </button>\n" +
            "                        <img class=\"layui-upload-img sku-img-upload-preview-"+ i +" img-upload-preview-medium img-upload-view\"\n" +
            "                             src=\"\">\n" +
            "                        <input type=\"hidden\" class=\"input-sku-img-"+ i +"\"\n" +
            "                               name=\"sku_arr["+ e.spec_id + "][sku_img]\"\n" +
            "                               value=\"\" required=\"\" class=\"layui-input\">\n" +
            "                    </div>\n" +
            "                </td>"+

            "                <td>\n" +
            "                    <input type=\"number\" name=\"sku_arr[" + e.spec_id + "][selling_price]\"\n" +
            "                           value=\"0.00\" required class=\"layui-input\">\n" +
            "                </td>\n" +
            "                <td>\n" +
            "                    <input type=\"number\" name=\"sku_arr[" + e.spec_id + "][stock]\"\n" +
            "                           value=\"0\" required onblur='onblur_sku_stock()' class=\"layui-input input-sku-stock\">\n" +
            "                </td>\n" +
            "                <td>\n" +
            "                    <input type=\"number\" name=\"sku_arr[" + e.spec_id + "][sold_num]\"\n" +
            "                           value=\"0\" required class=\"layui-input\">\n" +
            "                </td>\n" +
            "            </tr>";
        $(".tbody-specInfo-msg").append(eachHtml);
    });
    layui.use(['form', 'upload'], function() {
        var upload = layui.upload;
        upload.render({
            elem: '.btn_sku_upload_img'
            , type: 'images'
            , exts: 'jpg|png|gif' //设置一些后缀，用于演示前端验证和后端的验证
            //,auto:false //选择图片后是否直接上传
            ,accept:'images' //上传文件类型
            , url: '/api/upload/img_file'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                var sku_index = this.sku_index;
                obj.preview(function (index, file, result) {
                    $('.sku-img-upload-preview-'+sku_index).attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                dialog.tip(res.message);
                //如果上传成功
                if (res.status == 1) {
                    var sku_index = this.sku_index;
                    $('.input-sku-img-'+sku_index).val(res.data.url);
                }
            }
            , error: function () {
                //演示失败状态，并实现重传
                return layer.msg('上传失败,请重新上传');
            }
        });
    });
    //console.log('attr_info_json',JSON.stringify(arrSpecFull));
    $(".attr_info").val(JSON.stringify(arrSpecFull));
}

/**
 * 点击销售信息 触发事件
 * @param data
 */
function goToCbSpecInfo(data) {
    var spec_value = data.value;
    var arr_spec_value = spec_value.split("-"); //字符分割
    var specName = data.elem.title;
    var specFstID = arr_spec_value[0];
    var specID = arr_spec_value[1];
    var seledSpecFstName = arr_spec_value[2];
    var spec_checked = data.elem.checked;
    var singleArr = {};
    //console.log('checked:', spec_checked); //是否被选中，true或者false
    singleArr["spec_name"] = specName;
    singleArr["spec_id"] = specID;
    singleArr["specFstID"] = specFstID;

    if (spec_checked) {
        //TODO 如果为选中状态
        for (var i = 0; i < arrSpecFull.length; i++) {
            if (arrSpecFull[i]["spec_id"] == specFstID) {
                arrSpecFull[i]["spec_name"] = seledSpecFstName;
                arrSpecFull[i]["spec_info"].push(singleArr);
            }
        }
    }else {
        //TODO 如果是取消选中状态
        for (var i = 0; i < arrSpecFull.length; i++) {
            if (arrSpecFull[i]["spec_id"] == specFstID) {
                for(var j=0;j<arrSpecFull[i]['spec_info'].length;j++){
                    var spec_id_del = arrSpecFull[i]['spec_info'][j]['spec_id'];
                    if(spec_id_del == specID){
                        arrSpecFull[i]['spec_info'].splice(j, 1);
                    }
                }
            }
        }
    }
    //console.log('arrSpecFull:', arrSpecFull);
    goToMakeSaleGoodsMsg(arrSpecFull);
}

/**
 * ajax 获取规格子集数据，并拼接显示
 * @param toUrl
 * @param data
 * @param form
 */
function goToToSelSpecFst(toUrl,data,form) {
    var seledSpecFstID = data.value;
    var indexGID = data.elem.selectedIndex;
    var seledSpecFstName = data.elem[indexGID].title;

    $.post(
        toUrl,
        {seledSpecFstID: seledSpecFstID},
        function (result) {
            if (result.status > 0) {
                var eachHtml = "";
                $.each(result.data, function (i, e) {
                    eachHtml += " <input type='checkbox' lay-filter='cbSpecInfo' value='" + seledSpecFstID
                        + "-" + e.spec_id + "-" + seledSpecFstName + "' title='" + e.spec_name + "'>";
                });

                var replaceHtml = " <tr class=\"tr-specInfo-value-" + seledSpecFstID + "\">\n" +
                    "                <td onclick=\"delSpecInfoValue(" + seledSpecFstID + ")\">\n" +
                    "                    <label class=\"layui-form-label\" style='width: 100%' title=\"单击删除\">" + seledSpecFstName + "\n" +
                    "                        <span class=\"layui-badge layui-bg-gray span-del-specInfo\">x</span>\n" +
                    "                    </label>\n" +
                    "                </td>\n" +
                    "                <td>\n" + eachHtml +
                    "                </td>\n" +
                    "            </tr>";

                var arrSpecSel = {};
                arrSpecSel["spec_id"] = seledSpecFstID;
                arrSpecSel["spec_info"] = [];
                var tag = true;
                for (var i = 0; i < arrSpecFull.length; i++) {
                    if (arrSpecFull[i]["spec_id"] == seledSpecFstID) {
                        tag = false;
                        break;
                    }
                }
                if (tag) {
                    arrSpecFull.push(arrSpecSel);
                    $(".tbody-specInfo-value").append(replaceHtml);
                    form.render();
                }else {
                    layer.msg("您已选择该属性");
                }
            } else {
                //失败
                form.render();
                layer.msg(result.message);
            }
        }, "JSON");
}

/**
 * 选择商品的分类
 * @param toUrl
 * @param data
 * @param form
 */
function goToToSelCatID(toUrl,data,form) {
    //初始化 商品选择下拉列表
    var seledCatID = data.value;
    $("#toSelSpecFst").html("<option value=\"\">直接选择或搜索选择</option>");
    $.post(
        toUrl,
        {seledCatID: seledCatID},
        function (result) {
            if (result.status > 0) {
                var replaceHtml = "";
                $.each(result.data, function (i, e) {
                    replaceHtml += " <option title='" + e.spec_name + e.mark_msg
                        + "' value=\"" + e.spec_id + "\">" + e.spec_name + e.mark_msg + "</option>"
                });
                $("#toSelSpecFst").append(replaceHtml);
                form.render();
            } else {
                //失败
                form.render();
                layer.msg(result.message);
            }
        }, "JSON");
}


//单击图片删除图片 【注册全局函数】
function delMultipleImgs(this_img,editFlag) {
    //获取下标
    var subscript = $("#div-multiple-img-upload-preview img").index(this_img);
    //删除图片
    this_img.remove();
    //删除数组
    multiple_images.splice(subscript, 1);
    //重新排序
    multiple_images.sort();
    $('.multiple-show-img').val(multiple_images);
    if(editFlag == 1){
        //TODO 此时判断是否当前的图片拥有 upload_img_id 属性，如果有，ajax 进行数据库删除操作
        ajax_del_upload_img(this_img);
    }
    //返回
    return;
}

/**
 * ajax 删除所上传的图片
 * @param this_img
 */
function goToAjax_del_upload_img(toUrl,this_img) {
    var upload_img_id = $(this_img).attr("upload_img_id");
    if (upload_img_id > 0) {
        $.post(
            toUrl,
            {upload_img_id: upload_img_id},
            function (result) {
                if (result.status = 0) {
                    layer.msg(result.message);
                }
            }, "JSON");
    } else {
        //此时，不作处理
    }
}

layui.use('upload', function () {
    var upload = layui.upload;
    //商品缩略图片上传
    var uploadInst = upload.render({
        elem: '.btn_upload_img'
        , type: 'images'
        , exts: 'jpg|png|gif' //设置一些后缀，用于演示前端验证和后端的验证
        //,auto:false //选择图片后是否直接上传
        //,accept:'images' //上传文件类型
        , url: '/api/upload/img_file'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('.img-upload-preview').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            dialog.tip(res.message);
            //如果上传成功
            if (res.status == 1) {
                $('.menu-icon').val(res.data.url);
            }
        }
        , error: function () {
            //演示失败状态，并实现重传
            return layer.msg('上传失败,请重新上传');
        }
    });

    //多图片上传
    upload.render({
        elem: '#multiple-img-upload'
        , url: '/api/upload/img_file'
        , multiple: true
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#div-multiple-img-upload-preview')
                    .append('<img src="' + result + '" alt="' + file.name
                        + '" title="点击删除" upload_img_id="0" class="layui-upload-img" onclick="delMultipleImgs(this)">')
            });
        }
        , done: function (res) {
            //如果上传成功
            if (res.status == 1) {
                //追加图片成功追加文件名至图片容器
                multiple_images.push(res.data.url);
                $('.multiple-show-img').val(multiple_images);
            } else {
                dialog.tip(res.message);
            }
        }
    });

    //sku 商品单一图片上传
    upload.render({
        elem: '.btn_sku_upload_img'
        , type: 'images'
        , exts: 'jpg|png|gif' //设置一些后缀，用于演示前端验证和后端的验证
        //,auto:false //选择图片后是否直接上传
        ,accept:'images' //上传文件类型
        , url: '/api/upload/img_file'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            var sku_index = this.sku_index;
            obj.preview(function (index, file, result) {
                $('.sku-img-upload-preview-'+sku_index).attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            dialog.tip(res.message);
            //如果上传成功
            if (res.status == 1) {
                var sku_index = this.sku_index;
                $('.input-sku-img-'+sku_index).val(res.data.url);
            }
        }
        , error: function () {
            //演示失败状态，并实现重传
            return layer.msg('上传失败,请重新上传');
        }
    });
});