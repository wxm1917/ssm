<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/WEB-INF/commons/include.jsp"%>

<!doctype html>

<html>
    <head>
        <base href="<%=basePath %>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CM原生广告平台</title>
        <link rel="bookmark"  type="image/x-icon"  href="resource/image/expai.ico"/> 
		<link rel="shortcut icon" href="resources/image/expai.ico">
		<link rel="icon" href="resources/image/expai.ico">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
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
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
    </head>
    <body>
		<div class="h1-bg">
			<div class="main"><img src="resources/image/logo.png" alt="CM原生广告平台">
			<!-- <h1 class="h1">CM原生广告平台</h1> -->
			</div>
		</div>

		<div class="index-bg1">
			<div class="main" style="height:100%;">
				<div class="login-form-container">
					<div class="bg-gray opacity4 login-form-bg"></div>
					<!-- 表单开始 -->
					<div id="login_form" class="login-form-box">
						<form method="post" action="login.html" onsubmit="return checkData();" id="login_form">
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
								<input type="reset" value="取消" class="btn btn-default"/>
							</div>
						</form>
					</div>
					<!-- 表单,end -->
				</div>

				<div class="contact-container">
					<div class="bg-gray opacity4 contact-bg"></div>
					<div class="contact-box">
						CM原生广告平台<br>
						电话:XXX-XXXXXXXXX<br>
						手机:XXXXXXXXXXXX<br>
						邮箱:XXXXXXX@XXX.com<br>
						官网:http://www.XXX.com
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
