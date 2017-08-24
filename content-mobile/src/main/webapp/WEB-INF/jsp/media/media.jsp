<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
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
    <title媒体管理</title>
    <script type="text/javascript" src="resources/js/fancybox/jquery.fancybox.js"></script>
    <script type="text/javascript" src="resources/js/fancybox/jquery.fancybox.pack.js"></script>
    <link href="resources/js/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css"  media="screen"></link>
    <script src="resources/plugin/jquery-1.11.0.min.js"></script>
    <script src="resources/plugin/bootstrap.js"></script>
    <script src="resources/js/common.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/css.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/pager-taglib.css" />
    <Script>

    </Script>
</head>
<body>
	<!-- 正文开始-->	
		<div class="main-right">
			<!-- 正文 -->
			<form name="groupForm" action="" method="post">
				<input type="hidden" value="" name="id" id="id">
				<input type="hidden" value="" name="groupId" id="groupId">
				<input type="hidden" value="" name="groupName" id="groupName"></form>
<!-- 			<div class="right-title">
				当前位置：
				<span class="blue">媒体管理</span>
				&gt; 媒体库
			</div> -->
			<div class="line-title">
				<span class="glyphicon glyphicon-list-alt"></span>
				媒体库
			</div>
			<div class="right-box">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<c:if test="${user.role==4}">
						<div class="panel-heading" style="background:#FFF;">
							<a href="media/toaddmedia.html" class="btn-blue24">
								<span class="glyphicon glyphicon-plus-sign"></span>
								新建媒体
							</a>
						</div>
					</c:if>
					<!-- Table -->
				<table class="table list_table" style="width:100%">
					<tr class="table-head" style="border-top:1px solid #d0d0d0;border-bottom-width:0px">
						<td>媒体名称</td>
						<td>添加日期</td>
					</tr>
					<c:forEach items="${list }" var="list">
					<tr class="table-head" style="border-top:1px solid #d0d0d0;border-bottom-width:0px">
						<td>${list.medianame }</td>
						<td>${list.ctime}</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				<div class="pagebar">
					<jsp:include page="/WEB-INF/jsp/util/pageUtil.jsp">
						<jsp:param name="urlStr" value="advertiseGroup/list.html"/>
						<jsp:param name="id" value="${data.id}"/>
					</jsp:include>
				</div>
				
		</div>
<!-- 正文,end -->
</div>
</div>
<!-- 正文结束-->
</body>
</html>