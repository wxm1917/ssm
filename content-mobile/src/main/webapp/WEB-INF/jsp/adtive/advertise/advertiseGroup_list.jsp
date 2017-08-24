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
        <title>广告计划</title>
		<script type="text/javascript">
		</script>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
    	
    	<script>
		var names=null;
    		function startCheck(){
    			var ids = checkBox();
    			if(ids!=null){
    				window.location.href="advertiseGroup/startCheckGroup.html?ids="+ids+"&names="+encodeURI(encodeURI(names));
    			}
    		}
    		function pauseCheck(){
    			if(confirm("此操作会暂停广告组及下面的所有创意,确认暂停吗?")){
	    			var ids = checkBox();
	    			if(ids!=null){
	    				window.location.href="advertiseGroup/pauseCheckGroup.html?ids="+ids+"&names="+encodeURI(encodeURI(names));
	    			}
    			}
    		}
    		function deleteCheck(){
    			var ids = checkBox();
				if(ids!=null){
					if(confirm("删除请确认")){
						window.location.href="advertiseGroup/delCheckGroup.html?ids="+ids;
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
								names = inputs[i].name;
							}else{
								ids = ids+","+inputs[i].value;
								names = names+","+inputs[i].name;
							}
						}
					}
				}
				return ids;
    		}
    		function update(id){
    			$("#id").val(id);
    			document.groupForm.action="advertiseGroup/edit.html";
    			document.groupForm.submit();
    		}
    		function detail(id){
    			$("#id").val(id);
    			document.groupForm.action="advertiseGroup/detail.html";
    			document.groupForm.submit();
    		}
    		//统计
    		function statistics(id,groupName){
    			$("#id").val(id);
    			$("#groupName").val(groupName);
    			document.groupForm.action="advertiseGroup/statistics.html";
    			document.groupForm.submit();
    		}
    		//统计
    		function listcreative(id){
    			$("#groupId").val(id);
    			document.groupForm.action="advertise/queryPage.html";
    			document.groupForm.submit();
    		}
    	</script>
    </head>
    <body>
	
		<!-- 正文 -->
		<form name="groupForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupId" id="groupId">
			<input type="hidden" value="" name="groupName" id="groupName">
		</form>
				<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 广告计划</div>
				<div class="right-box">
					<div class="panel panel-default">
  					<!-- Default panel contents -->
  						
  						<div class="panel-heading" style="background:#FFF;">
  							<a href="advertiseGroup/add.html" class="btn-blue24"><span class="glyphicon glyphicon-plus-sign"></span> 新建广告计划</a>
  						</div>
  						<div class="panel-heading">
    						<p>
								<a href="javascript:startCheck()">启用</a> &nbsp;&nbsp;
								<a href="javascript:pauseCheck()">暂停</a> &nbsp;&nbsp;
								<!-- <a href="javascript:deleteCheck()">删除归档</a> -->
							</p>
  						</div>
					
  						<!-- Table -->
  						<table class="table list_table">
  							<tr class="table-head">
  								<td><input type="checkbox" name="" id="check_all"></td>
  								<td>广告计划名称</td>
  								<td>状态</td>
  								<td>广告数量</td>
  								<td>投放时段定向</td>
  								<td>地域定向</td>
  								<td>人口属性</td>
  								<td>兴趣定向</td>
  								<td>出价</td>
  								<td>操作</td>
  							</tr>
  					<c:choose>
						<c:when test="${empty pu.list}">
 						</table>
					</div>
				</div>						
						<p style="text-align:center;font-size:20px;">没有查询到广告系列。</p>
						</c:when>
						<c:otherwise>						
  							<c:forEach items="${pu.list}" var="data">
								<tr align="center">
									<td><input type="checkbox" onclick="clickBox(this)" name="${data.group_name}" value="${data.id}"></td>
									<td>${data.group_name}</td>
									<td>
										<c:if test="${data.status==0}">启用</c:if>
										<c:if test="${data.status==1}">暂停</c:if>
									</td>
									<td>${data.sumAd}</td>
									<td>
										<c:if test="${data.time_orientation==0}">全时段</c:if>
										<c:if test="${data.time_orientation==1}">自定义</c:if>
									</td>
									<td>
										<c:if test="${data.regional_orientation==0}">全国</c:if>
										<c:if test="${data.regional_orientation==1}">按地域选择</c:if>
									</td>
									<td>
										<c:if test="${data.people_orientation==0}">不限人群</c:if>
										<c:if test="${data.people_orientation==1}">兴趣选择</c:if>
									</td>
									<td>
										<c:if test="${data.industry_orientation==0}">不限人群</c:if>
										<c:if test="${data.industry_orientation==1}">兴趣选择</c:if>
									</td>
									<td>${data.price}</td>
									<td>
										<c:choose>
										   <c:when test="${user.role==4}">
												<a title="修改" href="javascript:update(${data.id})" class="glyphicon glyphicon-edit gray2 mr10"></a>
										   </c:when>
										   <c:otherwise>
												<a title="查看广告" href="javascript:listcreative(${data.id})" class="glyphicon glyphicon-th-list gray2"></a>&nbsp;
										   </c:otherwise>
										</c:choose>
										<a title="查看" href="javascript:detail(${data.id})" class="glyphicon glyphicon-eye-open gray2"></a>&nbsp;
										<%-- <a title="统计" href="javascript:statistics(${data.id},'${data.group_name}')" class="glyphicon glyphicon-stats gray2"></a> --%>
										<a title="新增" href="advertiseGroupClass/list2.html?groupid=${data.id}" class="glyphicon glyphicon-plus gray2"></a>
									</td>
								</tr>
							</c:forEach>	
 						</table>
					</div>
				</div>
				<div class="pagebar">
					<jsp:include page="/WEB-INF/jsp/util/pageUtil.jsp">
						<jsp:param name="urlStr" value="advertiseGroup/list.html"/>
						<jsp:param name="id" value="${data.id}"/>
					</jsp:include>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 正文,end -->
	</body>
</html>
