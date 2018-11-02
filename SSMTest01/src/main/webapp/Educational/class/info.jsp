<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：教务中心-》班级管理-》新增</span>
                <span style="float:right;margin-right: 8px;font-weight: bold"></span>
            </span>
</div>
</div>
<div class="cztable">
    <form action="list.html" method="post">
        <table border="1" width="100%" class="table_a">

            <tr>
                <td  width="120px;">班级编号：<span style="color:red">*</span>：</td>
                <td>
                   ${classMessage.classnum}
                </td>
            </tr>

            <tr>
                <td>学院<span style="color:red">*</span>：</td>
                <td>
                    ${classMessage.name}
                </td>
            </tr>
            <tr>
                <td>专业<span style="color:red">*</span>：</td>
                <td>

                      ${classMessage.name1}

                </td>
            </tr>

            <tr>
                <td>班级名称：<span style="color:red">*</span>：</td>
                <td>
                   ${classMessage.classname}
                </td>
            </tr>

            <tr>
                <td>开班时间：<span style="color:red">*</span>：</td>
                <td>
                    <fmt:formatDate value="${classMessage.classbegin}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
            </tr>
            <tr>
                <td>毕业时间：<span style="color:red">*</span>：</td>
                <td>
                    <fmt:formatDate value="${classMessage.classend}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
            </tr>


            <tr>
                <td>简介<span style="color:red">*</span>：</td>
                <td>
                    ${classMessage.classcontent}
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="返回" onclick="history.back();">
                </td>
            </tr>
        </table>
    </form>
</div>

</div>
</div>
</div>
</body>
</html>