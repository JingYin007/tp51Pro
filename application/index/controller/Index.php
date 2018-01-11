<?php
namespace app\index\controller;

class Index
{
    public function index()
    {
        var_dump('index');
        $data = ['name'=>'MoTzxx'];
        return view('index',$data);
    }

}
