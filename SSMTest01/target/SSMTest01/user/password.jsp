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
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $().ready(function() {
            $("#myform").validate({
                rules: {
                    newp: {
                        required: true,
                        minlength: 6
                    },
                    renew: {
                        required: true,
                        minlength: 6,
                        equalTo: "#new"
                    }
                },
                messages: {

                    newp: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 5 个字母"
                    },
                    renew: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 5 个字母",
                        equalTo: "两次密码输入不一致"
                    }
                }
            })
        });


        function submitMail() {
            var newpass = $("#new").val();
            var renewpass = $("#renew").val();
            var userId = $("#userId").val();
            var reg = /^\w{6,}$/;
            if(newpass==renewpass||newpass==null||renewpass==null){
                if(reg.test(newpass)||reg.test(renewpass)){
                    $.ajax({
                        type:"post",
                        url:"User_tb/password",
                        data:{"userPs":newpass,"userId":userId},
                        success:function (msg) {
                            if(msg>0){
                                alert("修改成功！");
                                top.location.href = "login.jsp";
                            }else{
                                alert("修改失败！");
                            }
                        }
                    });
                }else{
                    alert("密码长度不能小于6位");
                }
            }else{
                alert("两次输入的密码不相等！！");
            }
        }
    </script>

</head>
<body>

<div class="div_head">
            <span>
                <span style="float:left">当前位置是：个人中心-》密码修改</span>
                <span style="float:right;margin-right: 8px;font-weight: bold"></span>
            </span>
</div>
</div>
<div class="cztable" id="mydiv">
    <form id="myform">
    <table width="100%" cellpadding="0" cellspacing="0">
        <input type="hidden" id="userId" value="${user.userId}">
        <tr>
            <td align="right" width="80">原密码：</td>
            <td><input type="password" name="f_goods_name" value="${user.userPs}" readonly /></td>
        </tr>
        <tr>
            <td align="right" width="90">新密码：</td>
            <td><input type="password"  id="new" name="newp" /></td>
        </tr>
        <tr>
            <td align="right" width="90">密码确认：</td>
            <td><input type="password"  id="renew" name="renew" /></td>
        </tr>
        <tr align="center">
            <td colspan="5" height="40">
                <div align="center">
                    <input type="button" id="button2" value="确认" onclick="submitMail()"/>
                </div>
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
