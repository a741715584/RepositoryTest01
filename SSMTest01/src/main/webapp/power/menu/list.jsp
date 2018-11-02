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
        function del(menuid){
            if(confirm("确认删除？")){
                $.ajax({
                    type:"post",
                    url:"menu/delete",
                    data:"menuid="+menuid,
                    success:function (data) {
                        if(data>0){
                            alert("删除成功！！！");
                        }else{
                            alert("删除失败！！！");
                        }
                    }

                });

            }
        }
        
        
        
        function sel() {
           var sel =  $("#sel");
            var menuid = $("[name=menuid]");
            for(var i=0;i<menuid.length;i++){
                menuid[i].checked=sel[0].checked;
            }
        }

    </script>
</head>
<body>



<div class="div_head" style="width: 100%;text-align:center;">
		<span> <span style="float:left">当前位置是：权限管理-》菜单管理</span> <span
                style="float:right;margin-right: 8px;font-weight: bold">
			<a style="text-decoration: none;" href="javascript:alert('操作成功！');">【导出excel】</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a style="text-decoration: none;" href="javascript:void(0)" onclick="delMany()">【批量删除】</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a style="text-decoration: none;" href="power/menu/add.jsp">【新增菜单】</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		</span>
</div>

<div class="morebt">

</div>



<div class="cztable">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr style="height: 25px" align="center">
            <th><input type="checkbox" id="sel" onclick="sel()" /></th>
            <th scope="col">
                序号
            </th>

            <th scope="col">
                菜单名称
            </th>
            <th scope="col">
                URL
            </th>
            <th scope="col">
                状态
            </th>
            <th scope="col">
                操作
            </th>
        </tr>


        <form action="menu/deleteMany" method="post">
        <c:forEach items="${pi.list}" var="m" varStatus="ms">

                <tr align="center">
                    <th><input type="checkbox" name="menuid" value="${m.menuid}"/></th>
                    <td>
                       ${ms.index+1}
                    </td>
                    <td>
                        ${m.menuname}
                    </td>
                    <td>
                       ${m.menupath}
                    </td>

                    <td>&nbsp;
                        <c:if test="${m.menustate==1}">启用</c:if>
                        <c:if test="${m.menustate==0}">未启用</c:if>
                    </td>

                    <td>&nbsp;
                        <a href="menu/getOne?menuid=${m.menuid}">详情</a>
                        <a href="menu/prepareToUpdate?menuid=${m.menuid}">修改</a>
                        <a href="javascript:void(0)" onclick="del('${m.menuid}');return false" class="tablelink"> 删除</a>
                    </td>
                </tr>
        </c:forEach>
        </form>
        </tbody>
    </table>

    <div class='MainStyle'>
            <mytag:fy url="menu/list" pageInfo="${pi}"></mytag:fy>
     </div>
</div>
        
</div>
<script type="text/javascript">
    function delMany() {
        var ckc = $("[name=menuid]");
        var k = -1;
        for(var i = 0;i<ckc.length;i++){
            if(ckc[i].checked==true){
                k=2;
                document.forms[0].submit();
                break;
            }
        }
        if(k==-1){
            alert("请选择导出的班级");
        }
    }
</script>


</body>
</html>