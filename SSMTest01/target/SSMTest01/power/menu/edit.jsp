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
        $(function () {
            var um = $("#um").val();
            var upmenuid = $("#upmenuid")[0];
            $.ajax({
                type:"post",
                url:"menu/ml",
                success:function (data) {
                    for(var i=0;i<data.length;i++){
                        var option = null;
                        if(um==-1){
                            option = new Option("已为最高级别菜单",-1);
                            upmenuid.add(option);
                            break;
                        }else{
//                            alert(data[i].menuname);
                            option =  new Option(data[i].menuname,data[i].menuid);
                            if(um==data[i].menuid){
                                option.selected = true;
                            }
                        }
                        upmenuid.add(option);
                    }
                }
            })

        })

    </script>

</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：教务中心-》考试-》新增</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="javascript:history.back();">【返回】</a>
                </span>
            </span>
</div>
</div>
<div class="cztable">
    <input type="hidden" value="${menu.upmenuid}"  id="um">
    <form action="menu/update" method="post">
        <input type="hidden" name="menuid" value="${menu.menuid}">
        <table border="1" width="100%" class="table_a">
            <tr  width="120px;">
                <td width="120px">资源菜单名：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text"  name="menuname" value="${menu.menuname}" />
                </td>
            </tr>

            <tr  width="120px;">
                <td>上级菜单：<span style="color:red">*</span>：</td>
                <td>
                    <select name="upmenuid" id="upmenuid">


                    </select>
                </td>
            </tr>

            <tr  width="120px;">
                <td>菜单路径<span style="color:red">*</span>：</td>
                <td>
                    <input type="text"  name="menupath" value="${menu.menupath}" />
                </td>
            </tr>

            <tr>
                <td>启用状态<span style="color:red">*</span>：</td>
                <td>

                    <input type="radio" name="menustate" <c:if test="${menu.menustate==1}">checked</c:if>  value="1" />启用
                    <input type="radio" name="menustate"  <c:if test="${menu.menustate==0}">checked</c:if> value="0"/>禁用
                </td>
            </tr>


            <tr  width="120px;">
                <td>备注<span style="color:red">*</span>：</td>
                <td>
                    <textarea rows="5" cols="20" name="menuremark">${menu.menuremark}</textarea>
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
</body>
</html>
