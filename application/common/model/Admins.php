<?php
namespace app\common\model;

use think\Model;

class Admins extends Model
{
    /**
     * 分页获取管理员数据
     * @param $curr_page
     * @param $limit
     * @return array
     */
    public function getAdminsForPage($curr_page,$limit){
        $res = $this
            ->alias('a')
            ->field('a.*,ar.user_name role_name')
            ->join('admin_roles ar','a.role_id = ar.id')
            ->order('a.id','desc')
            ->limit($limit*($curr_page - 1),$limit)
            ->select()
            ->toArray();

        foreach ($res as $key => $v){
            if ($v['status'] == 1) {
                $statusTip = '正常';
                $statusColor = 'blue';
            } else {
                $statusTip = '删除';
                $statusColor = 'cyan';
            }
            $roleTag = $v['role_id']%5;
            $role_name = $v['role_name'];
            switch ($roleTag){
                case 0:
                    $roleColor = 'orange';
                    break;
                case 1:
                    $roleColor = 'green';
                    break;
                case 3:
                    $roleColor = 'cyan';
                    break;
                default:
                    $roleColor = 'blue';
                    break;
            }
            $res[$key]['role_tip'] = "<span class=\"layui-badge-dot layui-bg-$roleColor\"></span>&nbsp;$role_name";
            $res[$key]['status_tip'] = "<span class=\"layui-badge layui-bg-$statusColor\">$statusTip</span>";
        }
        return $res;
    }

    /**
     * 获取后台可显示管理员用户的数目
     * @return mixed
     */
    public function getAdminsCount(){
        $res = $this
            ->field('*')
            ->count();
        return $res;
    }

    public function getAdminData($id){
        $res = $this
            ->alias('a')
            ->field('a.*,ar.user_name role_name')
            ->join('admin_roles ar','ar.id = a.role_id')
            ->where('a.id',$id)
            ->find()->toArray();
        return $res;
    }

    public function addAdmin($input){
        $sameTag = $this->chkSameUserName($input['user_name']);
        if ($sameTag){
            return showMsg(0,'此昵称已被占用，请换一个！');
        }else{
            $this->user_name = $input['user_name'];
            $this->picture = $input['picture'];
            $this->password = md5(base64_encode($input['password']));
            $this->created_at = time();
            $this->updated_at = time();
            $this->role_id = $input['role_id'];
            $this->status = $input['status'];
            $this->content = $input['content'];
            $this->save();
            return 1;
        }
    }

    public function editAdmin($id,$input){
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
                    'picture' => $input['picture'],
                    'role_id' => $input['role_id'],
                    'status' => $input['status'],
                    'content' => $input['content'],
                ];
                //TODO 如果输入了新密码
                if ($input['password']){
                    $saveData['password'] = md5(base64_encode($input['password']));
                }
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
    public function getAdminNavMenus($id = 1){
        $res = $this
            ->alias('a')
            ->field('ar.nav_menu_ids')
            ->join('admin_roles ar','ar.id = a.role_id')
            ->where('a.id',$id)
            ->find();
        return $res->nav_menu_ids;
    }
    public function adminLogin($input){
        $userName = $input['user_name'];
        $pwd = $input['password'];
        $res = $this
            ->field('password,id')
            ->where('user_name',$userName)
            ->where('status',1)
            ->find();
        if ($res){
            if ($res->password == md5(base64_encode($pwd))){
                return $res->id;
            }
        }
        return false;
    }













}
