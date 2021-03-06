<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <script type="text/javascript">
        $(function () {
            m();
        });

        function m(){
            var major =  $("#major")[0];
            var depart = $("#depart").val();
            var name1 = $("#name1").val();
            major.length=0;

            $.ajax({
                type:"post",
                url:"major/byId",
                data:{"departId":depart},
                success:function (data) {
//                    alert("成功获取")
                    for(var i = 0;i<data.length;i++){
                        var option = new Option(data[i].majorname,data[i].majorid);
                        if(name1==data[i].majorname){
                            option.selected=true;
                        }
                        major.add(option);
                    }
                }
            });

        }

    </script>
</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：教务中心-》班级管理-》新增</span>
                <span style="float:right;margin-right: 8px;font-weight: bold"></span>
            </span>
</div>
</div>
<div class="cztable">
    <form action="list.html" method="post">
        <table border="1" width="100%" class="table_a">

            <tr>
                <td  width="120px;">班级编号：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text" name="f_goods_name" value="${classMessage.classnum}" />
                </td>
            </tr>

            <tr>
                <td>学院<span style="color:red">*</span>：</td>
                <td>
                    <select id="depart" name="deptid" onchange="m()">
                        <c:forEach items="${list}" var="d">
                            <c:choose>
                                <c:when test="${d.departname==classMessage.name}">
                                    <option value="${d.departid}" selected>${d.departname}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${d.departid}">${d.departname}</option>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>专业<span style="color:red">*</span>：</td>
                <input type="hidden" value="${classMessage.name1}" id="name1">
                <td>
                    <select id="major" name="majorid">
                    </select>
                </td>
            </tr>

            <tr>
                <td>班级名称：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text" name="f_goods_price" value="${classMessage.classname}" /></td>
            </tr>

            <tr>
                <td>开班时间：<span style="color:red">*</span>：</td>
                <td>
                    <input type="date" name="f_goods_price" value="<fmt:formatDate value='${classMessage.classbegin}' pattern='yyyy-MM-dd' />"  /></td>
            </tr>
            <tr>
                <td>毕业时间：<span style="color:red">*</span>：</td>
                <td>
                    <input type="date" name="f_goods_price" value="<fmt:formatDate value='${classMessage.classend}' pattern='yyyy-MM-dd' />"/></td>
            </tr>



            <tr>
                <td>简介<span style="color:red">*</span>：</td>
                <td>
                    <textarea>${classMessage.classcontent}</textarea>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="保存">
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