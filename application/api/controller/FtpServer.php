<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2019/8/7
 * Time: 10:30
 */

namespace app\api\controller;


class FtpServer
{
    private $host = '';//远程服务器地址
    private $user_name = '';//ftp用户名
    private $password = '';//ftp密码
    private $port = 21;//ftp登录端口
    private $error = '';//最后失败时的错误信息
    protected $conn;//ftp登录资源

    /**
     * 可以在实例化类的时候配置数据，也可以在下面的connect方法中配置数据
     * Ftp constructor.
     * @param array $config
     */
    public function __construct(array $config = [])
    {
        empty($config) OR $this->initialize($config);
    }

    /**
     * 初始化数据
     * @param array $config 配置文件数组
     */
    public function initialize(array $config = [])
    {
        $this->host = $config['host'];
        $this->user_name = $config['user_name'];
        $this->password = $config['password'];
        $this->port = isset($config['port']) ?: 21;
    }

    /**
     * 连接及登录ftp
     * @param array $config 配置文件数组
     * @return bool
     */
    public function connect(array $config = [])
    {
        empty($config) OR $this->initialize($config);
        if (FALSE == ($this->conn = @ftp_connect($this->host))) {
            $this->error = "主机连接失败";
            return FALSE;
        }
        if (!$this->_login()) {
            $this->error = "服务器登录失败";
            return FALSE;
        }
        return TRUE;
    }

    /**
     * 上传文件到ftp服务器
     * @param string $local_file 本地文件路径
     * @param string $remote_file 服务器文件地址
     * @param string $mode 上传模式(ascii和binary其中之一)
     * @param null $permissions 文件夹权限
     * @return bool
     */
    public function upload($local_file = '', $remote_file = '', $mode = 'auto', $permissions = NULL)
    {
        if (!file_exists($local_file)) {
            $this->error = "本地文件不存在";
            return FALSE;
        }
        if ($mode == 'auto') {
            $ext = $this->_get_ext($local_file);
            $mode = $this->_set_type($ext);
        }
        //创建文件夹
        $this->_create_remote_dir($remote_file);
        $mode = ($mode == 'ascii') ? FTP_ASCII : FTP_BINARY;
        $result = @ftp_put($this->conn, $remote_file, $local_file, $mode);//同步上传
        if ($result === FALSE) {
            $this->error = "文件上传失败";
            return FALSE;
        }
        return TRUE;
    }

    /**
     *  从ftp服务器下载文件到本地
     * @param string $local_file 本地文件地址
     * @param string $remote_file 远程文件地址
     * @param string $mode 上传模式(ascii和binary其中之一)
     * @return bool
     */
    public function download($local_file = '', $remote_file = '', $mode = 'auto')
    {
        if ($mode == 'auto') {
            $ext = $this->_get_ext($remote_file);
            $mode = $this->_set_type($ext);
        }
        $mode = ($mode == 'ascii') ? FTP_ASCII : FTP_BINARY;
        $result = @ftp_get($this->conn, $local_file, $remote_file, $mode);
        if ($result === FALSE) {
            return FALSE;
        }
        return TRUE;
    }

    /**
     * 删除ftp服务器端文件
     * @param string $remote_file 文件地址
     * @return bool
     */
    public function delete_file($remote_file = '')
    {
        $result = @ftp_delete($this->conn, $remote_file);
        if ($result === FALSE) {
            return FALSE;
        }
        return TRUE;
    }

    /**
     * ftp创建多级目录
     * @param string $remote_file 要上传的远程图片地址
     */
    private function _create_remote_dir($remote_file = '', $permissions = NULL)
    {
        $remote_dir = dirname($remote_file);
        $path_arr = explode('/', $remote_dir); // 取目录数组
        //$file_name = array_pop($path_arr); // 弹出文件名
        $path_div = count($path_arr); // 取层数
        foreach ($path_arr as $val) // 创建目录
        {
            if (@ftp_chdir($this->conn, $val) == FALSE) {
                $tmp = @ftp_mkdir($this->conn, $val);//此处创建目录时不用使用绝对路径(不要使用:2018-02-20/ceshi/ceshi2，这种路径)，因为下面ftp_chdir已经已经把目录切换成当前目录
                if ($val){
                    if ($tmp == FALSE) {
                        echo "目录创建失败，请检查权限及路径是否正确!！";
                        exit;
                    }
                    if ($permissions !== NULL) {
                        //修改目录权限
                        $this->_chmod($val, $permissions);
                    }
                }

                @ftp_chdir($this->conn, $val);
            }
        }

        for ($i = 0; $i < $path_div; $i++) // 回退到根,因为上面的目录切换导致当前目录不在根目录
        {
            @ftp_cdup($this->conn);
        }
    }

    /**
     * 递归删除ftp端目录
     * @param string $remote_dir ftp目录地址
     * @return bool
     */
    public function delete_dir($remote_dir = '')
    {
        $list = $this->list_file($remote_dir);
        if (!empty($list)) {
            $count = count($list);
            for ($i = 0; $i < $count; $i++) {
                if (!preg_match('#\.#', $list[$i]) && !@ftp_delete($this->conn, $list[$i])) {
                    //这是一个目录，递归删除
                    $this->delete_dir($list[$i]);
                } else {
                    $this->delete_file($list[$i]);
                }
            }
        }
        if (@ftp_rmdir($this->conn, $remote_dir) === FALSE) {
            return FALSE;
        }
        return TRUE;
    }

    /**
     * 更改 FTP 服务器上的文件或目录名
     * @param string $old_file  旧文件/文件夹名
     * @param string $new_file  新文件/文件夹名
     * @return bool
     */
    public function remane( $old_file = '',  $new_file = '')
    {
        $result = @ftp_rename($this->conn, $old_file, $new_file);
        if ($result === FALSE) {
            $this->error = "移动失败";
            return FALSE;
        }
        return TRUE;
    }

    /**
     * 列出ftp指定目录
     * @param string $remote_path
     * @return string
     */
    public function list_file( $remote_path = '')
    {
        $contents = @ftp_nlist($this->conn, $remote_path);
        return $contents;
    }

    /**
     * 获取文件的后缀名
     * @param string $local_file
     * @return bool|string
     */
    private function _get_ext($local_file = '')
    {
        return (($dot = strrpos($local_file, '.')) == FALSE) ? 'txt' : substr($local_file, $dot + 1);
    }

    /**
     * 根据文件后缀获取上传编码
     * @param string $ext
     * @return string
     */
    private function _set_type($ext = '')
    {
        //如果传输的文件是文本文件，可以使用ASCII模式，如果不是文本文件，最好使用BINARY模式传输。
        return in_array($ext, ['txt', 'text', 'php', 'phps', 'php4', 'js', 'css', 'htm', 'html', 'phtml', 'shtml', 'log', 'xml'], TRUE) ? 'ascii' : 'binary';
    }

    /**
     * 修改目录权限
     * @param $path 目录路径
     * @param int $mode 权限值
     * @return bool
     */
    private function _chmod($path, $mode = 0755)
    {
        if (FALSE == @ftp_chmod($this->conn, $path, $mode)) {
            return FALSE;
        }
        return TRUE;
    }

    /**
     * 登录Ftp服务器
     */
    private function _login()
    {
        return @ftp_login($this->conn, $this->user_name, $this->password);
    }

    /**
     * 获取上传错误信息
     */
    public function get_error_msg()
    {
        return $this->error;
    }

    /**
     * 关闭ftp连接
     * @return bool
     */
    public function close()
    {
        return $this->conn ? @ftp_close($this->conn_id) : FALSE;
    }
}