<?php

namespace app\common\model;

use app\common\validate\Xcategory;
use think\Db;
use \think\Model;

//                                   乐百川
//
//                                   _ooOoo_
//                                  o8888888o
//                                  88" . "88
//                                  (| -_- |)
//                                  0\  =  /0
//                                ___/'---'\___
//                              .' \\|     |// '.
//                             / \\|||  :  |||// \
//                            / _||||| -:- |||||- \
//                           |    | \\\ - /// |    \
//                           | .-\  ''\---/''  /-. |
//                           \ . -\___ '-' ___/- . /
//                         ___'. .'   /--.--\  '. .'___
//                       /."" '< '.___\_<|>_/___.' >' "".\
//                      | | :  `- \'.;'\ _ /';.'/ -`  : | |
//                      \  \ '_.   \_ __\ /__ _/   .-` /  /
//                  =====`-.____`.___ \_____/ ___.-`___.-'=====
//                                   '=-----='
//                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                            佛祖保佑        永无Bug
//


class Xcategorys extends BaseModel
{
    // 设置当前模型对应的完整数据表名称
    protected $autoWriteTimestamp = 'datetime';
    protected $validate;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new Xcategory();
    }

    /**
     * 后台获取产品分类数据列表
     * @param $curr_page
     * @param int $limit
     * @param null $search
     * @param string $catType 分类级别 F:顶级  S:二级
     * @return array
     */
    public function getCmsCategoryForPage($curr_page, $limit = 1, $search = null, $catType = "S")
    {
        $where = [['status', '=', 0], ['cat_id', '<>', 0]];
        if ($catType == "F") {
            $where[] = ['parent_id', '=', 0];
        } else {
            $where[] = ['parent_id', '>', 0];
        }
        $res = $this
            ->field('cat_id,cat_name,parent_id,is_show,status,icon,after_sale,list_order')
            ->where($where)
            ->whereLike('cat_name', '%' . $search . '%')
            ->order(['list_order' => 'desc', 'cat_id' => 'desc'])
            ->limit($limit * ($curr_page - 1), $limit)
            ->select();
        foreach ($res as $key => $v) {
            if ($v['is_show'] == 0) {
                $res[$key]['status_checked'] = "";
            } else {
                $res[$key]['status_checked'] = "checked";
            }
            $parent = $this->getCmsCategoryByID($v['parent_id']);
            $res[$key]['parent_name'] = isset($parent) ? $parent['cat_name'] : '';
        }
        return $res->toArray();
    }

    /**
     * 后台获取产品分类总数
     * @param null $search
     * @param string $catType
     * @return float|string
     */
    public function getCmsCategoryCount($search = null, $catType = "S")
    {
        $where = [['status', '=', 0], ['cat_id', '<>', 0]];
        if ($catType == "F") {
            $where[] = ['parent_id', '=', 0];
        } else {
            $where[] = ['parent_id', '>', 0];
        }
        $count = $this
            ->field('cat_id')
            ->where($where)
            ->whereLike('cat_name', '%' . $search . '%')
            ->count();
        return $count;
    }

    /**
     * 进行新分类的添加操作
     * @param $data
     * @return array
     */

    public function addCategory($data)
    {
        $addData = [
            'cat_name' => $data['cat_name'],
            'parent_id' => $data['parent_id'],
            'is_show' => $data['is_show'],
            'icon' => $data['icon'],
            'list_order' => $data['list_order'],
            'after_sale' => isset($data['after_sale']) ? $data['after_sale'] : '',
        ];
        $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
        $validateRes = $this->validate($this->validate, $addData, $tokenData);
        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '添加成功' : '添加失败';
        }
        return $validateRes;
    }


    /**
     * 根据分类ID 获取分类内容
     * @param $id
     * @return array
     */
    public function getCmsCategoryByID($id)
    {
        $res = $this
            ->field('*')
            ->where('cat_id', $id)
            ->find()
            ->toArray();
        return $res;
    }

    /**
     * 更新分类
     * @param $input
     * @return array
     */
    public function updateCmsCategoryData($input)
    {

        $id = $input['id'];
        $opTag = isset($input['tag']) ? $input['tag'] : 'edit';
        if ($opTag == 'del') {
            Db::name('xcategorys')
                ->where('cat_id', $id)
                ->update(['status' => -1]);
            $validateRes = ['tag' => 1, 'message' => '删除成功'];
        } else {
            $saveData = [
                'cat_name' => $input['cat_name'],
                'parent_id' => $input['parent_id'],
                'is_show' => $input['is_show'],
                'icon' => $input['icon'],
                'list_order' => $input['list_order'],
                'after_sale' => isset($input['after_sale']) ? $input['after_sale'] : '',
            ];
            $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
            $validateRes = $this->validate($this->validate, $saveData, $tokenData);
            if ($validateRes['tag']) {
                $saveTag = $this
                    ->where('cat_id', $id)
                    ->update($saveData);
                $validateRes['tag'] = $saveTag;
                $validateRes['message'] = $saveTag ? '修改成功' : '数据无变动';
            }
        }
        return $validateRes;
    }


    /**
     * 此处可用于无限级分类
     * zhi 弃用 2019-03-14
     * @param $data
     * @param int $parent_id
     * @param int $level
     * @return array
     */
    public function digui($data, $parent_id = 0, $level = 0)
    {
        static $arr = array();
        foreach ($data as $k => $v) {
            if (($v['cat_id'] != 0) && ($v['parent_id'] == $parent_id)) {
                $v['level'] = $level;
                $arr[] = $v;
                $this->digui($data, $v['cat_id'], $level + 1);
            }
        }
        return $arr;
    }


    /**
     * 获取所有的产品分类（除顶级分类外）
     * @param int $tag 1：顶级分类  2：二级分类
     * @return array
     */
    public function getCategoryList($tag = 1)
    {
        if ($tag == 1) {
            $map[] = ['parent_id', '=', 0];
        } else {
            $map[] = ['parent_id', '<>', 0];
        }
        $map[] = ['status', '=', 0];
        $res = $this
            ->field('cat_id,cat_name')
            ->where($map)
            ->order("cat_id", 'asc')
            ->select();

        return isset($res) ? $res->toArray() : [];
    }

    /**
     * 修改首页显示的状态
     * @param int $cat_id
     * @param int $okStatus
     * @return array
     */
    public function updateForShow($cat_id = 0, $okStatus = 0)
    {
        $message = "Success";
        $cat_id = isset($cat_id) ? intval($cat_id) : 0;
        $saveTag = $this
            ->where('cat_id', $cat_id)
            ->update(['is_show' => $okStatus]);
        if (!$saveTag) {
            $message = "状态更改失败";
        }
        return ['tag' => $saveTag, 'message' => $message];
    }


}

