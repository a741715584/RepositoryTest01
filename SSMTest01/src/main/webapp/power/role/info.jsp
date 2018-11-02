<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <span style="float:left">当前位置是：权限管理-》角色管理-》详情</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="javascript:history.back();">【返回】</a>
                </span>
            </span>
</div>
</div>
<div class="cztable">

        <table border="1" width="100%" class="table_a">
            <tr  width="120px;">
                <td width="120px">角色名：<span style="color:red">*</span>：</td>
                <td>
                    ${role.rolename}
                </td>
            </tr>

            <tr  width="120px;">
                <td>菜单资源<span style="color:red">*</span>：</td>
                <td>
                    <ul>
                        <c:forEach items="${role.list}" var="m" varStatus="ms">
                            <c:if test="${m.upmenuid==-1}">
                                <li>${m.menuname}
                                    <ul>
                                        <c:forEach items="${role.list}" var="mChild" >
                                            <c:if test="${mChild.upmenuid==m.menuid}">
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;${mChild.menuname}</li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </td>
            </tr>

            <tr>
                <td>启用状态<span style="color:red">*</span>：</td>
                <td>
                    <input type="radio" name="state" ${role.rolestate==1?"checked":""} />启用
                    <input type="radio" name="state"  ${role.rolestate==0?"checked":""} />禁用
                </td>
            </tr>


        </table>
</div>

</div>
</div>

</div>
</body>
</html>