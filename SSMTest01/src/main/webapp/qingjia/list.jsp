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
    <title>学生信息管理平台</title>
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
            <span style="float:left">当前位置是：流程管理-》请假管理</span> <span style="float:right;margin-right: 8px;font-weight: bold">
		</span>
		</span>
	</div>

<div class="morebt">
 
</div>


 <div class="cztable">
     <div><a href="qingjia/add.jsp">添加请假单</a></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr style="height: 25px" align="center">
                <th colspan="8">请假申请列表</th>
            </tr>

            <tr style="height: 25px" align="center">
                    <th scope="col">ID</th>
                    <th scope="col">请假人</th>
                    <th scope="col">请假天数</th>
                    <th scope="col">请假事由</th>
                    <th scope="col">请假备注</th>
                    <th scope="col">请假时间</th>
                    <th scope="col">请假状态</th>
                    <th scope="col">操作</th>
                </tr>

            <c:forEach items="${list}" var="leavebill">
                <tr style="height: 25px" align="center">
                    <th scope="col">${leavebill.id}</th>
                    <th scope="col">${leavebill.username}</th>
                    <th scope="col">${leavebill.days}</th>
                    <th scope="col">${leavebill.content}</th>
                    <th scope="col">${leavebill.remark}</th>
                    <th scope="col"><fmt:formatDate value="${leavebill.date}" pattern="yyyy-MM-dd"></fmt:formatDate> </th>
                    <th scope="col">
                        <c:if test="${leavebill.state==0}">初始录入</c:if>
                        <c:if test="${leavebill.state==1}">开始审批</c:if>
                        <c:if test="${leavebill.state==2}">审批完成</c:if>
                        <c:if test="${leavebill.state==3}">审核未通过</c:if>
                    </th>
                    <th scope="col">
                        <c:if test="${leavebill.state==0}">
                            <a href="leavebill/prepareToUpdate?leavebillid=${leavebill.id}">修改</a>
                            <a href="">删除</a>
                            <a href="leavebill/commit?id=${leavebill.id}&username=${leavebill.username}">提交申请</a>
                        </c:if>

                        <c:if test="${leavebill.state==1}">
                            <a href="leavebill/query?id=${leavebill.id}">查看</a>
                        </c:if>

                        <c:if test="${leavebill.state==2}">
                            <a href="leavebill/query?id=${leavebill.id}">查看</a>
                            <a href="">删除</a>
                        </c:if>

                        <c:if test="${leavebill.state==3}">
                            <a href="leavebill/prepareToUpdate?leavebillid=${leavebill.id}">修改</a>
                            <a href="">删除</a>
                            <a href="leavebill/recommit?id=${leavebill.id}">再次提交申请</a>
                        </c:if>

                    </th>
                </tr>
            </c:forEach>


            </tbody>
        </table>
    </div>

    </div>
</body>
</html>