<?php

namespace app\common\model;

use app\common\validate\Xgood;
use think\Db;
use \think\Model;

/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */
class Xgoods extends BaseModel
{
    // 设置当前模型对应的完整数据表名称
    protected $autoWriteTimestamp = 'datetime';
    protected $validate;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new Xgood();
    }

    /**
     * 后台获取文章数据列表
     * @param $curr_page
     * @param int $limit
     * @param null $search
     * @param string $SelStatus
     * @param int $CatType
     * @param string $OrderType
     * @return array
     */
    public function getCmsGoodsForPage($curr_page, $limit = 1, $search = null,
                                       $SelStatus = "Down", $CatType = 0,$OrderType="D")
    {
        $status = $SelStatus == "Down" ? 0 : 1;
        $where = [["g.status", '=', $status]];
        if ($CatType != 0) {
            $where[] = ["g.cat_id", '=', $CatType];
        } else {
            $where[] = ["g.cat_id", '<>', 0];
        }
        if ($OrderType == "D") {
            $order["g.updated_at"] = "desc";
        } elseif ($OrderType == "S") {
            $order["g.stock"] = "asc";
        }else{
            $order["g.list_order"] = "desc";
        }

        $res = $this
            ->alias('g')
            ->field('g.*,cat_name')
            ->join('xcategorys cat', 'cat.cat_id = g.cat_id')
            ->where($where)
            ->whereLike('g.goods_name', '%' . $search . '%')
            ->order($order)
            ->limit($limit * ($curr_page - 1), $limit)
            ->select();
        foreach ($res as $key => $v) {
            if ($v['status'] == 1) {
                $res[$key]['status_checked'] = "checked";
            } else {
                $res[$key]['status_checked'] = "";
            }
        }
        return $res->toArray();
    }

    /**
     * 后台获取文章总数
     * @param null $search
     * @param string $SelStatus
     * @return float|string
     */
    public function getCmsGoodsCount($search = null, $SelStatus = "Down", $CatType = 0)
    {
        $status = $SelStatus == "Down" ? 0 : 1;
        $where = [
            ["g.status", '=', $status]
        ];
        if ($CatType != 0) {
            $where[] = ["g.cat_id", '=', $CatType];
        } else {
            $where[] = ["g.cat_id", '<>', 0];
        }
        $count = $this
            ->alias('g')
            ->field('g.status')
            ->join('xcategorys cat', 'cat.cat_id = g.cat_id')
            ->where($where)
            ->whereLike('g.goods_name', '%' . $search . '%')
            ->count();
        return $count;
    }

    /**
     * 根据文章ID 获取文章内容
     * @param $id
     * @return array
     */
    public function getCmsGoodsByID($id)
    {
        $res = $this
            ->alias('g')
            ->field('g.*,cat.cat_name')
            ->join('xcategorys cat', 'cat.cat_id = g.cat_id')//给你要关联的表取别名,并让两个值关联
            ->where('g.goods_id', $id)
            ->find();
        //获取轮播图
        $arrSlideShow = Db('xupload_imgs')
            ->field("picture,id")
            ->where([['tag_id', '=', $id], ['type', '=', 0], ['status', '=', 1]])
            ->select();
        $arr = [];

        foreach ($arrSlideShow as $key => $value) {
            $slideArr = ['upload_img_id' => $value['id'], 'picture' => $value['picture']];
            $arr[] = $slideArr;
            //array_push($arr,$value['picture']);
        }
        $res['arr_slide_show'] = $arr;
        $skuModle = new Xskus();
        //初始化 SKU 数组
        $sku_arr = $skuModle->getSKUDataByGoodsID($id);
        $res['sku_arr'] = $sku_arr;
        return isset($res) ? $res->toArray() : [];
    }

    /**
     * 更新文章内容
     * @param $input
     * @return array
     */
    public function updateCmsGoodsData($input = [])
    {

        $id = $input['id'];
        $opTag = isset($input['tag']) ? $input['tag'] : 'edit';
        if ($opTag == 'del') {
            $this->where('goods_id', $id)
                ->update(['status' => -1]);
            $validateRes = ['tag' => 1, 'message' => '删除成功'];
        } else {
            $saveData = [
                'goods_name' => isset($input['goods_name']) ? $input['goods_name'] : '',
                'list_order' => isset($input['list_order']) ? $input['list_order'] : 0,
                'details' => isset($input['details']) ? $input['details'] : '',
                'thumbnail' => isset($input['thumbnail']) ? $input['thumbnail'] : '',
                'cat_id' => isset($input['cat_id']) ? intval($input['cat_id']) : 1,
                'reference_price' => isset($input['reference_price']) ? round($input['reference_price'], 2) : 0.00,
                'selling_price' => isset($input['selling_price']) ? round($input['selling_price'], 2) : 0.00,
                'attr_info' => isset($input['attr_info']) ? $input['attr_info'] : '',
                'stock' => isset($input['stock']) ? intval($input['stock']) : 0,
                'status' => isset($input['status']) ? intval($input['status']) : 0,
                'updated_at' => date('Y-m-d H:m:s', time())
            ];
            $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : '',];
            $validateRes = $this->validate($this->validate, $saveData, $tokenData);
            if ($validateRes['tag']) {
                $saveTag = $this
                    ->where('goods_id', $id)
                    ->update($saveData);
                $validateRes['tag'] = $saveTag;
                $validateRes['message'] = $saveTag ? '修改成功' : '数据无变动';
                if ($saveTag) {
                    //此处进行轮播图片的上传操作
                    $slide_show = isset($input['slide_show']) ? $input['slide_show'] : '';
                    uploadSlideShow($slide_show, $id);
                    //TODO 此时进行 sku库存信息的上传
                    $skuModle = new Xskus();
                    $sku_arr = isset($input['sku_arr'])?$input['sku_arr']:[];
                    $skuModle->opSKUforGoodsByID($id, $sku_arr);
                }
            }
        }
        return $validateRes;
    }

    /**
     * 动态修改商品上下架状态
     * @param int $goods_id
     * @return array
     */
    public function updatePutaway($goods_id = 0, $okStatus = 0)
    {
        $message = "Success";
        $goods_id = isset($goods_id) ? intval($goods_id) : 0;
        $saveTag = $this
            ->where('goods_id', $goods_id)
            ->update(['status' => $okStatus,'updated_at' => date('Y-m-d H:m:s', time())]);
        if (!$saveTag) {
            $message = "状态更改失败";
        }
        return ['tag' => $saveTag, 'message' => $message];
    }

    /**
     * 进行新文章的添加操作
     * @param $data
     * @return array
     */

    public function addGoods($data)
    {

        $addData = [
            'goods_name' => isset($data['goods_name']) ? $data['goods_name'] : '',
            'list_order' => isset($data['list_order']) ? $data['list_order'] : 0,
            'details' => isset($data['details']) ? $data['details'] : '',
            'thumbnail' => isset($data['thumbnail']) ? $data['thumbnail'] : '',
            'cat_id' => isset($data['cat_id']) ? intval($data['cat_id']) : 1,
            'reference_price' => isset($data['reference_price']) ? round($data['reference_price'], 2) : 0.00,
            'selling_price' => isset($data['selling_price']) ? round($data['selling_price'], 2) : 0.00,
            'attr_info' => isset($data['attr_info']) ? $data['attr_info'] : '',
            'stock' => isset($data['stock']) ? intval($data['stock']) : 0,
            'status' => isset($data['status']) ? intval($data['status']) : 0,
            'created_at' => date('Y-m-d H:m:s', time()),
            'updated_at' => date('Y-m-d H:m:s', time())
        ];
        $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
        $validateRes = $this->validate($this->validate, $addData, $tokenData);
        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '添加成功' : '添加失败';
            if ($tag) {
                $goodsId = $this->getLastInsID();
                //此处进行轮播图片的上传操作
                $slide_show = isset($data['slide_show']) ? $data['slide_show'] : '';
                uploadSlideShow($slide_show, $goodsId);
                //TODO 此时进行 sku库存信息的上传
                $skuModle = new Xskus();
                $sku_arr = isset($data['sku_arr'])?$data['sku_arr']:[];
                $skuModle->opSKUforGoodsByID($goodsId, $sku_arr);
            }
        }
        return $validateRes;
    }



    /**
     * ajax 删除所上传的图片
     * @param int $upload_img_id
     * @return array
     */
    public function delUploadImg($upload_img_id = 0)
    {
        $tag = 1;
        $message = "图片删除失败";
        if (intval($upload_img_id) > 0) {
            $tag = Db('xupload_imgs')
                ->where("id", $upload_img_id)
                ->update(['status' => '-1']);
            if ($tag) {
                $message = "图片删除成功";
            }
        }
        return ['tag' => $tag, 'message' => $message];
    }

    /**
     * 根据分类获取参加活动的商品
     * @param int $catID
     * @return array
     */
    public function getCatGoodsForActivity($catID = 0)
    {
        $goodsList = $this
            ->field("goods_id,goods_name")
            ->where([['cat_id', '=', $catID], ['status', '>=', '0']])
            ->select();
        return $goodsList ? $goodsList->toArray() : [];
    }

}