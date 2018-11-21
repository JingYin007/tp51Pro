<?php
namespace app\common\model;
use app\common\validate\NavMenu;
use think\Db;
use \think\Model;
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */

class NavMenus extends BaseModel
{
    protected $validate;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new NavMenu();
    }

    /**
     * 获取所有正常状态的菜单列表
     * @return mixed
     */
    public function getNavMenus(){

        $res = $this
            ->field('*')
            ->where([['id','>',0],['parent_id','=',0],['status','=',1]])
            ->order('list_order','desc')
            ->select();
        foreach ($res as $key => $value){
            $parent_id = $value['id'];
            $childRes = $this
                ->where('parent_id',$parent_id)
                ->where('status',1)
                ->order('list_order','desc')
                ->select();
            $res[$key]['child'] = $childRes;
        }
        return $res;
    }

    /**
     * 检查当前的菜单是否在 该管理员的权限内
     * @param int $nav_id 菜单ID
     * @param int $cmsAID 管理员用户ID
     * @return bool
     */
    public function checkNavMenuMan($nav_id = 0 ,$cmsAID = 0){
        $str = $this->getAdminNavMenus($cmsAID);
        $navMenus = explode('|',$str);
        $tag = in_array($nav_id,$navMenus);
        return $tag;

    }
    /**
     * 获取当前管理员权限下的 导航菜单
     * @param int $cmsAID
     * @return mixed
     */
    public function getNavMenusShow($cmsAID = 0){
        if (!$cmsAID){
            return null;
        }else{
            $str = $this->getAdminNavMenus($cmsAID);
            $arr = explode('|',$str);
            $res1 = $this->allNavMenus();
            $res = $this->deal($res1,$arr);
            return $res?$res->toArray():null;
        }
    }
    public function getAdminNavMenus($id = 1){
        $res = Db('admins')
            ->alias('a')
            ->field('ar.nav_menu_ids')
            ->join('admin_roles ar','ar.id = a.role_id')
            ->where('a.id',$id)
            ->find();
        return $res['nav_menu_ids'];
    }
    public function allNavMenus(){
        $res = $this
            ->field('*')
            ->where('id','>',0)
            ->where('parent_id',0)
            ->where('status',1)
            ->order('list_order','desc')
            ->select();
        return $res;
    }
    public function deal($res,$arr){
        foreach ($res as $key => $value){
            $parent_id = $value['id'];
            if (!in_array($parent_id,$arr)){
                unset($res[$key]);
            }else{
                $childRes = $this
                    ->where('parent_id',$parent_id)
                    ->where('status',1)
                    ->order('list_order','desc')
                    ->select();
                $childRes = $this->deal2($childRes,$arr);
                $res[$key]['child'] = $childRes;
            }
        }
        return $res;
    }

    public function deal2($res,$arr){
        foreach ($res as $key => $value){
            $parent_id = $value['id'];
            if (!in_array($parent_id,$arr)){
                unset($res[$key]);
            }
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
            ->field('nm.*,nm2.name parent_name')
            ->join('nav_menus nm2','nm.parent_id = nm2.id')
            ->where('nm.id',$id)
            ->find();
        return $res?$res:[];
    }

    /**
     * 获取 符合条件的 菜单数量
     * @param null $search
     * @return int|string
     */
    public function getNavMenusCount($search = null){
        $res = $this
            ->field('id')
            ->where([['id','>','0'],["status",'=',1]])
            ->whereLike('name','%'.$search.'%')
            //->orWhere('action','like','%'.$search.'%')
            ->count();
        return $res;
    }

    /**
     * 分页获取 菜单数据
     * @param $curr_page
     * @param $limit
     * @param null $search
     * @return array|\PDOStatement|string|\think\Collection
     */
    public function getNavMenusForPage($curr_page,$limit,$search = null){
        $res = $this
            ->field('n1.*,n2.name parent_name')
            ->alias('n1')
            ->join("nav_menus n2",'n1.parent_id = n2.id')
            ->where([['n1.id','>','0'],["n1.status",'=',1]])
            ->whereLike('n1.name','%'.$search.'%')
            ->order(['n1.list_order'=>'desc','n1.created_at'=>'desc'])
            ->limit($limit*($curr_page - 1),$limit)
            ->select();
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
     * 添加菜单数据
     * @param $data
     * @return array
     */
    public function addNavMenu($data){
        $addData = [
            'name' => isset($data['name'])?$data['name']:'',
            'parent_id' => intval($data['parent_id']),
            'action' => isset($data['action']) ? $data['action'] : '',
            'icon' => $data['icon']?$data['icon']:'',
            'created_at' => date("Y-m-d H:i:s", time()),
            'list_order' => intval($data['list_order']),
            'status' => $data['status'],
        ];
        $validateRes = $this->validate($this->validate, $addData);
        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '菜单添加成功' : '添加失败';
        }
        return $validateRes;
    }

    /**
     * 更新菜单数据
     * @param $id
     * @param $data
     * @return array
     */
    public function editNavMenu($id,$data){
        $opTag = isset($data['tag']) ? $data['tag']:'edit';
        $tag = 0;
        if($opTag == 'del'){
            $tag = $this
                ->where('id',$id)
                ->update(['status' => -1]);
            $validateRes['message'] = '菜单删除成功';
        }else{
            $saveData = [
                'name' => isset($data['name'])?$data['name']:'',
                'icon' => $data['icon']?$data['icon']:'',
                'list_order' => intval($data['list_order']),
                'parent_id' => $data['parent_id'],
                'action' => isset($data['action']) ? $data['action'] : '',
                'status' => $data['status'],
            ];
            $validateRes = $this->validate($this->validate, $saveData);
            if ($validateRes['tag']){
                $tag = $this
                    ->where('id',$id)
                    ->update($saveData);
                $validateRes['message'] = $tag?'菜单修改成功':'数据无变动';
            }

        }
        $validateRes['tag'] = $tag;
        return $validateRes;
    }
}