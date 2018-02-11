<?php
namespace app\common\model;

use think\Model;

class AdminRoles extends Model
{
    /**
     * 获取正常角色列表
     * @return mixed
     */
    public function getNormalRoles(){
        $res = $this
            ->where('status',1)
            ->select()->toArray();
        return $res;
    }
    /*
     * 获取所有的角色列表
     */
    public function getAllRoles(){
        $res = $this
            ->where('status','<>',0)
            ->order('status','desc')
            ->order('created_at','desc')
            ->select()->toArray();
        foreach ($res as $key => $v){
            if ($v['status'] == 1){
                $res[$key]['status_tip'] = "<span class=\"layui-badge layui-bg-blue\">正常</span>";
            }else{
                $res[$key]['status_tip'] = "<span class=\"layui-badge layui-bg-cyan\">删除</span>";
            }
        }
        return $res;
    }

    /**
     * 添加新角色
     * @param $input
     * @return mixed
     */
    public function addRole($input){
        $user_name = $input['user_name'];
        $checkSameTag = $this->chkSameUserName($user_name);
        if ($checkSameTag){
            return showMsg(0,'此昵称已被占用，请换一个！');
        }else{
            $this->user_name = $input['user_name'];
            $this->status = $input['status'];
            $this->nav_menu_ids = $input['nav_menu_ids'];
            $this->save();
            return $this->id;
        }
    }
    public function editRole($id,$input){
        $opTag = isset($input['tag']) ? $input['tag']:'edit';
        if ($opTag == 'del'){
            $tag = $this
                ->where('id',$id)
                ->update(['status' => -1]);
        }else{
            $sameTag = $this->chkSameUserName($input['user_name'],$id);
            if ($sameTag){
                return showMsg(0,'此昵称已被占用，请换一个！');
            }else{
                $saveData = [
                    'user_name' => $input['user_name'],
                    'status' => $input['status'],
                    'nav_menu_ids' => $input['nav_menu_ids'],
                ];
                $tag = $this
                    ->where('id',$id)
                    ->update($saveData);
            }
        }
        return $tag;
    }

    /**
     * 判断当前数据库中是否有重名的管理员
     * @param $user_name
     * @param int $id
     * @return mixed
     */
    public function chkSameUserName($user_name,$id = 0){
        $tag = $this
            ->field('user_name')
            ->where('user_name',$user_name)
            ->where('id','<>',$id)
            ->find();
        return $tag;
    }

    public function getRoleData($id){
        $res = $this
            ->field('*')
            ->where('id',$id)
            ->find()->toArray();
        return $res;
    }











}
