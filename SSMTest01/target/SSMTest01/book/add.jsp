<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        $.ajax({
            type:"post",
            url:"infotype/list",
            success:function(data){
                var type= $("#type")[0];
                for(var i=0;i<data.length;i++){
                    type.add(new Option(data[i].infotype,data[i].infoid));
                }
            }
        })
    });

</script>


</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：书籍管理-》资料上传</span>
                <span style="float:right;margin-right: 8px;font-weight: bold"></span>
            </span>
</div>
</div>
<div class="cztable">
    <form action="information/upload" method="post" enctype="multipart/form-data">
        <table border="1" width="100%" class="table_a">
            <tr>
                <td width="120px;">编号：<span style="color:red">*</span>：</td>
                <td><input type="text" name="informationid"  /></td>
            </tr>
            <tr>
                <td>资料名称 ：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text" name="informationname"/>
                </td>
            </tr>

            <tr>
                <td>资料类型 ：<span style="color:red">*</span>：</td>
                <td>
                    <select id="type" name="typeid">
                       
                    </select>
                </td>
            </tr>
            <tr>
                <td>更新时间：<span style="color:red">*</span>：</td>
                <td>
                    <input type="date" name="date"  /></td>
            </tr>


            <tr>
                <td>上传人：<span style="color:red">*</span>：</td>
                <td>
                    <input type="text" name="uploader"  /></td>
            </tr>
            <tr>
                <td>上传：<span style="color:red">*</span>：</td>
                <td>
                    <input type="file" name="file"/>
                </td>
            </tr>


            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交"> <input type="submit" value="返回" onclick="history.back();">
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
