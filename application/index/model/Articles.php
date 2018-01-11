<?php
namespace app\index\model;
use think\Db;
use \think\Model;
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */

class Articles extends Model
{
    // 设置当前模型对应的完整数据表名称
    //protected $table = 'lar5_articles';
    public function getArticleList(){
        $data = $this
            ->alias('a')//给主表取别名
            ->join('tp5_article_points ap','ap.article_id = a.id')//给你要关联的表取别名,并让两个值关联
            ->where('a.id','>',0)
            ->select()
            ->toArray();
        return $data;
    }
    public function getRecommendList(){
        $res = $this
            ->field('a.title,a.id')
            ->alias('a')
            ->join('tp5_article_points ap','ap.article_id = a.id')
            ->order('ap.view desc')
            ->limit(6)
            ->select()
            ->toArray();
        return $res;
    }
    public function getPhotos(){
        $res = $this
            ->field('ap.picture')
            ->alias('a')
            ->join('tp5_article_points ap','ap.article_id = a.id')
            ->order('ap.view desc')
            ->limit(9)
            ->select()
            ->toArray();
        return $res;
    }
}