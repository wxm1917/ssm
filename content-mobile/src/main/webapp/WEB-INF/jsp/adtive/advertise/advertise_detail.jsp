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
        <title>创意详细</title>
		<script type="text/javascript">
		</script>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		
    </head>
    <body style="font-family:'微软雅黑';">
		<!-- 正文 -->
				<div class="line-title">
					<span class="glyphicon glyphicon-list-alt"></span> 创意详细
					<a href="advertiseGroup/list.html" class="r">返回</a>
				</div>
				<div class="right-box">
					<div class="panel panel-default">
  						<!-- Table -->
  						<table class="table list_table">
  							<tr class="table-head">
  								<td>创意名称</td>
  								<td>${advertise.adName}</td>
  							</tr>
  							<tr class="table-head">
  								<td>创意</td>
  								<td><img src="${advertise.adImage}" width="130" height="80"></td>
  							</tr>
  							<tr class="table-head">
  								<td>状态</td>
  								<td>
									<c:if test="${advertise.status==0}">有效</c:if>
									<c:if test="${advertise.status==1}">无效</c:if>
								</td>
  							</tr>
  							<tr class="table-head">
  								<td>所属组</td>
  								<td>${groupName}</td>
  							</tr>
  							<tr class="table-head">
  								<td>类型</td>
  								<td>
									<c:if test="${advertise.adType==0}">图片</c:if>
									<c:if test="${advertise.adType==1}">其他</c:if>
								</td>
  							</tr>
  							<tr class="table-head">
  								<td>尺寸</td>
  								<td>${advertise.adWidth}*${advertise.adHeight}</td>
  							</tr>
  							<tr class="table-head">
  								<td>目标地址</td>
  								<td><a href="${advertise.url}">${advertise.url}</a></td>
  							</tr>
 						</table>
					</div>
				</div>
			
		<!-- 正文,end -->
	</body>
</html>
