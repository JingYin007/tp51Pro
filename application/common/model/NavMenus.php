<?php
namespace app\common\model;
use think\Db;
use \think\Model;
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */

class NavMenus extends Model
{
    /**
     * 获取当前管理员权限下的 导航菜单
     * @return mixed
     */
    public function getNavMenusShow(){
        $res = $this
            ->field('*')
            ->where('id > 0 and parent_id = 0 and status = 1')
            ->order('list_order desc')
            ->select()
            ->toArray();
        foreach ($res as $key => $value){
            $parent_id = $value['id'];
            $childRes = $this
                ->where('parent_id = '.$parent_id)
                ->where('status = 1')
                ->order('list_order desc')
                ->select()
                ->toArray();
            $res[$key]['child'] = $childRes;
        }
        return $res;
    }

    /**
     * 获取全部可修改状态的 导航菜单数据
     * @param null $id 导航菜单 ID 标识
     * @return mixed
     */
    public function getNavMenuByID($id = 0){
        $res = $this
            ->alias('nm')
            ->field('nm.*,nm2.namez parent_name')
            ->join('nav_menus nm2','nm.parent_id = nm2.id')
            ->where('nm.id',$id)
            ->find();
        return $res->toArray();
    }

    public function getNavMenusCount($search = null){
        if ($search){
            //如果有查询限制
            $res = $this
                ->field('*')
                ->where('id','>','0')
                ->whereLike('namez','%'.$search.'%')
                //->orWhere('action','like','%'.$search.'%')
                ->order('list_order','desc')
                ->order('created_at','desc')
                ->count();
        }else{
            $res = $this
                ->field('*')
                ->where('id > 0')
                ->order('list_order','desc')
                ->order('created_at','desc')
                ->count();
        }
        return $res;
    }
    public function getNavMenusForPage($curr_page,$limit,$search = null){
        $res = $this
            ->field('*')
            ->where('id > 0')
            ->whereLike('namez','%'.$search.'%')
            ->order('list_order','desc')
            ->order('created_at','desc')
            ->limit($limit*($curr_page - 1),$limit)
            ->select()
            ->toArray();
        foreach ($res as $key => $v){
            if ($v['status'] == 1){
                $res[$key]['status_tip'] = "<span class=\"layui-badge layui-bg-blue\">正常</span>";
            }else{
                $res[$key]['status_tip'] = "<span class=\"layui-badge layui-bg-cyan\">删除</span>";
            }
        }
        return $res;
    }

    public function addNavMenu($data){
        $this->namez = $data['namez'];
        $this->parent_id = $data['parent_id'];
        $this->action = $data['action']?$data['action']:'';
        $this->icon = $data['icon']?$data['icon']:'';
        $this->created_at = time();
        $this->updated_at = time();
        $this->list_order = $data['list_order'];
        $this->status = $data['status'];
        $this->save();
    }

    public function editNavMenu($id,$data){
        $opTag = isset($data['tag']) ? $data['tag']:'edit';
        if($opTag == 'del'){
            $tag = $this
                ->where('id',$id)
                ->update(['status' => -1]);
        }else{
            $tag = $this
                ->where('id',$id)
                ->update(
                    [
                        'namez' => $data['namez'],
                        'icon' => $data['icon'],
                        'list_order' => $data['list_order'],
                        'parent_id' => $data['parent_id'],
                        'action' => $data['action']?$data['action']:'',
                        'status' => $data['status'],
                    ]);
        }
        return $tag;
    }
}