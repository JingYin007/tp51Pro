<?php
namespace app\common\model;
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
    /**
     * 获取所有的文章
     * @return array
     */
    public function getArticleList(){
        $data = $this
            ->alias('a')//给主表取别名
            ->join('tp5_article_points ap','ap.article_id = a.id')//给你要关联的表取别名,并让两个值关联
            ->where('a.id','>',0)
            ->select()
            ->toArray();
        return $data;
    }

    /**
     * 获取所要推荐的文章
     * @return array
     */
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

    /**
     * 获取所有的文章首页图片
     * @return array
     */
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

    /**
     * 根据文章ID 获取文章详情
     * @param $id
     * @return array
     */
    public function getInfoByID($id)
    {
        $res = $this
            ->alias('a')
            ->join('tp5_users u','u.id = a.user_id')
            ->join('tp5_article_points ap','ap.article_id = a.id')
            ->field('a.*,u.user_name')
            ->where('a.id = '.$id)
            ->find()
            ->toArray();
        return $res;

    }
}