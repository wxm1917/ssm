<%--
  Created by IntelliJ IDEA.
  User: dyl
  Date: 16/9/7
  Time: 下午1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/WEB-INF/commons/include.jsp"%>

<!doctype html>
<html>
<head>
    <title>自媒体图片原生广告平台</title>
    <script src="resources/plugin/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        if (top.location != self.location){
            top.location=self.location;
        }
        function checkData(){
            var userName = $("#username").val();
            var password = $("#password").val();
            if(userName==""){
                $("#checkData").html("用户名不能为空");
                return false;
            }else{
                if(password==""){
                    $("#checkData").html("密码不能为空");
                    return false;
                }
            }
            return true;
        }
    </script>
    <script src="resources/plugin/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
    <style>
        html{width:100%;
            height:100%}
        body{width:100%;
            height:100%;
            background-size:cover;     /*这里设置了背景图片为覆盖，以填满整个容器*/
        }
        .mt10{
            margin-top: 10px;
        }
        .mt20{
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div style="height: 100%">

        <div class="index-bg1" style="margin:15% auto;border: #b4b4b4 solid 1px;max-width:250px; text-align: center;padding:10px;">
            <h4>自媒体图片原生广告平台</h4>
            <form method="post" action="native.html" onsubmit="return checkData();" id="login_form">
                <span id="checkData" style="color:red">&nbsp;${msg}</span>
                <div class="input-group mt10">
                    <span class="input-group-addon" style="width:68px;">用户名</span>
                    <input type="text" name="username" id="username" class="form-control">
                </div>
                <div class="input-group mt10">
                    <span class="input-group-addon" style="width:68px;">密码</span>
                    <input type="password" name="password" id="password" class="form-control">
                </div>
                <div class="tc mt20">
                    <input type="submit" class="btn btn-primary" value="登录"/>&nbsp;&nbsp;
                    <input type="reset" value="重置" class="btn btn-default"/>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
