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
        <title>登录</title>
		<script type="text/javascript">
		</script>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<script charset="utf-8" src="resources/js/jquery.form.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<script>
			function showCurrentImg(target){
				var oldImgSrc = $("#adImage").val();
				$("#creative_add_form").ajaxForm({
					url:"advertise/saveShowImg.html?oldImgSrc="+oldImgSrc,
					type:"post",
					success:function(data){
						var obj = JSON.parse(data) 
						$("#showImg").attr("src",obj.imgSrc);
						$("#adImage").val(obj.imgSrc);
						$("#adWidth").val(obj.width);
						$("#adHeight").val(obj.height);
						
						$("#height").html(obj.height);
						$("#width").html(obj.width);
					},error:function(data){
 			
					}
				});
				$("#creative_add_form").submit();
			}	
			function changeGroup(){
				var groupId = $("#group").val();
				$("#groupId").val(groupId);
			}
			function cancel(){
				window.location.href="advertise/list.html";
			}
			function exitLogin(){
				window.location.href="login.html";
			}	
			function checkData(){
				var groupId = $("#group").val();
				if(groupId==""||groupId==0){
					alert("请选择广告组");
					return false;
				}
				return true;
			}
		</script>
    </head>
    <body style="font-family:'微软雅黑';">
		

		<!-- 正文 -->
		
				<div class="right-title left-cur">当前位置：<span class="blue">广告管理</span> &gt; 创意</div>
				<div class="right-box">
					<div class="panel panel-default mt10">
						<!-- Default panel contents -->
			  			<div class="panel-heading">
							<span class="glyphicon glyphicon-list-alt"></span> 创建创意
			  			</div>
			  			<div class="panel-heading" style="background:#FFF;">
							<table class="table_creative_head">
								<tr>
									<th>常用尺寸(px)</th>
									<th>300x250</th>
									<th>950x90</th>
									<th>350x250</th>
									<th>336x280</th>
									<th>640x90</th>
									<th>200x200</th>
									<th>610x100</th>
									<th>600x90</th>
									<th>760x90</th>
									<th>728x90</th>
								</tr>
								<tr>
									<td>约占总流量比例：</td>
									<td>47.87%</td>
									<td>16.88%</td>
									<td>8.11%</td>
									<td>6.34%</td>
									<td>3.97%</td>
									<td>3.63%</td>
									<td>3.27%</td>
									<td>2.76%</td>
									<td>1.46%</td>
									<td>1.44%</td>
								</tr>
							</table>
			  			</div>
			  			<div class="panel-heading tc">
							<form method="post" enctype="multipart/form-data" id="creative_add_form">
								<span class="red">*</span>创意属于：
								<select name="" class="form-control" onchange="changeGroup()" id="group">
									<option value="0">请选择广告组</option>
									<c:forEach items="${groupList}" var="group">
										<option value="${group.id}">${group.groupName}</option>
									</c:forEach>
									
								</select>
								<!-- 上传按钮（替代传统上传按钮外观） -->
								<style type="text/css">
								.file-box {display: inline-block;vertical-align: middle;position: relative;width: 100px;height: 30px;overflow: hidden;border: 1px solid #F0F0F0;}
								.fileupload-hidden {height: 90px!important;width: 120px!important;position: absolute;left: 0;top: 0;right: 0;bottom: 0;z-index: 2;margin: 0;padding: 0;font-size: 1000px;opacity: 0;filter: alpha(opacity=0);-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";}
								.newsImgList {position: absolute;left: 0;top: 0;right: 0;bottom: 0;width: 100%;height: 100%;z-index: 1;}
								</style>
								<div class="file-box" id="file-box_left">
									<input type="file" id="adtiveImage" name="adtiveImage" class="fileupload-hidden" onchange="showCurrentImg(this)"><!-- 选择照片后，onchange事件触发:表单提交（于总要求的） -->
									<button type="button" class="btn-blue newsImgList"><span class="glyphicon glyphicon-open"></span> 上传图片</button>
								</div>
							</form>
			  			</div>
			  			<!-- Table -->
			  			<form action="advertise/save.html" method="post" enctype="multipart/form-data"  onsubmit="return checkData()">
			  				<input type="hidden" id="adImage" name="adImage" value="">
							<input type="hidden" id="adWidth" name="adWidth" value="">
							<input type="hidden" id="adHeight" name="adHeight" value="">
							<input type="hidden" id="groupId" name="groupId" value="">
			  				<table class="table list_table" id="creative_add_table">
								<tr class="table-head" align="center">
									<td>创意</td>
									<td>创意名称</td>
									<td>素材类型</td>
									<td>尺寸</td>
									<td>目标地址</td>
								</tr>
								<tr align="center">
									<td><img src="" class="img-list" id="showImg" width="100" height="80"></td>
									<td><input type="text" name="adName" placeholder="创意名称" class="form-control"></td>
									<td>图片</td>
									<td><span id="width"></span>*<span id="height"></span></td>
									<td><input type="text" name="url" placeholder="目标地址" class="form-control"></td>
								</tr>
			 				</table>
			 				<div class="tc">
								<button type="submit" class="btn-green"><span class="glyphicon glyphicon-ok"></span> 完成</button>  &nbsp;
								<button type="button" onclick="cancel()" class="btn-gray"><span class="glyphicon glyphicon-remove"></span> 取消</button>
								<br/><br/><br/><br/>
							</div>
			 			</form>
					</div>
					<div class="right-box">
			  			<!-- Table -->
					</div>
				</div>
				
			
	<!-- 正文,end -->
	</body>
</html>
