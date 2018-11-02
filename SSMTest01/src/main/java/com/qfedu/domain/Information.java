package com.qfedu.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Information {
    private Integer informationid;

    private String informationname;

    private Integer typeid;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    private String filetype;

    private String uploader;

    private String typename;

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Integer getInformationid() {
        return informationid;
    }

    public void setInformationid(Integer informationid) {
        this.informationid = informationid;
    }

    public String getInformationname() {
        return informationname;
    }

    public void setInformationname(String informationname) {
        this.informationname = informationname == null ? null : informationname.trim();
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype == null ? null : filetype.trim();
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader == null ? null : uploader.trim();
    }

    @Override
    public String toString() {
        return "Information{" +
                "informationid=" + informationid +
                ", informationname='" + informationname + '\'' +
                ", typeid=" + typeid +
                ", date=" + date +
                ", filetype='" + filetype + '\'' +
                ", uploader='" + uploader + '\'' +
                ", typename='" + typename + '\'' +
                '}';
    }
}