<?php
namespace app\common\model;
use app\common\validate\Article;
use think\Db;
use \think\Model;
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2018/1/11
 * Time: 16:45
 */

class Articles extends BaseModel
{
    // 设置当前模型对应的完整数据表名称
    protected $autoWriteTimestamp = 'datetime';
    protected $validate;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->validate = new Article();
    }

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
            ->join('article_points ap','ap.article_id = a.id')
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
                ->join('users u','u.id = a.user_id')
                ->join('article_points ap','ap.article_id = a.id')
                ->field('a.*,u.user_name')
                ->where('a.id = '.$id)
                ->find();
        }
        isset($res)?$res->toArray():[];
        return $res;
    }

    /**
     * 后台获取文章数据列表
     * @return array
     */
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

    /**
     * 根据文章ID 获取文章内容
     * @param $id
     * @return array
     */
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

    /**
     * 更新文章内容
     * @param $input
     * @return array
     */
    public function updateCmsArticleData($input){

        $id = $input['id'];
        $opTag = isset($input['tag']) ? $input['tag'] : 'edit';
        if ($opTag == 'del') {
            Db::name('article_points')
                ->where('article_id', $id)
                ->update(['status' => -1]);
            $validateRes = ['tag' => 1, 'message' => '删除成功'];
        } else {
            $saveData = [
                'title' => $input['title'],
                'list_order' => $input['list_order'],
                'content' => $input['content'],
                'updated_at' => date('Y-m-d H:m:s', time())
            ];
            $validateRes = $this->validate($this->validate, $saveData);
            if ($validateRes['tag']) {
                $saveTag = $this
                    ->where('id', $id)
                    ->update($saveData);
                if ($saveTag) {
                    Db::name('article_points')
                        ->where('article_id', $id)
                        ->update([
                            'picture' => $input['picture'] ? $input['picture'] : '',
                            'abstract' => $input['abstract'],
                            'status' => $input['status'],
                        ]);
                }
                $validateRes['tag'] = $saveTag;
                $validateRes['message'] = $saveTag ? '修改成功' : '数据无变动';
            }
        }
        return $validateRes;
    }

    /**
     * 进行新文章的添加操作
     * @param $data
     * @return array
     */

    public function addArticle($data){

        $addData = [
            'title' => $data['title'],
            'list_order' => $data['list_order'],
            'content' => isset($data['content'])?$data['content']:'',
            'user_id' => 1,
            'created_at' => date('Y-m-d H:m:s', time()),
            'updated_at' => date('Y-m-d H:m:s', time())
        ];
        $validateRes = $this->validate($this->validate, $addData);
        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            if ($tag) {
                Db::name('article_points')
                    ->data([
                        'picture' => $data['picture'],
                        'abstract' => $data['abstract'],
                        'status' => $data['status'],
                        'article_id' => $this->getLastInsID(),
                    ])
                    ->insert();
            }
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '添加成功' : '添加失败';
        }
        return $validateRes;
    }
}