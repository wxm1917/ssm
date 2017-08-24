<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <head>
     	<base href="<%=basePath %>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>无标题文档</title>
	</head>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-500)/2});
	$(window).resize(function(){  
		$('.error').css({'position':'absolute','left':($(window).width()-500)/2});
    })  
});  
</script> 
<style type="text/css">
/*error*/
.error{background:url(image/error.png) no-repeat; width:500px; margin-top:175px;padding-top:65px;}
.error h2{font-size:22px; padding-left:154px;}
.reindex{padding-left:154px;}
.reindex a{text-decoration:none; width:115px; height:35px; font-size:14px; font-weight:bold; color:#fff; background:#3c95c8; display:block; line-height:35px; text-align:center;border-radius: 3px;margin-top:20px;}
</style>
<body style="background:#edf6fa;">
    <div class="error">
		<h2>非常遗憾，您访问的页面不存在！</h2>
		<div class="reindex"><a href="javascript:history.go(-1);">返回上页</a></div>
    </div>
</body>
</html>
