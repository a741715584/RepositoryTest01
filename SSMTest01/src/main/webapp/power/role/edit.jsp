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
<script type="text/javascript">
    function checkChild(mid) {
        var head  =  $("#head"+mid)[0];
        var c =  "child"+mid;
        var children =  $("[class="+c+"]");
        for(var i=0;i<children.length;i++){
            children[i].checked = head.checked;
        }
    }
</script>
</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：教务中心-》考试-》修改</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="javascript:history.back();">【返回】</a>
                </span>
            </span>
</div>
</div>
<div class="cztable">
    <form action="role/update" method="post">
        <input type="hidden" name="roleid" value="${role.roleid}">
        <table border="1" width="100%" class="table_a">
            <tr  width="120px;">
                <td width="120px">角色名：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text"  name="rolename" value="${role.rolename}" />
                </td>
            </tr>

            <tr  width="120px;">
                <td>菜单资源<span style="color:red">*</span>：</td>
                <td>
                    <ul>
                        <c:forEach items="${menu}" var="m" varStatus="ms">
                            <c:if test="${m.upmenuid==-1}">
                                <li><input type="checkbox" name="menu" value="${m.menuid}" onclick="checkChild('${m.menuid}')" id="head${m.menuid}"
                                        <c:forEach items="${role.list}" var="one">
                                            <c:if test="${m.menuid==one.menuid}">checked</c:if>
                                        </c:forEach>

                                />${m.menuname}
                                    <ul>
                                        <c:forEach items="${menu}" var="mChild" >
                                            <c:if test="${mChild.upmenuid==m.menuid}">
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick="checkHead('${m.menuid}')" class="child${m.menuid}" name="menu" value="${mChild.menuid}"
                                                        <c:forEach items="${role.list}" var="one">
                                                            <c:if test="${mChild.menuid==one.menuid}">checked</c:if>
                                                        </c:forEach>

                                                />${mChild.menuname}</li>
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
                    <input type="radio" name="rolestate" value="1"  ${role.rolestate==1?"checked":""} />启用
                    <input type="radio" name="rolestate" value="0"  ${role.rolestate==0?"checked":""} />禁用
                </td>
            </tr>

            <tr width="120px">
                <td colspan="2" align="center">
                    <input type="submit" value="修改" />
                </td>
            </tr>
        </table>
    </form>
</div>

</div>
</div>

</div>

<script type="text/javascript">
    function checkHead(mid) {
        var head = $("#head"+mid)[0];
        var flag = -1;
        var c = "child"+mid;
        var children = $("[class="+c+"]");
        for(var i = 0;i<children.length;i++){
            if(children[i].checked==true){
                head.checked=true;
                flag=2;
                break;
            }
        }
        if(flag==-1){
            head.checked=false;
        }
    }

</script>
</body>
</html>
