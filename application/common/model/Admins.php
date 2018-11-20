<?php
namespace app\common\model;

use app\common\validate\Admin;
use think\Model;

class Admins extends BaseModel
{
    protected $validate;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new Admin();
    }

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
            ->where("a.status",1)
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
            ->where("status",1)
            ->count();
        return $res;
    }

    /**
     * 根据ID 获取管理员数据
     * @param $id
     * @return array
     */
    public function getAdminData($id){
        $res = $this
            ->alias('a')
            ->field('a.*,ar.user_name role_name')
            ->join('admin_roles ar','ar.id = a.role_id')
            ->where('a.id',$id)
            ->find()->toArray();
        return $res;
    }

    /**
     * 添加后台管理员
     * @param $input
     * @return int|void
     */
    public function addAdmin($input){
        $user_name = isset($input['user_name'])?$input['user_name']:'';
        $sameTag = $this->chkSameUserName($user_name);
        if ($sameTag){
            $validateRes['tag'] = 0;
            $validateRes['message'] = '此昵称已被占用，请换一个！';
        }else{
            $addData = [
                'user_name' => $user_name,
                'picture'   => isset($input['picture'])?$input['picture']:'',
                'password'  => md5(base64_encode($input['password'])),
                'created_at' => date("Y-m-d H:i:s",time()),
                'role_id'   => intval($input['role_id']),
                'status'    => intval($input['status']),
                'content'   => $input['content'],
            ];
            $validateRes = $this->validate($this->validate, $addData);
            if ($validateRes['tag']) {
                $tag = $this->insert($addData);
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag ? '管理员添加成功' : '添加失败';
            }
        }
        return $validateRes;

    }

    /**
     * 根据ID 修改管理员数据
     * @param $id
     * @param $input
     * @return void|static
     */
    public function editAdmin($id,$input){
        $opTag = isset($input['tag']) ? $input['tag']:'edit';
        if ($opTag == 'del'){
            $tag = $this
                ->where('id',$id)
                ->update(['status' => -1]);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag? '管理员删除成功':'Sorry,管理员删除失败！';
        }else{
            $sameTag = $this->chkSameUserName($input['user_name'],$id);
            if ($sameTag){
                $validateRes['tag'] = 0;
                $validateRes['message'] = '此昵称已被占用，请换一个！';
            }else{
                $saveData = [
                    'user_name' => $input['user_name'],
                    'picture' => $input['picture'],
                    'role_id' => $input['role_id'],
                    'status' => $input['status'],
                    'content' => $input['content'],
                ];
                $validateRes = $this->validate($this->validate, $saveData);
                if ($validateRes['tag']){
                    if ($input['password']){
                        //TODO 如果输入了新密码
                        $saveData['password'] = md5(base64_encode($input['password']));
                    }
                    $tag = $this
                        ->where('id',$id)
                        ->update($saveData);
                    $validateRes['message'] = $tag ? '管理员修改成功' : '数据无表动，修改失败';
                }
            }
        }
        return $validateRes;
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
            ->count();
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
