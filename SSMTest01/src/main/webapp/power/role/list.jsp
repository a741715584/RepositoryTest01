<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mytag" uri="http://vmaxtam.com/mytag" %>

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
    <script>
        function del(roleid){
            if(confirm("确认删除？")){
                alert(roleid);
                $.ajax({
                       type:"post",
                       url:"role/delete",
                       data:"roleid="+roleid,
                       success:function (data) {
                            if(data>0){
                                alert("删除成功！！！");
                            }else{
                                alert("删除失败！！！")
                            }
                       }

                   })

            }
        }

    </script>
</head>
<body>



<div class="div_head" style="width: 100%;text-align:center;">
		<span> <span style="float:left">当前位置是：权限管理-》角色管理</span> <span
                style="float:right;margin-right: 8px;font-weight: bold">
			<a style="text-decoration: none;" href="role/prepareToAdd">【新增角色】</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		</span>
</div>

<div class="morebt">

</div>


<div class="cztable">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr style="height: 25px" align="center">

            <th><input type="checkbox"/></th>
            <th scope="col">
                序号
            </th>

            <th scope="col">
                角色名称
            </th>
            <th scope="col">
                状态
            </th>
            <th scope="col" width="300px">
                操作
            </th>
        </tr>

        <c:forEach items="${pi.list}" var="role">
        <tr align="center">
                <th><input type="checkbox"/></th>
                <td>
                    ${role.roleid}
                </td>
                <td>
                    ${role.rolename}
                </td>
                <td>&nbsp;
                    <c:choose>
                        <c:when test="${role.rolestate==1}">
                            启用
                        </c:when>
                        <c:otherwise>
                            未启用
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>&nbsp;
                    <a href="javascript:alert('操作成功');">
                            ${role.rolestate==1?"禁用":"启用"}
                    </a>
                    <a href="role/getone?roleid=${role.roleid}">详情</a>
                    <a href="role/prepareToUpdate?roleid=${role.roleid}">修改</a>
                    <c:if test="${user.roleId!=role.roleid}">
                        <a href="javascript:void(0)" onclick="del('${role.roleid}');return false" class="tablelink"> 删除</a>
                    </c:if>
                </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <mytag:fy url="role/all?iddd=1" pageInfo="${pi}"></mytag:fy>
</div>
</div>

</div>
</body>
</html>