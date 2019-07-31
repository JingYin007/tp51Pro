<?php

namespace app\common\model;

use app\common\validate\XadList;
use app\common\validate\Xconfig;
use think\Db;
use \think\Model;

/**
 * 配置项目model处理类
 * Class Xconfigs
 * @package app\common\model
 */
class Xconfigs extends BaseModel
{
    protected $validate;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new Xconfig();
    }


    /**
     * 获取全部可修改状态的 数据
     * @param int $id
     * @return array|null|\PDOStatement|string|Model
     */
    public function getConfigByID($id = 0)
    {
        $res = $this
            ->field('*')
            ->where('id', $id)
            ->find();
        return $res ? $res : [];
    }

    /**
     * 获取 符合条件的数量
     * @param null $search
     * @param string $type
     * @return int|string
     */
    public function getConfigsCount($search = null, $type = 'text')
    {
        $res = $this
            ->field('id')
            ->where([["status", '=', 0], ['type', '=', $type]])
            ->where('title|tag', 'like', '%' . $search . '%')
            ->count();
        return $res;
    }

    /**
     * 获取不同类型下的数目
     * @return array
     */
    public function getEachTypeData()
    {
        $res = $this
            ->field("*,count(id) count")
            ->where("status",0)
            ->group("type")
            ->select()->toArray();
        $arrCount = ['WB' => 0, 'KG' => 0, 'TP' => 0];
        foreach ($res as $key => $value) {
            $status = $value['type'];
            switch ($status) {
                case 'text':
                    $arrCount['WB'] = $value['count'];
                    break;
                case 'checkbox':
                    $arrCount['KG'] = $value['count'];
                    break;
                case 'button':
                    $arrCount['TP'] = $value['count'];
                    break;
                default:
                    break;
            }
        }
        return $arrCount;
    }

    /**
     * 分页获取数据
     * @param $curr_page
     * @param $limit
     * @param null $search
     * @param string $type
     * @return array|\PDOStatement|string|\think\Collection
     */
    public function getConfigsForPage($curr_page, $limit, $search = null, $type = 'text')
    {
        $res = $this
            ->field('*')
            ->where([["status", '=', 0], ['type', '=', $type]])
            ->where('title|tag', 'like', '%' . $search . '%')
            ->order(['list_order' => 'desc', 'id' => 'desc'])
            ->limit($limit * ($curr_page - 1), $limit)
            ->select();
        foreach ($res as $key => $v) {
            if ($v['type'] == "text") {
                $res[$key]['value_tip'] = "<span class=\"span-7EC0EE\">".$v['value']."</span>";
            } elseif ($v['type'] == "checkbox") {
                $msg = $v['value']?'开启':'关闭';
                $bg_color = $v['value']?"green":"cyan";
                $res[$key]['value_tip'] = "<span class=\"layui-badge layui-bg-".$bg_color."\">".$msg."</span>";
            } else {
                $res[$key]['value_tip'] = "<img src=\"".$v['value']."\">";
            }
        }
        return $res;
    }

    /**
     * 添加数据
     * @param $data
     * @return array
     */
    public function addConfig($data)
    {
        $type = isset($data['type']) ? $data['type'] : 'text';
        $value_text = isset($data['value_text']) ? $data['value_text'] : '';
        $value_checkbox = isset($data['value_checkbox']) ? $data['value_checkbox'] : '';
        $value_button = isset($data['value_button']) ? $data['value_button'] : '';
        if ($type == "checkbox") {
            $value = $value_checkbox?1:0;
        }elseif ($type == "text"){
            $value = $value_text;
        }else{
            $value = $value_button;
        }
        $addData = [
            'title' => isset($data['title']) ? $data['title'] : '',
            'tag' => isset($data['tag']) ? $data['tag'] : '',
            'type' => $type,
            'value' => $value,
            'list_order' => isset($data['list_order']) ? intval($data['list_order']) : 0,
            'tip' => isset($data['tip']) ? $data['tip'] : '',
            'add_time' => date("Y-m-d H:i:s", time()),
        ];
        $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
        $validateRes = $this->validate($this->validate, $addData, $tokenData);
        if ($validateRes['tag']) {
            $insertGetId = $this->allowField(true)->insertGetId($addData);
            $validateRes['tag'] = $insertGetId ? 1 : 0;
            $validateRes['message'] = $insertGetId ? '添加成功' : '添加失败';
        }
        return $validateRes;
    }

    /**
     * 更新数据
     * @param $id
     * @param $data
     * @return array
     */
    public function editConfig($id, $data)
    {
        $opTag = isset($data['tag']) ? $data['tag'] : 'edit';
        $tag = 0;
        if ($opTag == 'del') {
            $tag = $this
                ->where('id', $id)
                ->update(['status' => -1]);
            $validateRes['message'] = $tag ? '删除成功' : '已删除';
        } else {
            $type = isset($data['type']) ? $data['type'] : 'text';
            $value_text = isset($data['value_text']) ? $data['value_text'] : '';
            $value_checkbox = isset($data['value_checkbox']) ? $data['value_checkbox'] : '';
            $value_button = isset($data['value_button']) ? $data['value_button'] : '';
            if ($type == "checkbox") {
                $value = $value_checkbox?1:0;
            }elseif ($type == "text"){
                $value = $value_text;
            }else{
                $value = $value_button;
            }

            $saveData = [
                'id' => $id,
                'title' => isset($data['title']) ? $data['title'] : '',
                'tag' => isset($data['tag']) ? $data['tag'] : '',
                'type' => $type,
                'value' => $value,
                'list_order' => isset($data['list_order']) ? intval($data['list_order']) : 0,
                'tip' => isset($data['tip']) ? $data['tip'] : '',
            ];
            $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
            $validateRes = $this->validate($this->validate, $saveData, $tokenData);

            if ($validateRes['tag']) {
                $this
                    ->where('id', $id)
                    ->update($saveData);
                $tag = 1;
                $validateRes['message'] = $tag ? '配置修改成功' : '数据无变动';
            }
        }
        $validateRes['tag'] = $tag;
        return $validateRes;
    }
}