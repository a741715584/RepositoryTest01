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
    <title>用户登录</title>
    <link href="css/login.css" type="text/css" rel="stylesheet" />
</head>
<%
    String username  = "";
    String password  = "";
    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for(int i=0;i<cookies.length;i++){
            username = "1";
            Cookie cookie = cookies[i];
            if("up".equals(cookie.getName())){
                username = "2";
                String[] split = cookie.getValue().split("_");
                username = split[0];
                password = split[1];
                break;
            }

        }
    }
%>
<body id="userlogin_body">
<%=username %>
<div id="user_login">
    <dl>
        <dd id="user_top">
            <ul>
                <li class="user_top_l"></li>
                <li class="user_top_c"></li>
                <li class="user_top_r"></li>
            </ul>
        </dd>
        <dd id="user_main">
            <form action="User_tb/login" method="post">


            <ul>
                <li class="user_main_l"></li>
                <li class="user_main_c">
                    <div class="user_main_box">
                        <ul>
                            <li class="user_main_text">用户名： </li>
                            <li class="user_main_input"><input name="TxtUserName" maxlength="20" id="TxtUserName" class="txtusernamecssclass" value="<%=username%>"  > </li>
                        </ul>
                        <ul>
                            <li class="user_main_text">密 码： </li>
                            <li class="user_main_input"><input type="password" name="TxtPassword" id="TxtPassword" class="txtpasswordcssclass" value="<%=password %>"  > </li>
                        </ul>
                        <ul>
                            <span>验证码:<input style="width: 60px;height: 20px;" type="text" name="validate"><img src="validate/img" alt="图片加载失败" onclick="change()"  id="validate" /></span>
                        </ul>
                        <ul>
                            <li class="user_main_text">Cookie： </li>
                            <li class="user_main_input"><select name="DropExpiration" id="DropExpiration">
                                <option selected="" value="1">不保存</option>
                                <option value="2">保存一天</option>
                                <option value="3">保存一月</option>
                                <option value="4">保存一年</option></select>
                            </li>
                        </ul>
                        <span style="color: red">${msg}</span>
                    </div>
                </li>
                <li class="user_main_r">
                    <a href=javascript:void(0)>
                        <img  onclick="a()" src="img/user_botton.gif"  class="ibtnentercssclass">
                    </a>
                </li>
            </ul>
            </form>
         </dd>

        <dd id="user_bottom">
            <ul>
                <li class="user_bottom_l"></li>
                <li class="user_bottom_c"></li>
                <li class="user_bottom_r"></li>
            </ul>
        </dd>
    </dl>
</div>

<script type="text/javascript">
    function change() {
        document.getElementById("validate").src="validate/img?num="+new Date();
    }
    function a(){
        document.forms[0].submit();
    }
</script>
</body>
</html>