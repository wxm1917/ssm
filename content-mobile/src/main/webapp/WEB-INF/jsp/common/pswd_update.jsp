<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<!doctype html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <base href="<%=basePath %>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CM原生广告平台</title>
        <link rel="bookmark"  type="image/x-icon"  href="resources/image/expai.ico"/>
		<link rel="shortcut icon" href="resources/image/expai.ico"> 
		<link rel="icon" href="resources/image/expai.ico">
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		
		
		<script src="resources/js/validate/jquery-1.11.1.js" type="text/javascript"></script>
		<script src="resources/js/validate/jquery.validate.js" type="text/javascript"></script>
		<script src="resources/js/validate/additional-methods.js" type="text/javascript"></script>
		<script src="resources/js/validate/messages_zh.js" type="text/javascript"></script>
		<script src="resources/js/validate/jquery.metadata.js" type="text/javascript"></script>
		
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<script>
			$().ready(function() {
				$("#submitFrom").validate();
				if('${msg}'!=null&&'${msg}'!=''){
					alert('${msg}');
				}
			});
			function exitLogin(){
				window.location.href="login.html";
			}
			function updtpd(){
				window.location.href="updtpd.html";
			}
			function submitBT(){
				$("#submitFrom").submit();
			}
		</script>
	<style>
	#submitFrom label.error{
		margin-left: 10px;
		width: auto;
		display: inline;
	}
	</style>
    </head>
    <body>
		<!-- 页头 -->
		<div class="header main">
		<img alt="cm" src="resources/image/header.png" align="left">
			<div class="user-box">
				当前用户： <b>${user.username}</b>
				&nbsp;&nbsp;&nbsp;
				<!-- <span class="glyphicon glyphicon-log-out darkgreen pd5" onclick="history.back()" title="注销当前用户"></span> -->
				<button type="button" class="btn-blue24" onclick="exitLogin()"><span class="glyphicon glyphicon-share"></span> 注销</button>
				&nbsp;
				<button type="button" class="btn-blue24" onclick="updtpd()"><span class="glyphicon glyphicon-edit"></span> 修改密码</button>
			</div>
		</div>
		<!-- 页头,end -->

		<!-- 正文 -->
		<div class="main updatePwd">
			<p class="updatePwd-t">当前位置：<span>修改密码</span></p>
			<div class="updatePwd-c">
				<form action="updtpd.html" id="submitFrom" method="post">
					<ul>
						<li>
							<label>当前密码：</label>
							<input type="password" name="oldPassword"  maxlength="9"  minlength="6"  class="required digits"/>
						</li>
						<li>
							<label>新密码：</label>
							<input type="password" id="newPassword" name="newPassword" maxlength="9" minlength="6" class="required digits"/>
						</li>
						<li>
							<label>确认密码：</label>
							<input type="password" name="newPassword2" class="required digits" maxlength="9" minlength="6" equalTo="#newPassword"/>
						</li>
						<li>
							<label>&nbsp;</label>
							<button type="button" class="btn-blue2" onclick="submitBT()">完成</button>
							&nbsp;&nbsp;
							<button type="button" class="btn-gray2" onclick="history.back();">返回</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<!-- 正文,end -->
	</body>
</html>
