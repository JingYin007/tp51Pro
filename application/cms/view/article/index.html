@extends('cms.layouts.cms')

@section('body-content')

    <button class="layui-btn layui-btn-normal"
            onclick="addArticle()">
        <i class="layui-icon" >&#xe608;</i> 添加文章
    </button>
    <div class="layui-inline">
        <div class="layui-input-inline">
            <form class="form-search" action="{{url('cms/article/index')}}" method="post">
                <input type="hidden" name="_token" class="tag_token" value="<?php echo csrf_token(); ?>">
                <input type="hidden" name="curr_page" class="curr_page" value="1">
            </form>
        </div>
    </div>

    <table class="layui-table table-body" lay-even="" lay-skin="row">
        <colgroup>
            <col width="5%">
            <col width="20%">
            <col width="10%">
            <col width="35%">
            <col width="10%">
            <col width="5%">
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>标题</th>
            <th>图片</th>
            <th>摘要</th>
            <th>创建时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody class="tbody-articles">
        @foreach($articles as $vo)
            <tr class="tr-article-{{$vo['id']}}">
                <td>{{$vo['id']}}</td>
                <td>《{{$vo['title']}}》</td>
                <td class="td-article">
                    <img src="{{$vo['picture']}}" class="">
                </td>
                <td>
                    <p class="p-article-abstract">{{$vo['abstract']}}</p>
                </td>
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
                                onclick="editArticle('{{$vo['id']}}')">
                            <i class="layui-icon"></i>
                        </button>
                        <button class="layui-btn layui-btn-sm"
                                onclick="delArticle('{{$vo['id']}}')">
                            <i class="layui-icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection

@section('single-content')
    <script src="{{asset('cms/js/moZhang.js')}}"></script>
    <script>
        //根据菜单ID 删除菜单记录
        function delArticle(id) {
            var toUrl = "{{url('cms/article/edit/0')}}";
            ToDelItem(id,toUrl,'.tr-article-'+id);
        }
        $(".btn-search-navMenu").on('click',function () {
            //var str_search = $(".search_input").val();
            $(".form-search").submit();
        });
        //添加导航菜单
        function addArticle() {
            var toUrl = "{{url('cms/article/add')}}";
            ToOpenPopups(toUrl,'文章添加');
        }
        //根据菜单ID修改菜单信息
        function editArticle(id) {
            var toUrl = "{{url('cms/article/edit/0')}}"+id;
            ToOpenPopups(toUrl,'文章修改');
        }
    </script>



@endsection