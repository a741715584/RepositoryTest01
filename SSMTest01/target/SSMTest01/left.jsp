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
    <meta http-equiv=content-type content="text/html; charset=utf-8" />
    <link href="css/admin.css" type="text/css" rel="stylesheet" />
    <script language=javascript>
        function expand(el)
        {
            childobj = document.getElementById("child" + el);

            if (childobj.style.display == 'none')
            {
                childobj.style.display = 'block';
            }
            else
            {
                childobj.style.display = 'none';
            }
            return;
        }
    </script>
</head>
<body background=img/menu_bg.jpg >
<table height="100%" cellspacing=0 cellpadding=0 width=170   background=./img/menu_bg.jpg border=0>
    <tr>
        <td valign=top align=middle>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
                <tr>
                    <td height=10></td>
                </tr>
            </table>





            <c:forEach items="${user.list}" var="menu" varStatus="m">
                <c:if test="${menu.upmenuid==-1}">

                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=./img/menu_bt.jpg>
                                <a     class=menuparent onclick=expand('${m.index}')  href="javascript:void(0);">${menu.menuname}</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                     <table id="child${m.index}" style="display: none" cellspacing=0 cellpadding=0  width=150 border=0>
                    <c:forEach items="${user.list}" var="mChild" >
                        <c:if test="${mChild.upmenuid==menu.menuid}">

                                    <tr height=20>
                                        <td align=middle width=30>
                                            <img height=9 src="./img/menu_icon.gif" width=9>
                                        </td>
                                        <td>
                                            <a class=menuchild  href="${mChild.menupath}"  target="right">${mChild.menuname}</a>
                                        </td>
                                    </tr>
                        </c:if>
                      </c:forEach>
                </c:if>


            </c:forEach>



                <tr height=4>
                    <td colspan=2></td>
                </tr>
            </table>
        </td>
        <td width=1 bgcolor=#d1e6f7></td>
    </tr>
</table>
</body>
</html>