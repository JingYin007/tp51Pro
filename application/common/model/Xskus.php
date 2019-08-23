<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2019/4/11
 * Time: 11:05
 */

namespace app\common\model;


class Xskus extends BaseModel
{

    /**
     * 根据商品ID 更新SKU规格数据
     * @param int $goodsID
     * @param array $skuData
     */
    public function opSKUforGoodsByID($goodsID = 0, $skuData = [])
    {
        $this->where('goods_id', $goodsID)
            ->update(['status' => -1]);
        foreach ($skuData as $key => $value) {
            if ($value) {
                $spec_info = isset($value['spec_id']) ? $value['spec_id'] : '';
                $spec_name = isset($value['spec_name']) ? $value['spec_name'] : '';
                $sku_img = isset($value['sku_img']) ? $value['sku_img'] : '';
                $selling_price = isset($value['selling_price']) ? $value['selling_price'] : '0.00';
                $stock = isset($value['stock']) ? intval($value['stock']) : 0;
                $sold_num = isset($value['sold_num']) ? intval($value['sold_num']) : 0;
                //TODO 判断是否存在
                $haveTag = $this
                    ->where([['spec_info', '=', $spec_info], ['goods_id', '=', $goodsID]])
                    ->count();
                if ($haveTag) {
                    $this
                        ->where([['spec_info', '=', $spec_info], ['goods_id', '=', $goodsID]])
                        ->update([
                            'status' => 0,
                            'sku_img' => $sku_img,
                            'spec_name' => $spec_name,
                            'selling_price' => $selling_price,
                            'stock' => $stock,
                            'sold_num' => $sold_num,
                            'updated_at' => date('Y-m-d H:i:s', time())]);
                } else {
                    $this->insert([
                        'goods_id' => $goodsID,
                        'spec_info' => $spec_info,
                        'sku_img' => $sku_img,
                        'spec_name' => $spec_name,
                        'selling_price' => $selling_price,
                        'stock' => $stock,
                        'sold_num' => $sold_num,
                        'updated_at' => date('Y-m-d H:i:s', time())]);
                }
            }
        }
    }

    /**
     * 根据商品ID 获取其SKU规格信息
     * @param int $goodsID
     * @return array
     */
    public function getSKUDataByGoodsID($goodsID = 0)
    {
        $skuData = $this
            ->field("*")
            ->where([["goods_id", '=', intval($goodsID)], ["status", '=', 0]])
            ->select();
        return isset($skuData) ? $skuData->toArray() : [];
    }

}