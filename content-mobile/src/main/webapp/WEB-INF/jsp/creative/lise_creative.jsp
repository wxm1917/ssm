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
    		function startCheckAd(){
    			var ids = checkBox();
    			
    			if(ids!=null){
    				document.adForm.action="advertise/startCheckAd.html?ids="+ids;
    				document.adForm.submit();
    			}
    		}
    		function pauseCheckAd(){
    			var ids = checkBox();
    			if(ids!=null){
    				window.location.href="advertise/pauseCheckAd.html?ids="+ids;
    			}
    		}
    		function delCheckAd(){
    			var ids = checkBox();
				if(ids!=null){
					if(confirm("删除请确认")){
						window.location.href="advertise/delCheckAd.html?ids="+ids;
					}
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
    		
    		
    	</Script>
    </head>
    <body>
		

		<!-- 正文 -->
		<form name="adForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupName" id="groupName">
			<input type="hidden" value="" name="adName" id="adName">
		</form>
		
				<div class="right-title">当前位置：<span class="blue">广告管理</span> &gt; 创意</div>
				<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 创意</div>
				<div class="right-box">
					<div class="panel panel-default">

  						<!-- Table -->
  						<table class="table list_table">
  							<tr class="table-head">
  								<td width="150">创意名称</td>
  								<td width="50">创意</td>
  								<td width="50">状态</td>
  								<td width="50">类型</td>
  								<td width="60">尺寸</td>
  								<td width="60">目标地址</td>
  								<td width="70">操作</td>
  							</tr>
  							<c:forEach items="${ctList}" var="data">
								<tr align="center">
									<td>${data.ad_name}</td>
									<td align="center"><a class="preview" href="${data.ad_image}" target="view_window">预览</a></td>
									<td>
										<c:if test="${data.status==0}">有效</c:if>
										<c:if test="${data.status==1}">无效</c:if>
									</td>
									<td>
										<c:if test="${data.ad_type==0}">图片</c:if>
										<c:if test="${data.ad_type==1}">其他</c:if>
									</td>
									<td>${data.ad_width}*${data.ad_height}</td>
									<td><a href="${data.url}" title="${data.url}" target="view_window">跳转</a></td>
									<td width="80">
										<a href="javascript:detail(${data.id},'${data.groupName}')" class="glyphicon glyphicon-exclamation-sign gray2"></a>
										<a href="javascript:statistics(${data.id},'${data.ad_name}')" class="glyphicon glyphicon-stats gray2"></a>
									</td>
								</tr>
							</c:forEach>	
 						</table>
					</div>
				</div>
				<div class="pagebar" style="width:815px;padding:0px;margin:0px;">
					<pg:pager url="advertise/queryPage.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
			         <pg:param name="groupId" value="${ct.groupId}"/>
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
