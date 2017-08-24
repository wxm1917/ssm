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
        <title>创意信息统计</title>
		<script type="text/javascript">
		</script>
		<script src="plugin/jquery-1.11.0.min.js"></script>
		<script src="plugin/bootstrap.js"></script>
		<script src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<link rel="stylesheet" type="text/css" href="css/pager-taglib.css" />
		
    </head>
    <body>
		<!-- 正文 -->
			<div class="right-title">当前位置：<span class="blue">财务管理</span> &gt; <span class="blue">续/退费记录</span></div>
			<c:if test="${user.role==3}">
				<div class="line-title">数据概览</div>
				<div class="data-show-panel">
					<div class="data-box">
						<p class="mb10">累计续费金额</p>
						<p class="green">${allMap.addMoney}</p>
					</div>
					<div class="data-box">
						<p class="mb10">累计退费金额</p>
					    <p class="yellow">${allMap.catMoney}</p>
					</div>
					<div class="data-box">
						<p class="mb10">累计净续费金额</p>
	                       <p class="orange">${allMap.money}</p>
					</div>
					<div class="data-box">
						<p class="mb10">累计续费次数</p>
						<p class="orange">${allMap.addMoneyCount}</p>
					</div>
					<div class="data-box">
						<p class="mb10">累计退费次数</p>
						<p class="red">${allMap.catMoneyCount}</p>
					</div>
				</div> 
			</c:if>
			<div class="line-title mt10"><span class="glyphicon glyphicon-list mr10"></span> 报表显示列表</div>
			<table class="table1  ml10" cellpadding="1" cellspacing="0"  border="1" >
				<thead id="index_table">
					<tr>
						<th><span data-type="date"></span>客户 <span data-type="date"></span></th>
						<th><span data-type="date"></span> 续/退费时间 <span data-type="date"></span></th>
						<th><span data-type="xiaofei"></span> 续/退费金额 <span data-type="xiaofei"></span></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${financeList}" var="data">
						<tr>
							<td>${data.username}</td>
							<td>${data.createTime}</td>
							<td>${data.money} 元</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<div class="pagebar" style="width:815px;padding:0px;margin:0px;">
					<pg:pager url="finance/queryPage.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
			         <pg:param name="id" value="${id}"/>
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
			
<!-- 正文,end -->
	</body>
</html>
