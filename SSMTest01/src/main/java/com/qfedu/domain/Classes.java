package com.qfedu.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Classes {
    private Integer classid;

    private String classnum;

    private Integer deptid;

    private Integer majorid;

    private String classname;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date classbegin;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date classend;

    private String classcontent;

    private String classqq;

    private String tagline;

    private String classteacher;

    private Integer peoplecount;

    private String classstate;

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public String getClassnum() {
        return classnum;
    }

    public void setClassnum(String classnum) {
        this.classnum = classnum == null ? null : classnum.trim();
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Date getClassbegin() {
        return classbegin;
    }

    public void setClassbegin(Date  classbegin) {
        this.classbegin = classbegin;
    }

    public Date getClassend() {
        return classend;
    }

    public void setClassend(Date classend) {
        this.classend = classend;
    }

    public String getClasscontent() {
        return classcontent;
    }

    public void setClasscontent(String classcontent) {
        this.classcontent = classcontent == null ? null : classcontent.trim();
    }

    public String getClassqq() {
        return classqq;
    }

    public void setClassqq(String classqq) {
        this.classqq = classqq == null ? null : classqq.trim();
    }

    public String getTagline() {
        return tagline;
    }

    public void setTagline(String tagline) {
        this.tagline = tagline == null ? null : tagline.trim();
    }

    public String getClassteacher() {
        return classteacher;
    }

    public void setClassteacher(String classteacher) {
        this.classteacher = classteacher == null ? null : classteacher.trim();
    }

    public Integer getPeoplecount() {
        return peoplecount;
    }

    public void setPeoplecount(Integer peoplecount) {
        this.peoplecount = peoplecount;
    }

    public String getClassstate() {
        return classstate;
    }

    public void setClassstate(String classstate) {
        this.classstate = classstate == null ? null : classstate.trim();
    }

    @Override
    public String toString() {
        return "Classes{" +
                "classid=" + classid +
                ", classnum='" + classnum + '\'' +
                ", deptid=" + deptid +
                ", majorid=" + majorid +
                ", classname='" + classname + '\'' +
                ", classbegin=" + classbegin +
                ", classend=" + classend +
                ", classcontent='" + classcontent + '\'' +
                ", classqq='" + classqq + '\'' +
                ", tagline='" + tagline + '\'' +
                ", classteacher='" + classteacher + '\'' +
                ", peoplecount=" + peoplecount +
                ", classstate='" + classstate + '\'' +
                '}';
    }
}