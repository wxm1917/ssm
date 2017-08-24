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
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<script>
			function reinitIframe(){
			    var iframe = document.getElementById("iframeBody");
			    try{
				    var bHeight = iframe.contentWindow.document.body.scrollHeight;
				    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				    var height = Math.max(bHeight, dHeight);
				    var realHeight = height > 563 ? height : 563;
				    iframe.height =  563;//realHeight;
			    }catch (ex){}
		    }
		    window.setInterval("reinitIframe()", 1);
		
			function exitLogin(){
				window.location.href="login.html";
			}
			function updtpd(){
				window.location.href="updtpd.html";
			}
				
			$(function(){
				$("#nav li").click(function(){
					var href = $(this).find("a").attr("href");
					$(this).addClass("cur").siblings().removeClass("cur");
					$("#iframeBody").attr("src",href);
					return false;
				});
				$("#iframeBody").attr("src",$("#maina").attr("href"));//为div添加url
			})//html加载完就执行
		</script>
    </head>
   <!--  <body tyle="background:url('image/1.jpg') no-repeat;"> -->
   <body>
		<!-- 页头 -->
		<div class="header main">
			<img alt="cm" src="resources/image/header.png" align="left">
			<div class="user-box">
				当前用户： <b>${user.username}</b>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn-blue24" onclick="exitLogin()"><span class="glyphicon glyphicon-share"></span> 注销</button>
				&nbsp;
				<button type="button" class="btn-blue24" onclick="updtpd()"><span class="glyphicon glyphicon-edit"></span> 修改密码</button>
			</div>
		</div>
		<!-- 页头,end -->

		<!-- 导航 -->
		<div class="navgation main">
			<ul id="nav">
				<c:forEach items="${menuList}" var="m" varStatus="status">
					<c:choose>
					   <c:when test="${m.menuName=='受众规划'}">
					   
					   <li class="cur"><a href="new_manage.html?menuId=40" id="maina" target="cont"><span class="glyphicon glyphicon-stats"></span>${m.menuName}</a></li>  
					   </c:when>
					   <c:otherwise>
					   <li><a href="manage.html?menuId=${m.id}" target="cont"><span class="glyphicon glyphicon-stats"></span>${m.menuName}</a></li>
					   </c:otherwise>
					</c:choose>
				
				</c:forEach>
			</ul>
		</div>
		<!-- 导航,end -->

		<!-- 正文 -->
	<div class="main">
			<iframe id="iframeBody"  onload="reinitIframe();" 
			height="563" name="cont" src=""  width="100%" marginwidth="0px" 
			marginheight="0px" scrolling="no" frameborder="0"></iframe>
		</div> 	
		
		<!-- 正文,end -->
	</body>
</html>
