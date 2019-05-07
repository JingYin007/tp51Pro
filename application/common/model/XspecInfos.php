<?php

namespace app\common\model;

use app\common\validate\XspecInfo;
use think\Db;
use \think\Model;


class XspecInfos extends BaseModel
{
    // 设置当前模型对应的完整数据表名称
    protected $autoWriteTimestamp = 'datetime';
    protected $validate;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new XspecInfo();
    }

    /**
     * 后台获取产品属性数据列表
     * @param $curr_page
     * @param int $limit
     * @param null $search
     * @param int $specFstID
     * @return array
     */
    public function getCmsSpecInfoForPage($curr_page, $limit = 1, $search = null, $catID = null, $specFstID = null)
    {
        $where = [['s1.status', '=', 1],
            ['s1.cat_id', '=', $catID],
            ['s1.parent_id', '=', $specFstID],
            ['s1.spec_id', '<>', 0]];
        $res = $this
            ->alias("s1")
            ->field('s1.*,s2.spec_name parent_name')
            ->join("xspec_infos s2", "s1.parent_id = s2.spec_id")
            ->where($where)
            ->whereLike('s1.spec_name', '%' . $search . '%')
            ->order(['s1.list_order' => 'desc', 's1.spec_id' => 'desc'])
            ->limit($limit * ($curr_page - 1), $limit)
            ->select();
//        foreach ($res as $key => $v){
//
//        }
        return $res->toArray();
    }

    /**
     * 后台获取产品属性总数
     * @param null $search
     * @param int $catID
     * @param int $specFstID
     * @return float|string
     */
    public function getCmsSpecInfoCount($search = null, $catID = 0, $specFstID = 0)
    {
        $where = [['s1.status', '=', 1],
            ['s1.cat_id', '=', $catID],
            ['s1.parent_id', '=', $specFstID],
            ['s1.spec_id', '<>', 0]];
        $count = $this
            ->alias("s1")
            ->field('s1.*,s2.spec_name parent_name')
            ->join("xspec_infos s2", "s1.parent_id = s2.spec_id")
            ->where($where)
            ->whereLike('s1.spec_name', '%' . $search . '%')
            ->count();
        return $count;
    }

    /**
     * 进行添加操作
     * @param $data
     * @return array
     */
    public function addSpecInfo($data)
    {
        $addData = [
            'spec_name' => isset($data['spec_name']) ? $data['spec_name'] : '',
            'parent_id' => intval($data['specFstID']),
            'cat_id' => intval($data['toSelCatID']),
            'list_order' => intval($data['list_order']),
            'mark_msg' => isset($data['mark_msg']) ? $data['mark_msg'] : '',
        ];
        $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
        $validateRes = $this->validate($this->validate, $addData, $tokenData);
        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '属性添加成功' : '属性添加失败';
        }
        return $validateRes;
    }


    /**
     * 根据属性ID 获取属性内容
     * @param $id
     * @return array
     */
    public function getCmsSpecInfoByID($id)
    {
        $res = $this
            ->field('*')
            ->where('spec_id', $id)
            ->find()
            ->toArray();
        return $res;
    }

    /**
     * 更新分类
     * @param $input
     * @return array
     */
    public function updateCmsSpecInfoData($input)
    {

        $id = $input['id'];
        $opTag = isset($input['tag']) ? $input['tag'] : 'edit';
        if ($opTag == 'del') {
            $this
                ->where('spec_id', $id)
                ->update(['status' => -1]);
            $validateRes = ['tag' => 1, 'message' => '删除成功'];
        } else {
            $saveData = [
                'spec_name' => isset($input['spec_name']) ? $input['spec_name'] : '',
                //'parent_id' => intval($input['specFstID']),
                'cat_id' => intval($input['toSelCatID']),
                'list_order' => intval($input['list_order']),
                'mark_msg' => isset($input['mark_msg']) ? $input['mark_msg'] : '',
            ];
            if (intval($input['specFstID'])) {
                $saveData['parent_id'] = intval($input['specFstID']);
            }
            $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
            $validateRes = $this->validate($this->validate, $saveData, $tokenData);
            if ($validateRes['tag']) {
                $saveTag = $this
                    ->where('spec_id', $id)
                    ->update($saveData);
                $validateRes['tag'] = $saveTag;
                $validateRes['message'] = $saveTag ? '修改成功' : '数据无变动';
            }
        }
        return $validateRes;
    }

    /**
     * 根据商品分类ID 获取父级属性
     * @param int $seledCatID
     * @return array
     */
    public function getSpecInfoFstByCat($seledCatID = 0)
    {
        $specList = $this
            ->field("spec_id,spec_name,mark_msg")
            ->where([['parent_id', '=', 0], ['cat_id', '=', intval($seledCatID)]])
            ->select();
        foreach ($specList as $key => $value) {
            if ($value && $value['mark_msg']) {
                $specList[$key]['mark_msg'] = "【" . $value['mark_msg'] . "】";
            }
        }
        return $specList ? $specList->toArray() : [];
    }

    /**
     * 根据父级属性值获取次级信息
     * @param int $specFstID
     * @return array
     */
    public function getSpecInfoBySpecFst($specFstID = 0)
    {
        $where = [['s1.status', '=', 1],
            ['s1.parent_id', '=', $specFstID],
            ['s1.parent_id', '<>', 0]];
        $specList = $this
            ->alias("s1")
            ->field('s1.*')
            ->where($where)
            ->order(['s1.list_order' => 'desc', 's1.spec_id' => 'desc'])
            ->select();
        foreach ($specList as $key => $value) {
            if ($value && $value['mark_msg']) {
                $specList[$key]['mark_msg'] = "【" . $value['mark_msg'] . "】";
            }
        }
        return isset($specList) ? $specList->toArray() : [];
    }
}

