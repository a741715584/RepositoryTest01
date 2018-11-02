<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="css/admin.css" type="text/css" rel="stylesheet" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
</head>
<body >
<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
    <tr height=28>
        <td background=./img/title_bg1.jpg>当前位置: </td></tr>
    <tr>
        <td bgcolor=#b1ceef height=1></td></tr>
    <tr height=20>
        <td background=./img/shadow_bg.jpg></td></tr></table>
<table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
    <tr height=100>
        <td align=middle width=100>
            <img height=100 src="./img/admin_p.gif"  width=90>
        </td>
        <td width=60>&nbsp;</td>
        <td>
            <table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

                <tr>
                    <td>当前时间：<fmt:formatDate value="${date}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> </td>
                </tr>
                <tr>
                    <td style="font-weight: bold; font-size: 16px">${user.userName}</td>
                </tr>
                <tr>
                    <td>欢迎进入网站管理中心！</td></tr></table></td>
    </tr>
    <tr>
        <td colspan=3 height=10></td></tr></table>
<table cellspacing=0 cellpadding=0 width="95%" align=center border=0>
    <tr height=20>
        <td></td></tr>
    <tr height=22>
        <td style="padding-left: 20px; font-weight: bold; color: #ffffff"
            align=middle background=./img/title_bg2.jpg>个人信息</td></tr>
    <tr bgcolor=#ecf4fc height=12>
        <td></td></tr>
    <tr height=20>
        <td></td></tr></table>
<table cellspacing=0 cellpadding=2 width="95%" align=center border=0>
    <tr>
        <td align=right width=100>登陆帐号：</td>
        <td style="color: #880000">${user.userName}</td></tr>
    <tr>
        <td align=right>真实姓名：</td>
        <td style="color: #880000">${user.userRealname}</td></tr>
    <tr>
        <td align=right>注册时间：</td>
        <td style="color: #880000">${user.regdate}</td></tr>
    <tr>
        <td align=right>登陆次数：</td>
        <td style="color: #880000">${user.logincount+1}</td></tr>
    <tr>
        <td align=right>上线时间：</td>
        <td style="color: #880000">2008-12-27 17:02:54</td></tr>
    <tr>
        <td align=right>电话查询：</td>
        <td style="color: #880000"><input type="text" id="mobile"><span id="showmessage" style="color: red;"></span>
                        <br><button onclick="chaxun()">查询</button>
        </td></tr>


</table>
<div style="text-align:center;">
    <p>维护信息：<a href="http://www.zparkedu.com" target="_blank">湖南管理学院</a></p>
    <p>联系电话：<a href="http://www.zparkedu.com" target="_blank">17110771077</a></p>
</div>

<script type="text/javascript">
    function chaxun() {
        var val = $("#mobile").val();
        $.ajax({
            type:"post",
            url:"weather/city",
            data:"mobile="+val,
            success:function (data) {
                $("#mobile").next().html(data);
            }

        });
    }
</script>
</body>
</html>