<?php
namespace app\common\model;

use app\common\controller\Base;
use app\common\validate\AdminRole;
use think\Model;

class AdminRoles extends BaseModel
{
    protected $validate;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new AdminRole();
    }

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
            ->where('status','<>',-1)
            ->order('status','desc')
            ->order('updated_at','desc')
            ->select()->toArray();
        foreach ($res as $key => $v){
            $role_name = $v['user_name'];
            $res[$key]['role_tip'] = "$role_name";
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
        $user_name = isset($input['user_name'])?$input['user_name']:'';
        $checkSameTag = $this->chkSameUserName($user_name);
        if ($checkSameTag){
            $validateRes['tag'] = 0;
            $validateRes['message'] = '此昵称已被占用，请换一个！';
        }else{
            $addData = [
                'user_name' => $user_name,
                'nav_menu_ids'  => $input['nav_menu_ids']?$input['nav_menu_ids']:'',
                'updated_at' => date("Y-m-d H:i:s",time()),
                'status'    => intval($input['status']),
            ];
            $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
            $validateRes = $this->validate($this->validate, $addData, $tokenData);
            if ($validateRes['tag']) {
                $tag = $this->insert($addData);
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag ? '角色添加成功' : '角色添加失败';
            }
        }
        return $validateRes;
    }

    /**
     * 修改角色数据
     * @param $id
     * @param $input
     * @return void|static
     */
    public function editRole($id,$input){
        $opTag = isset($input['tag']) ? $input['tag']:'edit';
        if ($opTag == 'del'){
            $tag = $this
                ->where('id',$id)
                ->update(['status' => -1]);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag? '角色删除成功':'Sorry,角色删除失败！';
        }else{
            $sameTag = $this->chkSameUserName($input['user_name'],$id);
            if ($sameTag){
                $validateRes['tag'] = 0;
                $validateRes['message'] = '此昵称已被占用，请换一个！';
            }else{
                $saveData = [
                    'user_name' => $input['user_name'],
                    'status' => $input['status'],
                    'nav_menu_ids' => $input['nav_menu_ids'],
                ];
                $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
                $validateRes = $this->validate($this->validate, $saveData, $tokenData);
                if ($validateRes['tag']){
                    $tag = $this
                        ->where('id',$id)
                        ->update($saveData);
                    $validateRes['message'] = $tag ? '角色修改成功' : '数据无变动，修改失败';
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

    /**
     * 获取不同角色对应的数据
     * @param $id
     * @return array|null|\PDOStatement|string|Model
     */
    public function getRoleData($id){
        $res = $this
            ->field('*')
            ->where('id',$id)
            ->find();
        return $res;
    }


}
