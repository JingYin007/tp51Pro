<?php
namespace app\common\model;

use app\common\validate\Admin;
use think\Db;
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
            ->find();
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
            $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
            $validateRes = $this->validate($this->validate, $addData, $tokenData);
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
                $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
                $validateRes = $this->validate($this->validate, $saveData, $tokenData);
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

    /**
     * 获取当前管理员权限下的 导航菜单
     * @param int $id
     * @return mixed
     */
    public function getAdminNavMenus($id = 1){
        $nav_menu_ids = $this
            ->alias('a')
            ->join('admin_roles ar','ar.id = a.role_id')
            ->where([['a.id','=',$id],['a.status','=',1]])
            ->value('nav_menu_ids');
        return $nav_menu_ids;
    }

    /**
     * 管理员登录 反馈
     * @param $input
     * @return bool|mixed
     */
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

    /**
     * 检查 管理员是否对此URL有管理权限
     * @param int $adminID
     * @param string $authUrl
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function checkAdminAuth($adminID = 0,$authUrl = ''){
        $checkTag = false;
        $nav_menu_ids = $this->getAdminNavMenus($adminID);
        if (is_string($nav_menu_ids)){
            $arrMenus = explode("|",$nav_menu_ids);
            foreach ($arrMenus as $key => $menu_id){
                if ($menu_id){
                    $checkTag = $this->checkAuthUrlForMenuID($menu_id,$authUrl);
                    if ($checkTag){
                        break;
                    }else{
                        //此时判断其的 下级权限中是否满足 当前访问的权限
                        $childMenus = Db::name('nav_menus')
                            ->field("n2.id")
                            ->alias('n1')
                            ->join("nav_menus n2","n1.id = n2.parent_id")
                            ->where(
                                [
                                    ["n2.parent_id",'=',$menu_id],
                                    ['n2.status','=',1],
                                    ['n2.type','=',1]
                                ])
                            ->select();
                        foreach ($childMenus as $key2 => $child_menu){
                            $checkTag = $this->checkAuthUrlForMenuID($child_menu['id'],$authUrl);
                            if ($checkTag){
                                break;
                            }else{
                                continue;
                            }
                        }
                        if ($checkTag){
                            break;
                        }
                    }
                }
            }
        }
        return $checkTag;
    }

    /**
     * 忽略 因操作系统不同对链接字符串大小写的敏感
     * @param int $menu_id
     * @param $authUrl
     * @return bool
     */
    public function checkAuthUrlForMenuID($menu_id = 0,$authUrl){
        $checkTag = false;
        $menuAction = Db::name('nav_menus')
            ->where([["id",'=',$menu_id],['status','=',1]])
            ->value('action');
        if ("/".strtolower($menuAction) == strtolower($authUrl)){
            $checkTag = true;
        }
        return $checkTag;
    }











}
