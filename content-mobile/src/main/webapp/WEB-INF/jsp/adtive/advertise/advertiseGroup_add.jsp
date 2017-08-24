<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建广告系列</title>
<script src="resources/plugin/jquery-1.11.0.min.js"></script>
<script src="resources/plugin/bootstrap.js"></script>
<script src="resources/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="resources/plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="resources/plugin/bootstrap-datetimepicker.min.css" type="text/css" media="screen">
<style type="text/css">
		#tagImage img{width:60px; cursor:pointer;}
		#tagImage span{margin:0 10px 10px 0; overflow:hidden; display:inline-block; position:relative;}
		#tagImage span strong{position:absolute; width:100%; height:100%; display:none;  background:#333;
			opacity:0.7; filter:alpha(opacity=70); z-index:1; left:0; top:0; text-align:center; cursor:pointer;}
</style>
<script src="resources/plugin/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" >
		 $(function(){
			$("#serach").click(function(){
				$("#optimal").val()
				$("#antistop").val()
				$.post("media/getmedias.html",
					{optimal:$("#optimal").val(),
					antistop:$("#antistop").val()},	
					function(res){	
						var res = JSON.parse(res);  
						for(var i =0;i<res.length;i++){
							$("#tagImage").append("<span><img src='"+res[i].filepath+"' /><strong></strong><input type='hidden'  value='"+res[i].id+"'></span> ");
						}
						$("#tagImage span").each(function(){
							$(this).click(function(){
								if($(this).find("strong").css("display")=="none"){
									$(this).find("strong").css("display","block");
								}else{
									$(this).find("strong").css("display","none");
								}
							});
						});
					}
				);
			});
			
		}); 
		function checkNum(obj) {  
		     //检查是否是非数字值  
		     if (isNaN(obj.value)) {  
		         obj.value = "";  
		     }  
		     if (obj != null) {  
		         //检查小数点后是否对于两位http://blog.csdn.net/shanzhizi  
		         if (obj.value.toString().split(".").length > 1 && obj.value.toString().split(".")[1].length > 2) {  
		        	 obj.value = obj.value.substring(0, obj.value.indexOf('.') + 3);
		         }  
		     }  
		 }  
		function sub(){
			if($("#groupName").val()==""||$("#groupName").val()==null){
				alert("广告组名不能为空");
				return false;
			}
			if($("#optimal").val()==""){
				alert("请选择优化目标");
				return false;
			}
			if($("#antistop").val()==""||$("#antistop").val()==null){
				alert("请输入关键词并查找媒体");
				return false;
			}
			
			var medias = new Array();
			$("strong[style='display: block;']").each(function(){
				medias.push($(this).next().val());
			});
			if(medias.length==0){
				alert("请选择媒体");
				return false;
			}
			$("#media").val(medias); 
			
			$("#formtable").submit(); 
		}
	
		function cancel(){
			window.location.href="advertiseGroup/list.html";
		}
	</script>
</head>
<body style="font-family:'微软雅黑';">

	<!-- 导航,end -->
	<!-- 正文 -->
	<form method="post" action="advertiseGroup/save.html"  id="formtable">
		<input type="hidden" id="media" value="" name="media">
			<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 新建广告计划</div>
			<div class="right-box">
				<div class="list-group">
					<div class="list-group-item adgroup-add-head-box">基本信息</div>
					<div class="list-group-item adgroup-add-body-box">
						<span class="red">*</span>广告计划名称：<input type="text" name="groupName" id="groupName" class="form-control">
					</div>
					<div class="list-group-item adgroup-add-head-box">
						<span class="glyphicon glyphicon-list blue"></span> <b>预算设置</b>
					</div>
					<div class="list-group-item adgroup-add-body-box">
						<p class="mt5">
							<span class="red">*</span> 总 预 算：<input type="text" name="generalBudget"  value="0" onkeyup="checkNum(this)" id="generalBudget" class="form-control">元
							
							<span style="color:#9EA4C6;font-size:12px;">（系统最低限价：100元）</span>
						</p>
						<p class="mt5">
							<span class="red">*</span>每日预算：<input type="text" value="0"  name="dailyBudget" onkeyup="checkNum(this)" id="dailyBudget" class="form-control">元
							<span style="color:#9EA4C6;font-size:12px;">（系统最低限价：100元）</span>
						</p>
					</div>
					<div class="list-group-item adseries-add-head-box">
						<span class="glyphicon glyphicon-list blue"></span> <b>选择媒体</b>
					</div>
					<div class="list-group-item adseries-add-body-box">
						<p class="mt5">
							<span class="red">*</span>
							优化目标：
							<select name="optimal" id="optimal" >
								<option value="" selected="selected">请选择</option>
								<option value="1">CPC</option>
								<option value="2">CPM</option>
								<option value="3">CPA</option>
								<option value="4">CTR</option>
								<option value="5">品牌好感度</option>
								<option value="6">阅读量</option>
							</select>
						</p>
						<p class="mt5">
							<span class="red">*</span>
							关 键 词：
							<input type="text" class="form-control" id="antistop">
							<input type="button" value="查找" style="margin:-8px 0 0 5px;" id="serach"/>
						</p>
						<p class="mt5" id="tagImage">
						</p>
					</div>	
					<div class="tc mt20">
						<button type="button" class="btn-green" onclick="sub()">
							<span class="glyphicon glyphicon-ok" ></span> 完成
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
