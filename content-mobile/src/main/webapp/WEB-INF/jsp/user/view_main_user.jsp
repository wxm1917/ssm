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
        <title>登录</title>
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
		<div class="main">
			<div class="main-left">
				<p class="ml5"><span class="glyphicon glyphicon-user gray"></span> 账户概览</p>
				<div class="account-money">账户余额：<span class="blue">￥${user.residualMoney}</span></div>
				<div class="account-money">账户消费金额：<span class="blue">￥${user.consumeMoney}</span></div>
				<div class="account-money">返点余额：<span class="blue">￥${user.residualRresentMoney}</span></div>
				<div class="account-money">返点消费金额：<span class="blue">￥${user.consumeRresentMoney}</span></div>
			</div>
			<div class="main-right">
				<div class="line-title mt10"><span class="glyphicon glyphicon-list mr10"></span> 广告客户列表</div>
				<table class="table1  ml10" cellpadding="1" cellspacing="0"  border="1" >
					<thead id="index_table">
						<tr>
							<th><span data-type="date"></span> 客户名称 <span data-type="date"></span></th>
							<th><span data-type="zhanshi"></span>账户余额 <span data-type="zhanshi"></span></th>
							<th><span data-type="xiaofei"></span> 账户消费金额 <span data-type="xiaofei"></span></th>
<!-- 							<th><span data-type="zhanshi"></span>返点余额 <span data-type="zhanshi"></span></th>
							<th><span data-type="xiaofei"></span> 返点消费金额 <span data-type="xiaofei"></span></th> -->
							<th><span data-type="dianji"></span>账户使用天数 <span data-type="dianji"></span></th>
							<th><span data-type="dianjilv"></span>日均消费<span data-type="dianjilv"></span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="data">
							<tr>
								<td>${data.username}</td>
								<td>${data.residualMoney}</td>
								<td>${data.consumeMoney}</td>
<%-- 								<td>${data.residualRresentMoney}</td>
								<td>${data.consumeRresentMoney}</td> --%>
								<td>${data.dateTotle}</td>
								<td>${data.averageConsume}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br/>
				<div class="pagebar" style="width:815px;padding:0px;margin:0px;">
					<pg:pager url="user/queryPage.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
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
			</div>
		</div>
<!-- 正文,end -->
	</body>
</html>
