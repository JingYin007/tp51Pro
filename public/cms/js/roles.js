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