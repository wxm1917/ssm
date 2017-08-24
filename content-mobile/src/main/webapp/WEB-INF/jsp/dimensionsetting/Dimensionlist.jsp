<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <base href="<%=basePath %>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit" />
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
		<script type="text/javascript">
		$(function(){
			$("#dcshow").click( function (){
				$("#divshow").attr("style","display:'';;clear:both");
			});
			$("#sub").click(function(){
				var fdate = $("#fdate").val();
				var sdate = $("#sdate").val();
				window.location.href="/advertiseData/download.html?fdate="+fdate+"&sdate="+sdate; 
			/* 	$.ajax({
					type:"post",
					url:"advertiseData/download.html",
					data:{ fdate : fdate,
						sdate:sdate
						},
					success:function(data){
						 if(data =="ok"){
							window.location.href="/advertiseData/download.html"; 
						}	
					}
				}); */
			});
			
		});
		
		
		</script>
    </head>
    <body>
		

		<!-- 正文 -->
		
			<div style="float:left"><span class="glyphicon glyphicon-list mr10"> 报表显示列表</span></div>
			<div style="float:right;width:100px"><input type="button" value="导出" id="dcshow"></div>
			<div  style="display:none;clear:both" id="divshow">选择时间：<input type="date" id="fdate">-<input type="date" id="sdate">	<input type="button" value="确认导出" id="sub"></div>
			<table class="table1  ml10" cellpadding="1" cellspacing="0"  border="1" >
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
					<c:forEach items="${pu.list}" var="data">
						<tr>
							<td>${data.ctime}</td>
<%-- 							<c:set var="cpm2" value=" ${data.cpm_charge*1000 }" scope="page"/>
							<c:set var="cpm"  value="${fn:substring(cpm2,0,fn:indexOf(cpm2, '.')+3)}" scope="page"/>
							<td> ${fn:substring(sum,0,fn:indexOf(sum, '.')+3)}</td>	 --%>
							<c:set var ="sum" value="${data.cpm_charge*data.adv*0.001}" scope="page" />
							<td>${fn:substring(sum,0,fn:indexOf(sum, '.')+3)}</td>
							<td>${data.adv}</td>
							<td>${data.ck}</td>
							<td>${data.ckrate}%</td>
							<td>${data.cpm_charge}</td>
							<%-- <td>${fn:substring(data.cpc_charge,0,4)}</td> --%>
							<td>${data.cpc_charge}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<br/>
			 <div class="pagebar">
						     <jsp:include page="/WEB-INF/jsp/util/pageUtil.jsp">
								<jsp:param name="urlStr" value="advertiseData/ShowAdverDate.html"/>
							 </jsp:include>
						 </div>
	</body>
</html>
