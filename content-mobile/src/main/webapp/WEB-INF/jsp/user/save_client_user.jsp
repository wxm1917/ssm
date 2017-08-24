<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<!doctype html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<!-- 上传按钮（替代传统上传按钮外观） -->
<style type="text/css">
.file-box {display: inline-block;vertical-align: middle;position: relative;width: 100px;height: 30px;overflow: hidden;border: 1px solid #F0F0F0;}
.fileupload-hidden {height: 90px!important;width: 120px!important;position: absolute;left: 0;top: 0;right: 0;bottom: 0;z-index: 2;margin: 0;padding: 0;font-size: 1000px;opacity: 0;filter: alpha(opacity=0);-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";}

</style>
<script src="plugin/jquery-1.11.0.min.js"></script>
<script src="plugin/bootstrap.js"></script>
<script src="js/common.js"></script>
<link rel="stylesheet" type="text/css" href="plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="plugin/bootstrap-datetimepicker.min.css"type="text/css" media="screen">
<script src="plugin/bootstrap-datetimepicker.min.js"></script>
	<script>
			$(function(){
				var msg='${msg}';
		    	if(msg!=""){
		    		alert(msg);
		    	}
		    });
		function sub1(){
			if($("#username").val()==""){
				alert("用户名不能为空");
				 $("#username").focus();
				return;
			}
			
			if($("#password").val()==""){
				alert("密码不能为空");
				 $("#password").focus();
				return;
			}
			
			if($("#username").val()!=""&&$("#username").val()!=null){
				$.getJSON(encodeURI("user/onlyOne.html?username="+$("#username").val(),"utf-8"), function(json){
					 if(json!=0){
						 alert("用户名重复，请重新输入！！");
						 $("#username").focus();
						 return;
					 }
				});
			}
			mainform.submit();
		}
		var imgnum=1;
		function showTureImg(uploadbt){
			 var _html = "<br/><input type='file' name='file"+imgnum+++"' onchange='showTureImg(this)' accept='.png,.jpg,.gif' style='margin-left:95px;'/>";
		     $(uploadbt).after(_html);
		        
		}
	</script>
</head>
<body style="font-family:'微软雅黑';">

	<!-- 导航,end -->
	<!-- 正文 -->
	<form name="mainform" method="post" enctype="multipart/form-data"  action="user/saveUser.html" onsubmit="return checkData()">
		<div class="right-title">
			当前位置：<span class="blue">客户管理</span> &gt; 新建客户
		</div>
		<div class="right-box">
			<div class="list-group">
				<div class="list-group-item adgroup-add-head-box">基本信息</div>
				<div class="list-group-item adgroup-add-body-box" align="left" style="padding-left:240px;">
					
					<span class="label-t"><span class="red">*</span>客户类型：</span>
						<select name="role"  class="form-control" style=" width: 165px">
							<option value="4">广告主</option>
							<option value="3">代理商</option>
						</select>
					<br/>
					
					<span class="label-t"><span class="red">*</span>客户名称：</span>
					<input type="text" name="username" id="username" class="form-control" onBlur="onlyOne(this.value)"><br/>
					
					<span class="label-t"><span class="red">*</span>客户密码：</span>
					<input type="text" name="password" id="password" class="form-control"><br/>
					
					<span class="label-t"><span class="red"></span>客户主页：</span>
					<input type="text" name="indexUrl" id="indexUrl" class="form-control"><br/>
					
					<span class="label-t"><span class="red"></span>客户电话：</span>
					<input type="text" name="phone" id="phone" class="form-control"><br/>
					
					<span class="label-t"><span class="red"></span>客户  QQ：</span>
					<input type="text" name="qq" id="qq" class="form-control"><br/>
				   
				    <span class="label-t"><span class="red"></span>充值金额：</span>
				    <input type="text" name="residualMoney" id="residualMoney" class="form-control" value="0.0">   元<br/>
<!-- 				    <span class="red"></span>营业执照：
				    <input type='file' name='file0' accept=".png,.jpg,.gif" /><br/> -->
				   
				    <span class="label-t"><span class="red"></span>营业执照：</span>
				    <input type='file' name='file0' onchange="showTureImg(this)"  accept=".png,.jpg,.gif" /><br/>
				    
					<button type="button" onclick="sub1()" class="btn-green" style="margin-left:95px;">
						<span class="glyphicon glyphicon-ok"></span> 确认
					</button>
					&nbsp;
					<button type="button" class="btn-gray" onclick="cancel()">
						<span class="glyphicon glyphicon-remove"></span> 取消
					</button>
				</div>
	
				<!-- 撑高度的 -->
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
			</div>
		</div>
		
	</form>
	<!-- 正文,end -->
</body>
</html>
