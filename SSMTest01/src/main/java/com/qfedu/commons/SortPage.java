package com.qfedu.commons;

import com.qfedu.domain.PageUtil;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class SortPage extends SimpleTagSupport {
    private String url;
    private PageUtil pageUtil;

    public void setUrl(String url) {
        this.url = url;
    }

    public void setPageUtil(PageUtil pageUtil) {
        this.pageUtil = pageUtil;
    }

    /*
    *                        <a href="classes/listPro?pageNum=1&pageSize=${pageUtil.pageSize}">首页</a>
                        <c:choose>
                            <c:when test="${pageUtil.pageNum==1}">

                            </c:when>
                            <c:otherwise>
                                <a href="classes/listPro?pageNum=${pageUtil.pageNum-1}&pageSize=${pageUtil.pageSize}">上一页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="i" begin="1" end="${pageSize.countPage}">
                            <a href="classes/listPro?index=${i}&size=${pageUtil.pageSize}">${i}</a>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageUtil.pageNum==pageUtil.countPage}">

                            </c:when>
                            <c:otherwise>
                                <a href="classes/listPro?pageNum=${pageUtil.pageNum+1}&pageSize=${pageUtil.pageSize}">下一页</a>
                            </c:otherwise>
                        </c:choose>

                        <a href="classes/listPro?pageNum=${pageUtil.countPage}&pageSize=${pageUtil.pageSize}">尾页</a>
                        共${pi.total}条
                        每页显示
                        <select name="num">
                            <option value="5" <c:if test="${pageUtil.pageSize==5}">selected</c:if> >5</option>
                            <option value="10" <c:if test="${pageUtil.pageSize==10}">selected</c:if>>10</option>
                            <option value="15" <c:if test="${pageUtil.pageSize==15}">selected</c:if>>15</option>
                        </select>   ${pageUtil.pageNum}/${pageUtil.countPage} </a>
                </td>
    * */

    @Override
    public void doTag() throws JspException, IOException {
        JspWriter jspWriter = getJspContext().getOut();
        jspWriter.print("<a href='"+url+"?pageNum=1&pageSize="+pageUtil.getPageSize()+"'>首页</a>");
        jspWriter.print(" <a href='"+url+"?pageNum="+(pageUtil.getPageNum()==1?1:pageUtil.getPageNum()+1)+"&pageSize="+pageUtil.getPageSize()+"'>上一页</a>");
        jspWriter.print(" <a href='"+url+"?pageNum="+(pageUtil.getPageNum()==pageUtil.getCountPage()?pageUtil.getCountPage():pageUtil.getPageNum()+1)+"&pageSize="+pageUtil.getPageSize()+"'>下一页</a>");
        jspWriter.print("<a href='"+url+"?pageNum="+pageUtil.getCountPage()+"&pageSize="+pageUtil.getPageSize()+"'>尾页</a>");
        jspWriter.print(" 共"+pageUtil.getCount()+"条");
    }
}
