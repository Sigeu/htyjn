<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: andy <290648237@qq.com>
// +----------------------------------------------------------------------

namespace service;

/**
 * Excel 表格服务类
 * Class PhpExcelService
 * @package service
 * @author andy <290648237@qq.com>
 * @date 2017/8/21
 */
class PhpExcelService
{

    private $_phpExcel;

    public function __construct()
    {
        vendor('PHPExcel.Classes.PHPExcel');

        //初始化
        $phpExcel = new \PHPExcel();
        $this->_phpExcel = $phpExcel;
    }


/*
    设置excel的属性：
    创建人
    $objPHPExcel->getProperties()->setCreator("Maarten Balliauw");
    最后修改人
    $objPHPExcel->getProperties()->setLastModifiedBy("Maarten Balliauw");
    标题
    $objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Test Document");
    题目
    $objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Test Document");
    描述
    $objPHPExcel->getProperties()->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.");
    关键字
    $objPHPExcel->getProperties()->setKeywords("office 2007 openxml php");
    种类
    $objPHPExcel->getProperties()->setCategory("Test result file");
*/

/*
    设置当前的sheet
    $objPHPExcel->setActiveSheetIndex(0);
    设置sheet的name
    $objPHPExcel->getActiveSheet()->setTitle('Simple');
    设置单元格的值
    $objPHPExcel->getActiveSheet()->setCellValue('A1', 'String');
    $objPHPExcel->getActiveSheet()->setCellValue('A2', 12);
    $objPHPExcel->getActiveSheet()->setCellValue('A3', true);
    $objPHPExcel->getActiveSheet()->setCellValue('C5', '=SUM(C2:C4)');
    $objPHPExcel->getActiveSheet()->setCellValue('B8', '=MIN(B2:C5)');
    合并单元格
    $objPHPExcel->getActiveSheet()->mergeCells('A18:E22');
    分离单元格
    $objPHPExcel->getActiveSheet()->unmergeCells('A28:B28');
    保护cell
    $objPHPExcel->getActiveSheet()->getProtection()->setSheet(true); // Needs to be set to true in order to enable any worksheet protection!
    $objPHPExcel->getActiveSheet()->protectCells('A3:E13', 'PHPExcel');
    设置格式
    // Set cell number formats
    echo date('H:i:s') . " Set cell number formats\n";
    $objPHPExcel->getActiveSheet()->getStyle('E4')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_CURRENCY_EUR_SIMPLE);
    $objPHPExcel->getActiveSheet()->duplicateStyle( $objPHPExcel->getActiveSheet()->getStyle('E4'), 'E5:E13' );
    设置宽width
    // Set column widths
    $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(12);
    设置font
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFont()->setName('Candara');
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFont()->setSize(20);
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFont()->setUnderline(PHPExcel_Style_Font::UNDERLINE_SINGLE);
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
    $objPHPExcel->getActiveSheet()->getStyle('E1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
    $objPHPExcel->getActiveSheet()->getStyle('D13')->getFont()->setBold(true);
    $objPHPExcel->getActiveSheet()->getStyle('E13')->getFont()->setBold(true);
    设置align
    $objPHPExcel->getActiveSheet()->getStyle('D11')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
    $objPHPExcel->getActiveSheet()->getStyle('D12')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
    $objPHPExcel->getActiveSheet()->getStyle('D13')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
    $objPHPExcel->getActiveSheet()->getStyle('A18')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
    //垂直居中
    $objPHPExcel->getActiveSheet()->getStyle('A18')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
    设置column的border
    $objPHPExcel->getActiveSheet()->getStyle('A4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $objPHPExcel->getActiveSheet()->getStyle('B4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $objPHPExcel->getActiveSheet()->getStyle('C4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $objPHPExcel->getActiveSheet()->getStyle('D4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $objPHPExcel->getActiveSheet()->getStyle('E4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    设置border的color
    $objPHPExcel->getActiveSheet()->getStyle('D13')->getBorders()->getLeft()->getColor()->setARGB('FF993300');
    $objPHPExcel->getActiveSheet()->getStyle('D13')->getBorders()->getTop()->getColor()->setARGB('FF993300');
    $objPHPExcel->getActiveSheet()->getStyle('D13')->getBorders()->getBottom()->getColor()->setARGB('FF993300');
    $objPHPExcel->getActiveSheet()->getStyle('E13')->getBorders()->getTop()->getColor()->setARGB('FF993300');
    $objPHPExcel->getActiveSheet()->getStyle('E13')->getBorders()->getBottom()->getColor()->setARGB('FF993300');
    $objPHPExcel->getActiveSheet()->getStyle('E13')->getBorders()->getRight()->getColor()->setARGB('FF993300');
    设置填充颜色
    $objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
    $objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('FF808080');
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
    $objPHPExcel->getActiveSheet()->getStyle('B1')->getFill()->getStartColor()->setARGB('FF808080');
    加图片
    $objDrawing = new PHPExcel_Worksheet_Drawing();
    $objDrawing->setName('Logo');
    $objDrawing->setDescription('Logo');
    $objDrawing->setPath('./images/officelogo.jpg');
    $objDrawing->setHeight(36);
    $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
    $objDrawing = new PHPExcel_Worksheet_Drawing();
    $objDrawing->setName('Paid');
    $objDrawing->setDescription('Paid');
    $objDrawing->setPath('./images/paid.png');
    $objDrawing->setCoordinates('B15');
    $objDrawing->setOffsetX(110);
    $objDrawing->setRotation(25);
    $objDrawing->getShadow()->setVisible(true);
    $objDrawing->getShadow()->setDirection(45);
    $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
    //处理中文输出问题
    需要将字符串转化为UTF-8编码，才能正常输出，否则中文字符将输出为空白，如下处理：
    $str  = iconv('gb2312', 'utf-8', $str);
    或者你可以写一个函数专门处理中文字符串：
    function convertUTF8($str)
    {
        if(empty($str)) return '';
        return  iconv('gb2312', 'utf-8', $str);
    }
*/

    /**
     * 导出excel
     * @param string $filename
     * @param array $letter
     * @param array $tableHeader
     * @param array $data
     */
    public function excel($filename = '', $letter = [], $tableHeader = [], $data = [])
    {

        $excel = $this->_phpExcel;

        //填充表头信息
        for ($i = 0; $i < count($tableHeader); $i++)
        {
            $excel->getActiveSheet()->setCellValue("$letter[$i]1", "$tableHeader[$i]");
        }


        //填充表格信息
        for ($i = 2; $i <= count($data) + 1; $i++)
        {
            $j = 0;
            $retData = $data[$i - 2];
            if (is_object($retData)) {
                $retData = $retData->toArray(); // 将对象转换为数组
            }
//            $retData['member_old_login_time'] = format_time($retData['member_old_login_time']);
            foreach ($retData as $key=>$value)
            {
                $excel->getActiveSheet()->setCellValue("$letter[$j]$i", "$value");
                $j++;
            }
        }

        //创建Excel输入对象
        $write = new \PHPExcel_Writer_Excel5($excel);
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");
        header('Content-Disposition:attachment;filename="'.$filename.'"');
        header("Content-Transfer-Encoding:binary");
        $write->save('php://output');
    }


    /**
     * 设置表格样式
     * @param string $column
     * @param string $style
     */
    public function setStyle($column = '', $style = \PHPExcel_Style_NumberFormat::FORMAT_TEXT)
    {
        $this->_phpExcel->getActiveSheet()->getStyle($column)->getNumberFormat()->setFormatCode($style);
    }


}

?>