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
				<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
		<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
		<link href="js/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css"  media="screen"></link>
		<script src="plugin/jquery-1.11.0.min.js"></script>
		<script src="plugin/bootstrap.js"></script>
		<script src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<link rel="stylesheet" type="text/css" href="css/pager-taglib.css" />
    	<Script>
    		function startCheckAd(type){
    			var ids = checkBox();
    			if(ids!=null){
    				document.adForm.action="user/updateUser.html?ids="+ids+"&available="+type;
    				document.adForm.submit();
    			}
    		}
    		function checkBox(){
    			var ids = null;
    			var inputs = document.getElementsByTagName("input");
				for(var i=0; i< inputs.length; i++){
					if(inputs[i].type == "checkbox"&&inputs[i].id!="check_all"){
						if(inputs[i].checked==true){
							if(ids==null){
								ids = inputs[i].value;
							}else{
								ids = ids+","+inputs[i].value;
							}
						}
					}
				}
				return ids;
    		}
    		function detail(id,groupName){
    			$("#id").val(id);
    			$("#groupName").val(groupName);
    			document.adForm.action="advertise/detail.html";
    			document.adForm.submit();
    		}
       		//统计
    		function statistics(id,adName){
    			$("#id").val(id);
    			$("#adName").val(adName);
    			document.adForm.action="advertise/statistics.html";
    			document.adForm.submit();
    		}
    		function chongzhi(id){
    			$("#id").val(id);
    			$("#adName").val(adName);
    			document.adForm.action="user/show.html?type=recharge_client_user";
    			document.adForm.submit();
    		}
    		function view(id){
    			$("#id").val(id);
    			$("#adName").val(adName);
    			document.adForm.action="user/show.html?type=view_client_user";
    			document.adForm.submit();
    		}
    		function adgroup(id){
    			$("#id").val(id);
    			document.adForm.action="advertiseGroup/list.html";
    			document.adForm.submit();
    		}
    		
    	</Script>
    </head>
    <body>
		

		<!-- 正文 -->
		<form name="adForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupName" id="groupName">
			<input type="hidden" value="" name="adName" id="adName">
		</form>
		
				<div class="right-title">当前位置：<span class="blue">客户管理</span></div>
				<div class="right-box">
					<div class="panel panel-default">
  						<div class="panel-heading">
    						<p>
    						<a href="javascript:startCheckAd('1')" class="btn-blue24">启用</a>
    						<a href="javascript:startCheckAd('0')" class="btn-blue24">暂停</a>
							</p>
  						</div>
						<table class="table list_table">
  							<tr class="table-head">
								<tr>
								    <th><input type="checkbox" name="" id="check_all" width="20"></th>
									<th><span data-type="date"></span> 客户名称 <span data-type="date"></span></th>
									<c:if test="${user.role==3}">
										<th><span data-type="zhanshi"></span>广告组数量 <span data-type="zhanshi"></span></th>
										<th><span data-type="xiaofei"></span> 创意数量 <span data-type="xiaofei"></span></th>
									</c:if>
									<th><span data-type="zhanshi"></span>客户类型<span data-type="zhanshi"></span></th>
									<th><span data-type="zhanshi"></span>审核状态<span data-type="zhanshi"></span></th>
									<th><span data-type="zhanshi"></span>账户余额 <span data-type="zhanshi"></span></th>
									<th><span data-type="xiaofei"></span> 账户消费金额 <span data-type="xiaofei"></span></th>
									<th><span data-type="zhanshi"></span>返点余额 <span data-type="zhanshi"></span></th>
									<th><span data-type="xiaofei"></span> 返点消费金额 <span data-type="xiaofei"></span></th>
									<th><span data-type="xiaofei"></span> 状态 <span data-type="xiaofei"></span></th>
									<th><span data-type="dianji"></span>充值 <span data-type="dianji"></span></th>
									<th><span data-type="dianjilv"></span>操作<span data-type="dianjilv"></span></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="data">
									<tr>
										<td><input type="checkbox" onclick="clickBox(this)" value="${data.id}"></td>
										<td>${data.username}</td>
										<c:if test="${user.role==3}">
											<td>${data.gr_count}</td>
											<td>${data.ct_count}</td>
										</c:if>
										<td>
											<c:if test="${data.role==3}">代理商</c:if>
											<c:if test="${data.role==4}">广告主</c:if>
										</td>
										<td>
											<c:if test="${data.state==1}">待审核</c:if>
											<c:if test="${data.state==2}">通过</c:if>
											<c:if test="${data.state==3}">驳回</c:if>
										</td>
										<td>${data.residual_money}</td>
										<td>${data.consume_money}</td>
										<td>${data.residual_rresent_money}</td>
										<td>${data.consume_rresent_money}</td>
										<td>
										<c:if test="${data.available==1}">启用</c:if>
										<c:if test="${data.available==0}">暂停</c:if>
										</td>
										<td><a href="javascript:chongzhi(${data.id})">充值</a></td>
										<c:choose>
											<c:when test="${user.role==3}">
												<td><a href="javascript:adgroup(${data.id})">查看</a></td>
											</c:when>
											<c:otherwise>
												<td><a href="javascript:view(${data.id})">查看</a></td>
											</c:otherwise>
										</c:choose>
										
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pagebar" style="width:815px;padding:0px;margin:0px;">
					<pg:pager url="user/queryPageUserForAd.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
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
