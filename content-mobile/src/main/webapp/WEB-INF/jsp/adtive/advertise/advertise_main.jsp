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
        <title>创意信息统计</title>
		<script type="text/javascript">
		</script>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/pager-taglib.css" />
		
    </head>
    <body>
		<!-- 正文 -->
			<div class="line-title">
					<span class="glyphicon glyphicon-list-alt"></span> 当前创意:${adName}
					<a href="advertise/list.html" class="r">返回</a>
			</div>
			<div class="line-title">数据概览</div>
			<div class="data-show-panel">
				<div class="data-box">
					<p class="mb10">展示次数</p>
					<p class="green">${allctMap.adv}</p>
				</div>
				<div class="data-box">
					<p class="mb10">点击次数</p>
				    <p class="yellow">${allctMap.ck}</p>
				</div>
				<div class="data-box">
					<p class="mb10">点击率</p>
                       <p class="orange">${allctMap.ckrate}%</p>
				</div>
				<div class="data-box">
					<p class="mb10">点击费用/次</p>
					<p class="orange">${allctMap.onceCkMoney}</p>
				</div>
				<div class="data-box">
					<p class="mb10">千次展示费用</p>
					<p class="red">${allctMap.tausendmalMoney}</p>
				</div>
				<div class="data-box">
					<p class="mb10">费用</p>
					<p class="red">${allctMap.charge}</p>
				</div>
			</div> 
			<div class="line-title mt10"><span class="glyphicon glyphicon-list mr10"></span> 报表显示列表</div>
			<table class="table1  ml10" cellpadding="1" cellspacing="0"  border="1" >
				<caption>
				</caption>
				<thead id="index_table">
					<tr>
						<th><span data-type="date"></span> 日期 <span data-type="date"></span></th>
						<th><span data-type="xiaofei"></span> 消费 <span data-type="xiaofei"></span></th>
						<th><span data-type="zhanshi"></span>展示 <span data-type="zhanshi"></span></th>
						<th><span data-type="dianji"></span>点击 <span data-type="dianji"></span></th>
						<th><span data-type="dianjilv"></span>点击率 <span data-type="dianjilv"></span></th>
						<th><span data-type="zhanshifeiyong"></span>展示费用/千次 <span data-type="zhanshifeiyong"></span></th>
						<th><span data-type="dianjifeiyong"></span>点击费用/次 <span data-type="dianjifeiyong"></span></th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td>${data.ctime}</td>
					<td>${data.charge}</td>
					<td>${data.adv}</td>
					<td>${data.ck}</td>
					<td>${data.ckrate}%</td>
					<td>${data.tausendmalMoney}</td>
					<td>${data.onceCkMoney}</td>
				</tr>
					<c:forEach items="${ctList}" var="data">
						<tr>
							<td>${data.ctime}</td>
							<td>${data.charge}</td>
							<td>${data.adv}</td>
							<td>${data.ck}</td>
							<td>${data.ckrate}%</td>
							<td>${data.tausendmalMoney}</td>
							<td>${data.onceCkMoney}</td>
						</tr>
					</c:forEach>
				</tbody>
				<!-- <tfoot>
					<tr>
						<td>汇总</td>
						<td>￥221.01</td>
						<td>995,484</td>
						<td>5,484</td>
						<td>0.74%</td>
						<td>￥0.22</td>
						<td>￥0.03</td>
					</tr>
				</tfoot> -->
			</table>
			<br/>
			<div class="pagebar" style="width:815px;padding:0px;margin:0px;">
					<pg:pager url="advertiseGroup/statistics.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
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
	</body>
</html>
