<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：个人中心-》我的信息</span>
                <span style="float:right;margin-right: 8px;font-weight: bold"></span>
            </span>
</div>
</div>
<div class="cztable">
    <!--修改action-->
    <form action="User_tb/update" method="post">
        <input type="hidden" name="userId" value="${user.userId}">
        <input type="hidden" name="regdate" value="${user.regdate}">
        <input type="hidden" name="logincount" value="${user.logincount}">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr  width="120px;">
                <td width="120px">用户名：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text"   name="userName" value="${user.userName}" />
                </td>
            </tr>

            <tr  width="120px;">
                <td>姓名<span style="color:red">*</span>：</td>
                <td>
                    <input type="text"  name="userRealname" value="${user.userRealname}" />
                </td>
            </tr>
            <tr>
                <td>性别<span style="color:red">*</span>：</td>
                <td>
                    <c:choose>
                        <c:when test="${user.userSex eq '男'}">
                            <input type="radio" name="userSex" checked value="1" />男
                            <input type="radio" name="userSex" value="0"/>女
                        </c:when>
                        <c:otherwise>
                            <input type="radio" name="userSex"  value="1" />男
                            <input type="radio" name="userSex" checked value="0"/>女

                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>

            <tr>
                <td>EMAIL：</td>
                <td>
                    <input type="text" name="userEmail" value="${user.userEmail}" />
                </td>
            </tr>

            <tr>
                <td>联系电话：</td>
                <td>
                    <input type="text" name="userPhone" value="${user.userPhone}" />
                </td>
            </tr>

            <tr>
                <td>住址：</td>
                <td>
                    <input type="text" name="userAddress" value="${user.userAddress}" />
                </td>
            </tr>

            <tr>
                <td>身份证号：</td>
                <td>
                    <input type="text" name="userIdcard" value="${user.userIdcard}" />
                </td>
            </tr>


            <tr>
                <td>简介<span style="color:red">*</span>：</td>
                <td>
                    <textarea name="userContent">${user.userContent}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="更新">
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