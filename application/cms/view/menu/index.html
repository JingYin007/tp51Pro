@extends('cms.layouts.cms')

@section('body-content')

    <button class="layui-btn layui-btn-normal"
            onclick="addNavMenu()">
        <i class="layui-icon" >&#xe608;</i> 添加导航
    </button>
    <div class="layui-inline">
        <div class="layui-input-inline">
            <form class="form-search" action="{{url('cms/menu')}}" method="post">
                <input type="hidden" name="_token" class="tag_token" value="<?php echo csrf_token(); ?>">
                <input type="hidden" name="record_num" class="record_num" value="<?php echo $record_num; ?>">
                <input type="hidden" name="page_limit" class="page_limit" value="{{$page_limit}}">
                <input type="hidden" name="curr_page" class="curr_page" value="1">
                <input type="text" value="{{$search}}" name="str_search"  placeholder="请输入关键字"
                       class="layui-input search_input">
            </form>
        </div>
        <button class="layui-btn-warm btn-search-navMenu">
            <i class="layui-icon" >&#xe615;</i>
        </button>
    </div>

    <table class="layui-table table-body" lay-even="" lay-skin="row">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>导航标题</th>
            <th>图标</th>
            <th>action</th>
            <th>父级ID</th>
            <th>排序</th>
            <th>创建时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody class="tbody-navMenus">
        @foreach($menus as $vo)
            <tr class="tr-menu-{{$vo['id']}}">
                <td>{{$vo['id']}}</td>
                <td>{{$vo['name']}}</td>
                <td class="td-menu"><img src="{{$vo['icon']}}"></td>
                <td>{{$vo['action']}}</td>
                <td>{{$vo['parent_id']}}</td>
                <td>{{$vo['list_order']}}</td>
                <td>{{$vo['created_at']}}</td>
                <td>
                    @if($vo['status'] == 1)
                        <span class="layui-badge layui-bg-blue">正常</span>
                    @else
                        <span class="layui-badge layui-bg-cyan">删除</span>
                    @endif
                </td>
                <td>
                    <div class="layui-btn-group">
                        <button class="layui-btn layui-btn-sm"
                                onclick="editNavMenu('{{$vo['id']}}')">
                            <i class="layui-icon"></i>
                        </button>
                        <button class="layui-btn layui-btn-sm"
                                onclick="delNavMenu('{{$vo['id']}}')">
                            <i class="layui-icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>


    <div id="demo2-1"></div>

@endsection

@section('single-content')
    <script src="{{asset('cms/js/nav_menu.js')}}"></script>
    <script src="{{asset('cms/js/moZhang.js')}}"></script>
    <script>
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage;
            var page_limit = $(".page_limit").val();
            var record_num = $(".record_num").val();
            laypage.render({
                elem: 'demo2-1'
                ,limit:page_limit
                ,count: record_num
                ,jump: function(obj, first){
                    //obj包含了当前分页的所有参数
                    //首次不执行
                    if(!first){
                        //layer.msg(obj.curr);
                        ajaxOpForPage(obj.curr);
                    }
                }
                ,theme: '#FF5722'
            });
        });
    </script>
    <script>
        //根据菜单ID 删除菜单记录
        function delNavMenu(id) {
            var toUrl = "{{url('cms/menu/edit/0')}}";
            ToDelItem(id,toUrl,'.tr-menu-'+id);
        }
        $(".btn-search-navMenu").on('click',function () {
            //var str_search = $(".search_input").val();
            $(".form-search").submit();
        });
        //通过ajax 获取分页数据
        function ajaxOpForPage(curr_page) {
            var toUrl = "{{url('cms/menu/ajaxOpForPage')}}";
            $(".curr_page").val(curr_page);
            var postData = $(".form-search").serialize();
            ToAjaxOpForPage(toUrl,postData);
        }
        //添加导航菜单
        function addNavMenu() {
            var toUrl = "{{url('cms/menu/add')}}";
            ToOpenPopups(toUrl,'添加导航菜单');
        }
        //根据菜单ID修改菜单信息
        function editNavMenu(id) {
            var toUrl = "{{url('cms/menu/edit/0')}}"+id;
            ToOpenPopups(toUrl,'菜单信息修改');
        }
    </script>



@endsection