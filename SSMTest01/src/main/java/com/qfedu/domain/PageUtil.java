package com.qfedu.domain;

import java.util.List;

import lombok.Data;

public class PageUtil {
 /**
  * 当前页数
  * 页大小 pageSize
  * 总记录数
  * 总页数
  * 偏移量 offset
  * 查询的结果集
  * 
  */
	private Integer pageNum;
    private Integer pageSize;
    private Integer count;
    private Integer countPage;
    private Integer offset;
    private List<ClassesPro> list;
    
    public PageUtil(int pageNum,int pageSize,int count){
    	this.pageSize=pageSize;
    	this.pageNum=pageNum;
    	this.count=count;
   
    	this.countPage=count%pageSize==0?count/pageSize:count/pageSize+1;
    	this.offset=(pageNum-1)*this.pageSize;
    	
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCountPage() {
        return countPage;
    }

    public void setCountPage(Integer countPage) {
        this.countPage = countPage;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public List<ClassesPro> getList() {
        return list;
    }

    public void setList(List<ClassesPro> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageUtil{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", count=" + count +
                ", countPage=" + countPage +
                ", offset=" + offset +
                ", list=" + list +
                '}';
    }
}
