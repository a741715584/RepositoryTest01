<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <script src="Script/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function searchData(ctype, type) {
            if (type == "t") {
                var c = $("#cValue").val();
                window.location = 'StudentMaterial.aspx?ctype=' + ctype + "&cid=" + c;
            } else if (type == "c") {
                var t = $("#tValue").val();
                window.location = 'StudentMaterial.aspx?cid=' + ctype + "&ctype=" + t;
            }
        }
        //查询的填充
        $().ready(function () {
            var ctype = Request.QueryString("ctype");
            var cid = Request.QueryString("cid");
            if (ctype != null && ctype != "") {
                $("#tValue").val(ctype);
                $("#" + ctype).addClass("hover");
            } else {
                $("#tAll").addClass("hover");
            }
            if (cid != null && cid != "") {
                $("#cValue").val(cid);
                $("#" + cid).addClass("hover");
            } else {
                $("#cAll").addClass("hover");
            }
        });
    </script>
</head>
<body>

<div class="div_head" style="width: 100%;text-align:center;">
            <span>
                <span style="float:left">当前位置是：学习中心-》资料中心</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                	<a style="text-decoration: none" href="book/add.jsp">【上传】</a> &emsp;
                    <a style="text-decoration: none" href="javascript:history.back();">【返回】</a> &emsp;&emsp;
                </span>
            </span>
</div>


<div class="feilei">
    <a href="#"><strong>资料中心</strong></a></div>
<input type="hidden" id="cValue" value="" />
<input type="hidden" id="tValue" value="" />
<div class="fllist">
    <ul>
        <li>
            <strong>
                标题:
            </strong>

                <input type="text" name="informationname" id="informationname" value="${informationname}" /><input type="button" onclick="search()" value="搜索" />


        </li>



        <li><strong>类型：</strong><a href="#" id="tAll" >全部</a>

            <a href="#" id="1" >
                复习资料</a>

            <a href="#" id="2" >
                练习题</a>

            <a href="#" id="3" >
                内部资料</a>

            <a href="#" id="4" >
                真题</a>

        </li>
    </ul>
    <div class="cztable">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
            <tr>
                <th width="6%">格式</th>
                <th style="padding-left: 20px;">
                    资料名称
                </th>
                <th style="width: 15%; text-align: center;">
                    资料类型
                </th>
                <th style="width: 15%; text-align: center;">
                    更新时间
                </th>
                <th style="width: 15%; text-align: center;">
                    操作
                </th>
            </tr>
            <c:forEach items="${pi.list}" var="inf">


            <tr>
                <td><img src='Images/FileIco/doc.gif' /></td>
                <td class="xxleft">
                    ${inf.informationname}

                </td>
                <td>
                    ${inf.typename}
                </td>
                <td>
                    <fmt:formatDate value="${inf.date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
                <td>
                    <a href="info-ziliao.html">详情</a>
                    <a href="edit-ziliao.html">编辑</a>
                </td>
            </tr>

            </c:forEach>

        </table>
       <mytag:fy url="information/list?informationname=${informationname}" pageInfo="${pi}"></mytag:fy>
    </div>
</div>

</div>
</div>

</div>

<script type="text/javascript">
    function search(){
        var val = $("#informationname").val();
        location.href="information/list?informationname="+val;
    }

</script>
</body>
</html>