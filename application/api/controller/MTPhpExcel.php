<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2019/4/21
 * Time: 9:24
 */
namespace app\api\controller;
use think\Db;

class MTPhpExcel
{
    /**
     * 测试方法 1
     * (根据传入的 excel 文件导入MySQL)
     * @return array
     */
    public function inputMySQLTest()
    {
        $excel_file_path = "./cms/file/bird_express.xlsx";
        $excelArr = $this->readExcelFileToArray($excel_file_path);
        $resultArr = [];
        //TODO 将获取的数组数据进行优化，并压入目标数组 $resultArr
        foreach ($excelArr as $key => $value) {
            $resultArr[$key]['name'] = $value[0];
            $resultArr[$key]['code'] = $value[1];
        }
        //var_dump($resultArr);
        /**
         * TODO 此时进行数据表记录的遍历插入操作即可
         * 因为数据量较大，建议使用批量插入的方式
         * 以我的业务需求，代码举例如下：
         */
        //Db::name('xbird_express')->data($resultArr)->limit(50)->insertAll();
        return $resultArr;
    }

    /**
     * 测试方法 2
     * (根据得到的的数组数据，导出Excel文件)
     */
    public function outputToExcelTest()
    {
        //测试数据(数组形式)，一般来源于数据表查询
        $list = [
            ['name' => '顺丰速运', 'code' => 'SF', 'mark' => '很贵的哦'],
            ['name' => '百世快递', 'code' => 'HTKY', 'mark' => 'en嗯嗯'],
            ['name' => '中通快递', 'code' => 'ZTO', 'mark' => '还是挺快的！'],
            ['name' => '申通快递', 'code' => 'STO', 'mark' => 'God bless you！'],
            ['name' => '圆通速递', 'code' => 'YTO', 'mark' => '施主您好'],
            ['name' => '韵达速递', 'code' => 'YD', 'mark' => '大学的记忆'],
            ['name' => '邮政快递包裹', 'code' => 'YZPY', 'mark' => '听，起风了~'],
        ];
        $headerArr = ['快递名称', '编码', '备注'];
        //设置保存的Excel表格名称
        $excelTitle = 'moTzxx表格导出测试';
        $save_fileUrl = "moTzxx快递公司".date('Ymd-His', time()) . ".xls";
        $this->outputDataToExcelFile($list, $headerArr, $excelTitle, $save_fileUrl);
    }

    /**
     * 将得到的数组数据，转化为Excel文件导出
     * @param array $list 数组数据
     * @param array $headerArr 显示的顶部导航栏
     * @param string $excelTitle 表格标题
     * @param string $save_fileUrl 构建存储文件，注意扩展名
     */
    public function outputDataToExcelFile($list = [], $headerArr = [],
                                          $excelTitle = "", $save_fileUrl = "")
    {
        //实例化PHPExcel类
        $objPHPExcel = new \PHPExcel();
        //设置头信息 激活当前的sheet表
        $objPHPExcel->setActiveSheetIndex(0);
        $keyC = ord('A');
        foreach ($headerArr as $head) {
            $colKey = chr($keyC);
            //TODO 设置表格头（即excel表格的第一行）
            $objPHPExcel->getActiveSheet()->setCellValue($colKey . '1', $head);
            //设置单元格宽度
            $objPHPExcel->getActiveSheet()->getColumnDimension($colKey)->setWidth(20);
            $keyC++;
        }

        $colIndex = 2;
        foreach ($list as $key => $rows) {
            $colKey2 = ord('A');
            foreach ($list[$key] as $keyName => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue(chr($colKey2) . $colIndex, $value);
                $colKey2++;
            }
            $colIndex++;
        }

        //设置当前激活的sheet表格名称；
        $objPHPExcel->getActiveSheet()->setTitle($excelTitle);
        //设置浏览器窗口下载表格
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:inline;filename="' . $save_fileUrl . '"');
        //生成excel文件
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        //下载文件在浏览器窗口
        $objWriter->save('php://output');
        exit;
    }

    /**
     * 将读取到的 excel 文件转化为数组数据并返回
     * 此处的要求是：
     *          excel文件的后缀名不要手动改动，一般为 xls、xlsx
     *          excel文件中的数据尽量整理的跟数据表一样规范
     *
     * @param $excel_file_path 文件路径，保证能访问到
     * @return array
     */
    public function readExcelFileToArray($excel_file_path)
    {
        if (!file_exists($excel_file_path)) {
            die('Sorry, file not found!');
        } else {
            $extension = strtolower(pathinfo($excel_file_path, PATHINFO_EXTENSION));
            $objExcel = null;
            if ($extension == 'xlsx') {
                $objReader = new \PHPExcel_Reader_Excel2007();
                $objExcel = $objReader->load($excel_file_path);
            } else if ($extension == 'xls') {
                $objReader = new \PHPExcel_Reader_Excel5();
                $objExcel = $objReader->load($excel_file_path);
            } else if ($extension == 'csv') {
                $PHPReader = new \PHPExcel_Reader_CSV();
                //默认输入字符集
                $PHPReader->setInputEncoding('GBK');
                //默认的分隔符
                $PHPReader->setDelimiter(',');
                //载入文件
                $objExcel = $PHPReader->load($excel_file_path);
            }
            $excelArr = $objExcel->getSheet(0)->toArray();
        }
        return $excelArr;
    }
}