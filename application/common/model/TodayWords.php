<?php

namespace app\common\model;

use app\common\validate\TodayWord;
use think\Db;
use \think\Model;

/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */
class TodayWords extends BaseModel
{
    protected $validate;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new TodayWord();
    }

    /**
     * 根据ID 获取赠言数据
     * @param int $id
     * @return array|null|\PDOStatement|string|Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getTodayWord($id = 0)
    {
        // 此时，根据ID取出对应的数据
        if ($id) {
            $res = $this
                ->where('id', $id)
                ->find();
        }else{
            //此處 隨機取出一條數據
            $allRes = $this
                ->field("id")
                ->where("status",1)
                ->select()
                ->toArray();
            $arrIDs = [];
            foreach ($allRes as $key => $value){
                array_push($arrIDs,$value['id']);
            }
            $randID = array_rand($arrIDs,1);
            $res = $this
                //TODO 这个　rand() 有时候不好用
                //->order("rand()")
                ->where('id', $arrIDs[$randID])
                ->find();
        }
        return $res;
    }

    /**
     * 获取 今日赠言 正常数据的数量
     * @return mixed
     */
    public function getTodayWordsCount()
    {
        $res = $this
            ->field('id')
            ->where("status",1)
            ->count();
        return $res;
    }

    /**
     * 根据页码 获取赠言数据
     * @param $curr_page 当前页数
     * @param $limit 本页要获取的记录条数
     * @return mixed
     */
    public function getTodayWordsForPage($curr_page, $limit)
    {
        $res = $this
            ->field('*')
            ->order('id desc')
            ->where('status',1)
            ->limit($limit * ($curr_page - 1), $limit)
            ->select()
            ->toArray();
        foreach ($res as $key => $v) {
            if ($v['status'] == 1) {
                $statusTip = '正常';
                $statusColor = 'blue';
            } else {
                $statusTip = '删除';
                $statusColor = 'cyan';
            }
            $res[$key]['status_tip'] = "<span class=\"layui-badge layui-bg-$statusColor\">$statusTip</span>";
        }
        return $res;
    }

    /**
     * 增加赠言实现代码
     * @param $data
     * @return array
     */
    public function addTodayWord($data)
    {
        $addData = [
            'from' => $data['from'],
            'word' => $data['word'],
            'picture' => isset($data['picture']) ? $data['picture'] : '',
            'status' => $data['status'],
            'updated_at' => date("Y-m-d H:i:s", time()),
        ];
        $validateRes = $this->validate($this->validate, $addData);
        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '添加成功' : '添加失败';
        }
        return $validateRes;
    }

    /**
     * 编辑赠言实现代码
     * @param $id 赠言标识 ID
     * @param $data post 数据
     * @return mixed
     */
    public function editTodayWord($id, $data)
    {

        $opTag = isset($data['tag']) ? $data['tag'] : 'edit';
        if ($opTag == 'del') {
            $this
                ->where('id', $id)
                ->update(['status' => -1]);
            $validateRes = ['tag' => 1, 'message' => '删除成功'];
        } else {
            $saveData = [
                'from' => $data['from'],
                'picture' => $data['picture'],
                'word' => $data['word'],
                'updated_at' => date("Y-m-d H:i:s", time()),
                'status' => $data['status'],
            ];
            $validateRes = $this->validate($this->validate, $saveData);
            if ($validateRes['tag']){
                $saveTag = $this
                    ->where('id', $id)
                    ->update($saveData);
                $validateRes['tag'] = $saveTag;
                $validateRes['message'] = $saveTag ? '修改成功' : '数据无变动';
            }
        }
        return $validateRes;
    }
}