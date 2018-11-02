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
    <title>学生信息管理平台</title>
    <link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" />
    <link href="Style/ks.css" rel="stylesheet" type="text/css" />
    <link href="css/mine.css" type="text/css" rel="stylesheet">
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js"
            type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js"
            type="text/javascript"></script>
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
		<span> <span style="float:left">当前位置是：教务中心-》班级审核</span> <span
                style="float:right;margin-right: 8px;font-weight: bold">
		</span>
		</span>
</div>

<div class="cztable">
    <div>

        <ul class="seachform1">
            <form action="#" method="post">
                <li>
                    <label>班级编号</label>
                    <input name="name" type="text" class="scinput1" value=""/>&nbsp;&nbsp;
                    <label>班级名称</label>
                    <input name="name" type="text" class="scinput1" value=""/>&nbsp;&nbsp;
                    <input  type="submit" class="scbtn" value="查询"/>&nbsp;
                </li>

            </form>
        </ul>
        <br/>

        <table class="table_a" border="1" width="100%">
            <tbody><tr style="font-weight: bold;">
                <td align="center">序号</td>
                <td >院系</td>
                <td width="">班级编号</td>
                <td width="">班级名称</td>
                <td width="15%">班主任老师</td>
                <td width="15%">人数</td>
                <td width="15%">班级状态</td>
                <td width="15%">操作</td>
            </tr>
            <c:forEach items="${pageUtil.list}" var="cla">
                <tr id="product1">
                    <td  width="8%" align="center">
                        <input type="checkbox" value="${cla.classid}" name="single"/>
                    </td>
                    <td align="center">${cla.name}</td>
                    <td align="center">${cla.classnum}</td>
                    <td align="center">${cla.classname}</td>
                    <td align="center">${cla.classteacher}</td>
                    <td align="center">${cla.peoplecount}</td>
                    <td align="center">
                        <c:if test="${cla.statecount==1}">初次审核</c:if>
                        <c:if test="${cla.statecount>=2}">复审</c:if>
                    </td>
                    <td align="center">
                        <a href="classes/updateState?classid=${cla.classid}&classstate=审核通过">通过</a>
                        <a href="classes/updateState?classid=${cla.classid}&classstate=审核未通过">驳回</a>
                        详细
                    </td>
                </tr>
            </c:forEach>


            <tr>
                <td colspan="20" style="text-align: center;">
                    <a style="text-decoration: none;" href="#">
                        <%--<a href="classes/listPro?pageNum=1&pageSize=${pageUtil.pageSize}">首页</a>--%>
                        <%--<c:choose>--%>
                            <%--<c:when test="${pageUtil.pageNum==1}">--%>

                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                                <%--<a href="classes/listPro?pageNum=${pageUtil.pageNum-1}&pageSize=${pageUtil.pageSize}">上一页</a>--%>
                            <%--</c:otherwise>--%>
                        <%--</c:choose>--%>
                        <%--<c:forEach var="i" begin="1" end="${pageSize.countPage}">--%>
                            <%--<a href="classes/listPro?index=${i}&size=${pageUtil.pageSize}">${i}</a>--%>
                        <%--</c:forEach>--%>
                        <%--<c:choose>--%>
                            <%--<c:when test="${pageUtil.pageNum==pageUtil.countPage}">--%>

                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                                <%--<a href="classes/listPro?pageNum=${pageUtil.pageNum+1}&pageSize=${pageUtil.pageSize}">下一页</a>--%>
                            <%--</c:otherwise>--%>
                        <%--</c:choose>--%>

                        <%--<a href="classes/listPro?pageNum=${pageUtil.countPage}&pageSize=${pageUtil.pageSize}">尾页</a>--%>
                        <%--共${pi.total}条--%>
                        <%--每页显示--%>
                        <%--<select name="num">--%>
                            <%--<option value="5" <c:if test="${pageUtil.pageSize==5}">selected</c:if> >5</option>--%>
                            <%--<option value="10" <c:if test="${pageUtil.pageSize==10}">selected</c:if>>10</option>--%>
                            <%--<option value="15" <c:if test="${pageUtil.pageSize==15}">selected</c:if>>15</option>--%>
                        <%--</select>   ${pageUtil.pageNum}/${pageUtil.countPage} </a>--%>

                       <mytag:sortpage url="classes/listPro" pageUtil="${pageUtil}"></mytag:sortpage>
                </td>
                <script type="text/javascript">
                    $(function(){
                        $("[name=num]").change(function(){
                            var size=$(this).val();
                            location.href="classes/listPro?pageSize="+size;
                        });
                    })
                </script>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
