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
        <title>ebs</title>
		<script type="text/javascript" src="resources/js/fancybox/jquery.fancybox.js"></script>
		<script type="text/javascript" src="resources/js/fancybox/jquery.fancybox.pack.js"></script>
		<link href="resources/js/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css"  media="screen"></link>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/pager-taglib.css" />
    </head>
    <body>
		

		<!-- 正文 -->
		<form name="adForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupId" id="groupId">
			<input type="hidden" value="" name="groupName" id="groupName">
			<input type="hidden" value="" name="adName" id="hidden_adName">
		</form>
				<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 广告列表</div>
				<div class="right-box">
					<div class="panel panel-default">
  						<table class="table list_table">
  							<tr class="table-head">
  								<td >图片编号</td>
  								<td>消费</td>
  								<td>拍摄数量</td>
  								<td>拍摄费用/次</td>
  								<td>每日明细</td>
  							</tr>
  					<c:choose>
						<c:when test="${empty ebsImgList}">
								</table>
		 					</div>
						</div>
							<p style="text-align:center;font-size:20px;">没有查询到数据</p>
						</c:when>
						<c:otherwise>
  							<c:forEach items="${ebsImgList}" var="data">
								<tr align="center">
									<td>${data.imgId}</td>
									<td>${data.totleConsume}</td>
									<td>${data.shootNum}</td>
									<td>${data.shootCharges}</td>
									<td width="80">
										<a href="ebs/queryPage.html?imgId=${data.imgId}">查看</a>
									</td>
								</tr>
							</c:forEach>	
 						</table>
		 					</div>
						</div>
					<!-- 分页开始 -->
					<div class="pagebar" style="width:815px;padding:0px;margin:0px;">
						<pg:pager url="ebs/queryGroupPage.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
						  <pg:first><a href="${pageUrl}">首页</a> </pg:first>   
						  <pg:prev> <a href="${pageUrl }">上一页</a> </pg:prev>   
						  <pg:pages>   
						    <c:choose>   
						      <c:when test="${currentPageNumber eq pageNumber}">   
						        <a href="${pageUrl }" class="page-cur">${pageNumber }</a>   
						      </c:when>  
						      <c:otherwise>   
						        <a href="${pageUrl }">${pageNumber }</a>   
						      </c:otherwise>   
						    </c:choose>
						  </pg:pages> 
						  <pg:next> <a href="${pageUrl }">下一页</a></pg:next>
						  <pg:last>  <a href="${pageUrl }">尾页</a></pg:last>
						</pg:pager>  
					</div>
					<!-- 分页end -->
		    </c:otherwise>
		</c:choose>
	</body>
</html>
