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
    <base href="<%=basePath%>"><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
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
            <span style="float:left">当前位置是：流程管理-》修改请假单</span> <span style="float:right;margin-right: 8px;font-weight: bold">
		</span>
		</span>
	</div>

<div class="morebt">
 
</div>



 <div class="cztable">


     <form action="leavebill/update" method="post">
     <table width="100%">
         <tr>
             <th colspan="2">请假单</th>
         </tr>
         <<input type="hidden" value="${leaveBill.id}" name="id">
         <tr>
             <th>请假人:</th>
             <th><input type="text" name="username" value="${user.userName}" readonly/> </th>
         </tr>
         <tr>
             <th>请假天数:</th>
             <th><input name="days" value="${leaveBill.days}" type="text"/> </th>
         </tr>
         <tr>
             <th>请假理由:</th>
             <th><input name="content" value="${leaveBill.content}" type="text"/> </th>
         </tr>
         <tr>
             <th>请假备注:</th>
             <th><input name="remark" value="${leaveBill.remark}" type="text"/> </th>
         </tr>
         <tr>
             <th>请假日期:</th>
             <th><input name="date" value="<fmt:formatDate value='${leaveBill.date}' pattern="yyyy-MM-dd" />" type="date"/> </th>
         </tr>
         <tr>
             <th colspan="2"><input type="submit" value="更新"> </th>
         </tr>
     </table>
     </form>
    </div>

    </div>
</body>
</html>