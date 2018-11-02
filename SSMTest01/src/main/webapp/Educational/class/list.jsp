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
    <title>学生信息管理平台</title>
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
        $(function () {
            classlist("1");
        });

        function classlist(pageNum){
            $("#tbody").empty();
            var classname = $("#classname").val();
            var pageSize = $("#pageSize").val();

            $.ajax({
                type:"post",
                url:"classes/list",
                data:{"pageNum":pageNum,"pageSize":pageSize,"classname":classname},
                success:function (data) {
                    var msg = data.list;
                    var html = "<tr style=\"font-weight: bold;\">\n" +
                        "    <th  width=\"8%\">\n" +
                        "    <input id=\"ck\" type=\"checkbox\"/>\n" +
                        "    </th>\n" +
                        "    <th >院系</th>\n" +
                        "    <th width=\"\">班级编号</th>\n" +
                        "     <th width=\"\">班级名称</th>\n" +
                        "      <th width=\"15%\">班主任老师</th>\n" +
                        "      <th width=\"15%\">人数</th>\n" +
                        "     <th width=\"15%\">班级状态</th>\n" +
                        "     <th width=\"20%\">操作</th>\n" +
                        " </tr>";

                    for(var i =0;i<msg.length;i++){
                        html+="<tr id=\"product1\"> " +
                            " <td  width=\"8%\" align=\"center\">" +
                            " <input name=\"ckc\" type=\"checkbox\" value=\""+msg[i].classid+"\"/>" +
                            " </td>" +
                            "<td align=\"center\">"+msg[i].name+"</td><td align=\"center\">"+msg[i].classnum+"</td><td align=\"center\">"+msg[i].classname+"</td><td align=\"center\">"+msg[i].classteacher+"</td><td align=\"center\">"+msg[i].peoplecount+"</td><td align=\"center\">"+msg[i].classstate+"</td>";
                        html+= " <td align=\"center\">\n" +
                              " <a href=\"classes/idInfo?id="+msg[i].classid+"\">详情</a>\n";
                        if(msg[i].classstate=="未审核"||msg[i].classstate=="审核未通过"){

                            html+="  <a href=\"classes/idEdit?id="+msg[i].classid+"\">修改</a>\n" +
                                  " <a href=\"classes/update?classid="+msg[i].classid+"\">提交审核</a>\n" +
                                "  <a href=\"javascript:location.href='book/list.html'\">删除</a>\n" ;

                        } else  if(msg[i].classstate=="审核中"||msg[i].classstate=="已毕业"){


                        }
//                        else  if(msg[i].classstate=="审核未通过"){
//                            html+=" <td align=\"center\">\n" +
//                                " <a href=\"info.html\">详情</a>\n" +
//                                "  <a href=\"javascript:location.href='book/list.html'\">修改</a>\n" +
//                                " <a href=\"info.html\">提交审核</a>\n" +
//                                "  <a href=\"javascript:location.href='book/list.html'\">删除</a>\n" +
//                                "  </td>";
//                        }classes/id
                        else  {
                            html+= " <a href=\"info.html\">发书</a>\n" ;
                        }
                        html+=" </td>";
//                        else{
//                            html+=" <td align=\"center\">\n" +
//                                " <a href=\"info.html\">详情</a>\n" +
//                                "  </td>";
//                        }

                    }
                    html+="<tr>\n" +
                        "  <td colspan=\"20\" style=\"text-align: center;\">\n" +
                        "  <a  onclick='classlist("+1+")' href=\"javascript:void(0)\">首页</a>" ;
                    if(data.pageNum!=1){
                       html+=  "  <a  onclick='classlist("+(parseInt(data.pageNum)-1)+")' href=\"javascript:void(0)\">上一页</a>";
                    }
                    if(data.pageNum>3){
                        html+="<span>...</span>";
                    }
                    if((parseInt(data.pageNum)+3)>data.countPage){
                        for(var i = data.pageNum;i<=data.countPage;i++){
                            html+=" <a  onclick='classlist("+i+")' href=\"javascript:void(0)\">"+i+"</a>&nbsp;&nbsp;";
                        }
                    }else{
                        for(var i = data.pageNum;i<=(parseInt(data.pageNum)+3);i++){
                            html+=" <a  onclick='classlist("+i+")' href=\"javascript:void(0)\">"+i+"</a>&nbsp;&nbsp;";
                        }
                        html+= "<span>...</span>"
                    }

                    if(data.pageNum!=data.countPage){
                       html+= "  <a  onclick='classlist("+(parseInt(data.pageNum)+1)+")' href=\"javascript:void(0)\">下一页</a>"
                    }

                     html+="  <a  onclick='classlist("+data.countPage+")' href=\"javascript:void(0)\">尾页</a>" ;
                     html+="<span>共"+data.countPage+"页</span>";
                     html+=  "     </td>\n" +
                        "  </tr>";
                    $("#tbody").append(html);


                    $("#ck").click(function(){
                        //alert($(this)[0].checked);
                        var singles=$("[name=ckc]");
                        for(var i=0;i<singles.length;i++){
                            singles[i].checked=$(this)[0].checked;
                        }
                    });
                }
            });
        }



        function del(){
            confirm("确认删除？");
        }


    </script>



</head>
<body>

<div class="div_head" style="width: 100%;text-align:center;">
		<span> <span style="float:left">当前位置是：教务中心-》班级管理</span> <span
                style="float: right; margin-right: 8px; font-weight: lighter">
            <a onclick="daochu()" style="color:blue;cursor: pointer" >【导出excel】&nbsp;&nbsp;</a>
            <a style="text-decoration: blink" href="department/all">【新增班级】&emsp;&emsp;&emsp;&emsp;</a>
		</span>
		</span>
</div>

<div class="cztable">
    <div>
        <ul class="seachform1">
            <form action="javascript:void(0)" method="post">
                <li>
                    <label>班级名称:</label>
                        <input name="name" id="classname" type="text" class="scinput1" />

                        <input  type="submit" onclick="classlist('1')" class="scbtn" value="查询"/>&nbsp;
                </li>

            </form>
            每页显示
            <select name="num" id="pageSize" onchange="classlist(1)">
                 <option value=4 >4</option>
                 <option value=8 >8</option>
                 <option value=12>12</option>
           </select>
            <form action="classes/daochu" method="post" id="daochu">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tbody id="tbody">

                </tbody>
            </table>
            </form>
        </ul>
    </div>

</div>
</div>

</div>

<script type="text/javascript">
    function daochu() {
        var ckc = $("[name=ckc]");
            var k = -1;
        for(var i = 0;i<ckc.length;i++){
            if(ckc[i].checked==true){
                k=2;
                document.forms[1].submit();
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
