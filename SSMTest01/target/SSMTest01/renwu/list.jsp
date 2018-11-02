<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
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
            <span style="float:left">当前位置是：流程管理-》任务管理</span> <span style="float:right;margin-right: 8px;font-weight: bold">
		</span>
		</span>
	</div>

<div class="morebt">
 
</div>




 <div class="cztable">

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr style="height: 25px" align="center">
                <th colspan="5">个人任务列表</th>
            </tr>

            <tr style="height: 25px" align="center">
                    <th scope="col">任务ID</th>
                    <th scope="col">任务名称</th>
                    <th scope="col">创建时间</th>
                    <th scope="col">办理人</th>
                     <th scope="col">操作</th>
            </tr>
            <c:forEach items="${list}" var="task">

            <tr style="height: 25px" align="center">
                <th scope="col">${task.id}</th>
                <th scope="col">${task.name}</th>
                <th scope="col"><fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate> </th>
                <th scope="col">${task.assignee}</th>
                <th scope="col">
                    <a href="task/one?taskId=${task.id}">办理任务</a>
                    查看当前流程图
                </th>
            </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>

    </div>
</body>
</html>