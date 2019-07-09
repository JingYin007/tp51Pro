<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2019/4/26
 * Time: 10:12
 */

namespace app\common\model;


class Xusers extends BaseModel
{
    /**
     * 分页获取用户数据
     * @param int $curr_page
     * @param int $page_limit
     * @param null $search
     * @param null $user_type
     * @return array
     */
    public function getCmsUsersForPage($curr_page = 1, $page_limit = 1, $search = null,$user_type = null){
        $res = $this
            ->field("*,from_unixtime(reg_time) reg_time2 ")
            ->where('auth_tel|nick_name', 'like', '%' . $search . '%')
            ->where("user_type",$user_type)
            ->order(['reg_time' => 'desc'])
            ->limit($page_limit * ($curr_page - 1), $page_limit)
            ->select();
        foreach ($res as $key => $value){
            $sex = $value['sex'];
            switch ($sex){
                case 0:
                    $sex = "未知";
                    break;
                case 1:
                    $sex = "男";
                    break;
                case 2:
                    $sex = "女";
                    break;
                default:
                    break;
            }
            $user_id = $value['id'];
            $user_status = $value['user_status'];
            switch ($user_status){
                case 0:
                    $user_status = "正常";
                    $statusColor = 'blue';
                    break;
                case 1:
                    $user_status = "异常";
                    $statusColor = 'red';
                    break;
                case 2:
                    $user_status = "禁用";
                    $statusColor = 'black';
                    break;
                default:
                    break;
            }
            $res[$key]['sex'] = $sex;
            $res[$key]['user_status_tip'] = "<span class=\"layui-badge span-user-status-$user_id layui-bg-$statusColor\">$user_status</span>";
        }
        return $res->toArray();
    }

    /**
     * 获取用户数量
     * @param null $search
     * @param null $user_type
     * @return float|string
     */
    public function getCmsUsersCount($search = null,$user_type = null){
        $count = $this
            ->field("*")
            ->where('auth_tel|nick_name', 'like', '%' . $search . '%')
            ->where("user_type",$user_type)
            ->count();
        return $count;
    }

    /**
     * 更新用户状态
     * @param int $userID
     * @param int $user_status
     * @return array
     */
    public function updateUserStatus($userID = 0,$user_status = 0){
        $status = $this
            ->where("id",$userID)
            ->update(["user_status"=>$user_status]);
        $message = $status?"更新成功":"Sorry，更新失败";
        return ['status'=>$status,'message'=>$message];
    }
}