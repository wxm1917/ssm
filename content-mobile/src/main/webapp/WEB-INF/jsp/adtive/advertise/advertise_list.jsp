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
        <title>创意</title>
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
    	
    	$(function(){ //$('select[name=groupId]').val()
    		$("select[name='groupId'] option").each(function(){
    		   if($(this).val() == '${creative.groupId}'){
    		    $(this).attr("selected" , "selected");
    		   }
    		});
    	}); 
    	
    		var names=null;
    		function startCheckAd(){
    			var ids = checkBox();
    			if(ids!=null){
    				if(confirm("开启创意同时也会开启其所在的广告组,确认开启吗?")){
	    				document.adForm.action="advertise/updateAvailable.html?ids="+ids+"&type=0&names="+encodeURI(encodeURI(names));
	    				document.adForm.submit();
    				}
    			}
    		}
    		function pauseCheckAd(){
    			var ids = checkBox();
    			if(ids!=null){
    				window.location.href="advertise/updateAvailable.html?ids="+ids+"&type=1&names="+encodeURI(encodeURI(names));
    			}
    		}
    		function delCheckAd(){
    			var ids = checkBox();
				if(ids!=null){
					if(confirm("删除请确认")){
						window.location.href="advertise/updateAvailable.html?ids="+ids+"&type=2&names="+encodeURI(encodeURI(names));
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
       		//提交
    		function tijiao(){
    			$('#hidden_adName').val($('#text_adName').val());
    			$('input[name=groupId]').val($('select[name=groupId]').val());
    			document.adForm.action="advertise/list.html";
    			document.adForm.submit();
    		}
    		
    		
    	</Script>
    </head>
    <body>
		

		<!-- 正文 -->
		<form name="adForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupId" id="groupId">
			<input type="hidden" value="" name="groupName" id="groupName">
			<input type="hidden" value="" name="adName" id="hidden_adName">
		</form>
				<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 创意
				<div  style="float:right"><a href="javascript:history.back()">返回</a></div>
				</div>
				
				<div class="right-box">
					<div class="panel panel-default">
  						<div class="panel-heading" style="background:#FFF;">
  							<a href="advertise/add.html" class="btn-blue24"><span class="glyphicon glyphicon-plus-sign"></span> 新建广告创意</a>
  							广告名称
  							<input type="text" name="adName" id="text_adName" value="${creative.adName}">
  							广告组
  							<select name="groupId" id="groupId">
  								<option value="">--请选择--</option>
  								<c:forEach items="${groupList}" var="group">
  									<option value="${group.id}">${group.groupName}</option>
  								</c:forEach>
  							</select>
  							<a href="javascript:tijiao()" class="btn-blue24">查询</a>
  						</div>

  						<div class="panel-heading">
    						<p>
								<a href="javascript:startCheckAd()">启用</a> &nbsp;&nbsp;
								<a href="javascript:pauseCheckAd()">暂停</a> &nbsp;&nbsp;
								<a href="javascript:delCheckAd()">删除归档</a>
							</p>
  						</div>


  						<table class="table list_table">
  							<tr class="table-head">
  								<td><input type="checkbox" name="" id="check_all" width="20"></td>
  								<td width="150">创意名称</td>
  								<td width="50">创意</td>
  								<td width="50">状态</td>
  								<td width="150">所属组</td>
  								<td width="50">类型</td>
  								<td width="60">尺寸</td>
  								<td width="60">地址</td>
  								<td width="150">创建时间</td>
  								<td width="70">操作</td>
  							</tr>
  					<c:choose>
						<c:when test="${empty dataList}">
								</table>
		 					</div>
						</div>
							<p style="text-align:center;font-size:20px;">没有查询到创意</p>
						</c:when>
						<c:otherwise>
  							<c:forEach items="${dataList}" var="data">
								<tr align="center">
									<td><input type="checkbox" onclick="clickBox(this)" name="${data.ad_name}" value="${data.id}"></td>
									<td>${data.ad_name}</td>
									<td align="center"><a class="preview" href="${data.ad_image}" target="view_window">预览</a></td>
									<td>
										<c:if test="${data.status==0}">有效</c:if>
										<c:if test="${data.status==1}">无效</c:if>
									</td>
									<td>${data.groupName}</td>
									<td>
										<c:if test="${data.ad_type==0}">图片</c:if>
										<c:if test="${data.ad_type==1}">其他</c:if>
									</td>
									<td>${data.ad_width}*${data.ad_height}</td>
									<td><a href="${data.url}" title="${data.url}" target="view_window">跳转</a></td>
									<td>${data.ctime}</td>
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
					<pg:pager url="advertise/list.html" items="${total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
			         <pg:param name="adName" value="${creative.adName}"/>
			         <pg:param name="groupId" value="${creative.groupId}"/>
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
		    </c:otherwise>
		</c:choose>
	</body>
</html>
