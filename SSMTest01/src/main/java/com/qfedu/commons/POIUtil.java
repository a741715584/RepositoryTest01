package com.qfedu.commons;

import com.qfedu.domain.Classes;
import com.qfedu.domain.ClassesPro;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class POIUtil {
    private static String path;
    private static  HSSFWorkbook hssfWorkbook;
    private static HSSFSheet sheet;
    //设置路径
    public static void setPath(String path){
       POIUtil.path = path;
    }
    //创建Excel表格
    public static void createExl() {
         hssfWorkbook   =  new HSSFWorkbook();
    }
    //创建表单
    public static void createSheet(String name){
        sheet = hssfWorkbook.createSheet(name);
    }
    //填充表格头
    public static  void addHead(String[] name){
        HSSFRow row = sheet.createRow(0);
        for(int i = 0;i<name.length;i++){
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(name[i]);
        }
    }
    // 填充表格体
    public static  void addBody(List<ClassesPro> list){
        for(int i = 0;i<list.size();i++){
            HSSFRow row = sheet.createRow(i+1);
            ClassesPro classes = list.get(i);
            row.createCell(0).setCellValue(classes.getName());
            row.createCell(1).setCellValue(classes.getClassnum());
            row.createCell(2).setCellValue(classes.getClassname());
            row.createCell(3).setCellValue(classes.getClassteacher());
            row.createCell(4).setCellValue(classes.getPeoplecount());
            row.createCell(5).setCellValue(classes.getClassstate());
        }
    }
     //导出
    public static void grow() throws IOException {
        hssfWorkbook.write(new File(path));
    }
}
