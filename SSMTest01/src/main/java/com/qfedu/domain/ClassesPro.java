package com.qfedu.domain;

import java.util.Date;

public class ClassesPro {
    private Integer classid;

    private String classnum;

    private Integer deptid;

    private Integer majorid;

    private String classname;

    private Date classbegin;

    private Date classend;

    private String classcontent;

    private String classqq;

    private String tagline;

    private String classteacher;

    private Integer peoplecount;

    private String classstate;
    private Integer statecount;
    //学院
    private String  name;
    //专业
    private String name1;

    public Integer getStatecount() {
        return statecount;
    }

    public void setStatecount(Integer statecount) {
        this.statecount = statecount;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public void setClassbegin(Date classbegin) {
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

}