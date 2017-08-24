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
        <title>登录</title>
		<script type="text/javascript">
		</script>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
    	<script type="text/javascript">
    		function reinitIframe1(){
			    var iframe = document.getElementById("mainFrame");
			    try{
				    var bHeight = iframe.contentWindow.document.body.scrollHeight;
				    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				    var height = Math.max(bHeight, dHeight);
				    iframe.height =  height;
			    }catch (ex){}
			    var realHeight = height > 500 ? height : 500;
			    if ($("#iframeBody", window.parent.document).is("iframe")) {
			        $("#iframeBody", window.parent.document).height(realHeight);
			    }
		    }
		    window.setInterval("reinitIframe1()", 1);
    	
    		$(function(){
    			$(".left-line").eq(0).addClass("left-cur");
				$(".left-line").click(function(){
					var href = $(this).attr("href");
					$(this).addClass("left-cur").siblings().removeClass("left-cur");
					$("#mainFrame").attr("src",href);
					return false;
				});
				$("#mainFrame").attr("src",$(".left-line").eq(0).attr("href")); 
			})
    	</script>
    </head>
    <body >
		
		<!-- 正文 -->
		<form name="groupForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupName" id="groupName">
		</form>
		<div id="contents">
			<div class="main-left bg-gray" >
				<div class="left-box">
				<c:forEach items="${menuList}" var="m">
					<a class="left-line" href="${m.menuUrl}" target="cont-right">${m.menuName} <span class="glyphicon glyphicon-chevron-right r"></span></a>
				</c:forEach>
				</div>
			</div>
			<!-- 广告管理右侧内容,start -->
			<div class="main-right">
				<iframe id="mainFrame" onload="this.height=100" name="cont-right" src="advertiseGroup/list.html" width="100%" marginwidth="0px" marginheight="0px" scrolling="no" frameborder="0"></iframe>
			</div>
			<!-- 广告管理右侧内容,end -->
			
		</div>
		<!-- 正文,end -->
	</body>
</html>
