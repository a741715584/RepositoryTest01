<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
    学生信息管理平台
</title>
    <link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" />
    <link href="Style/ks.css" rel="stylesheet" type="text/css" />
    <link href="css/mine.css" type="text/css" rel="stylesheet">
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <script>
        function del(){
            confirm("确认删除？");
        }

    </script>
</head>
<body>



<div class="div_head" style="width: 100%;text-align:center;">
		<span>
            <span style="float:left">当前位置是：查看审核信息</span> <span style="float:right;margin-right: 8px;font-weight: bold">
		</span>
		</span>
</div>

<div class="morebt">

</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>

<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr style="height: 25px" align="center">
            <th colspan="8">显示请假申请的批注信息</th>
        </tr>
        <c:forEach items="${comments}" var="comm">

            <tr style="height: 25px" align="center">
                <th scope="col">${comm.id}</th>
                <th scope="col">${comm.time}</th>
                <th scope="col">${comm.userId}</th>
                <th scope="col">${comm.fullMessage}</th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>