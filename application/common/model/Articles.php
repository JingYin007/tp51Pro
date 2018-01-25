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
            ->join('article_points ap','ap.article_id = a.id')//给你要关联的表取别名,并让两个值关联
            ->where('a.id','>',0)
            ->where('ap.status',1)
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
            ->join('article_points ap','ap.article_id = a.id')
            ->order('ap.view desc')
            ->where('ap.status',1)
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
        $res = [];
        if(is_numeric($id)){
            $res = $this
                ->alias('a')
                ->join('tp5_users u','u.id = a.user_id')
                ->join('tp5_article_points ap','ap.article_id = a.id')
                ->field('a.*,u.user_name')
                ->where('a.id = '.$id)
                ->find();
        }
        isset($res)?$res->toArray():[];
        return $res;
    }
    public function getCmsArticleList(){
        $res = $this
            ->alias('a')
            ->field('a.id,title,a.created_at,status,picture,abstract')
            ->join('article_points ap','ap.article_id = a.id')
            ->order('a.list_order desc')
            ->order('a.id desc')
            ->select();
        return $res->toArray();
    }

    public function getCmsArticleByID($id){
        $res = $this
            ->alias('a')
            ->field('a.*,u.user_name,title,status,picture,abstract')
            ->join('users u', 'u.id = a.user_id')
            ->join('article_points ap','ap.article_id = a.id')
            ->where('a.id',$id)
            ->find()
            ->toArray();
        return $res;
    }
    public function updateCmsArticleData($input){
        $id = $input['id'];
        $opTag = isset($input['tag']) ? $input['tag']:'edit';
        if($opTag == 'del'){
            $tag = Db::name('article_points')
                ->where('article_id',$id)
                ->update(['status' => -1]);
        }else{
            $this
                ->where('id',$id)
                ->update([
                    'title' => $input['title'],
                    'list_order' => $input['list_order'],
                    'content' => $input['content'],
                    'updated_at'=> time()
                ]);
            $tag = Db::name('article_points')
                ->where('article_id',$id)
                ->update([
                    'picture' => $input['picture']?$input['picture']:'',
                    'abstract' => $input['abstract'],
                    'status' => $input['status'],
                ]);
        }
        return $tag;
    }

    /**
     * 进行新文章的添加操作
     * @param $data
     */
    public function addArticle($data){
        $this->title = $data['title'];
        $this->list_order = $data['list_order'];
        $this->content = $data['content'];
        $this->user_id = 1;
        $this->created_at = time();
        $this->updated_at = time();
        $this->save();

        Db::name('article_points')
            ->data([
                'picture' => $data['picture'],
                'abstract' => $data['abstract'],
                'status' => $data['status'],
                'article_id' => $this->getLastInsID(),
            ])
            ->insert();
    }
}