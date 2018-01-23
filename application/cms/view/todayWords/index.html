@extends('cms.layouts.cms')

@section('body-content')

    <button class="layui-btn layui-btn-normal"
            onclick="addTodayWords()">
        <i class="layui-icon" >&#xe608;</i> 添加赠言
    </button>
    <div class="layui-inline">
        <div class="layui-input-inline">
            <form class="form-search" action="{{url('cms/todayWords')}}" method="post">
                <input type="hidden" name="_token" class="tag_token" value="<?php echo csrf_token(); ?>">
                <input type="hidden" name="record_num" class="record_num" value="<?php echo $record_num; ?>">
                <input type="hidden" name="page_limit" class="page_limit" value="{{$page_limit}}">
                <input type="hidden" name="curr_page" class="curr_page" value="1">
            </form>
        </div>
    </div>

    <table class="layui-table table-body" lay-even="" lay-skin="row">
        <colgroup>
            <col width="5%">
            <col width="15%">
            <col width="10%">
            <col width="45%">
            <col width="10%">
            <col width="5%">
            <col width="15%">
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>出处</th>
            <th>图片</th>
            <th>内容</th>
            <th>创建时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody class="tbody-todayWords">
        @foreach($menus as $vo)
            <tr class="tr-menu-{{$vo['id']}}">
                <td>{{$vo['id']}}</td>
                <td>《{{$vo['from']}}》</td>
                <td class="td-todayWord">
                        <img src="{{$vo['picture']}}" class="layui-circle">
                </td>
                <td>{{$vo['word']}}</td>
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
                                onclick="editTodayWord('{{$vo['id']}}')">
                            <i class="layui-icon"></i>
                        </button>
                        <button class="layui-btn layui-btn-sm"
                                onclick="delTodayWord('{{$vo['id']}}')">
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
        function delTodayWord(id) {
            var toUrl = "{{url('cms/todayWords/edit/0')}}";
            ToDelItem(id,toUrl,'.tr-menu-'+id);
        }
        $(".btn-search-navMenu").on('click',function () {
            //var str_search = $(".search_input").val();
            $(".form-search").submit();
        });
        //通过ajax 获取分页数据
        function ajaxOpForPage(curr_page) {
            var toUrl = "{{url('cms/todayWords/ajaxOpForPage')}}";
            $(".curr_page").val(curr_page);
            var postData = $(".form-search").serialize();
            ToAjaxOpForPage(toUrl,postData);
        }
        //添加导航菜单
        function addTodayWords() {
            var toUrl = "{{url('cms/todayWords/add')}}";
            ToOpenPopups(toUrl,'添加今日赠言');
        }
        //根据菜单ID修改菜单信息
        function editTodayWord(id) {
            var toUrl = "{{url('cms/todayWords/edit/0')}}"+id;
            ToOpenPopups(toUrl,'今日赠言修改');
        }
    </script>



@endsection