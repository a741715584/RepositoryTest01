<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>用户登录</title>
    <link href="css/admin.css" type="text/css" rel="stylesheet" />
</head>
<body >
<table cellspacing=0 cellpadding=0 width="100%"
       background="./img/header_bg.jpg" border=0>
    <tr height=56>
        <td width=260>
            <!--<img height=56 src="img/header_left.jpg"  width=260>--></td>
        <td style="font-weight: bold; color: #fff; padding-top: 20px"
            align=middle>
            <!-- onclick="if (confirm('确定要退出吗？')) return true; else return false;"  -->
        </td>
        <td style="font-weight: bold; color: #fff; padding-top: 20px"
            align="right">
            当前用户：${user.userName} &nbsp;&nbsp;
            <a style="color: #fff"  href="user/password.jsp"  target="right">修改口令</a>
            &nbsp;&nbsp;
            <a style="color: #fff"  href="login.jsp" target=_top>退出系统</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td></tr></table>
<table cellspacing=0 cellpadding=0 width="100%" border=0>
    <tr bgcolor=#1c5db6 height=4>
        <td></td>
    </tr>
</table>

</body>
</html>