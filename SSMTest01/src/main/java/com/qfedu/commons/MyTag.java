package com.qfedu.commons;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class MyTag extends SimpleTagSupport {
    String info ;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public void doTag() throws JspException, IOException {
        System.out.println("简单标签的定义。。。。");
        JspWriter jspWriter = this.getJspContext().getOut();
        jspWriter.write("<red>hello world</red>");

        JspFragment jspFragment = getJspBody();
        jspFragment.invoke(null);
    }
}
