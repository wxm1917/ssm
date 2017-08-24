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
<title>新建广告系列</title>
<script type="text/javascript">
	
</script>
<script src="resources/plugin/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/plugin/jquery.easyui.min.js"></script>  
<script src="resources/plugin/bootstrap.js"></script>
<script src="resources/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="resources/plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="resources/plugin/bootstrap-datetimepicker.min.css" type="text/css" media="screen">
<script src="resources/plugin/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script>
		$(function(){
			$(".pricer0"). on('input',function(){
				var pricer0 = $(this).val();
				var pricer1 = $(this).next().text();
				if(pricer0!=0&&pricer0<pricer1){
					$(this).parent().next().show();
				}else{
					$(this).parent().next().hide();
				}
			});
			
		
			$("#sub").click(function(){
				
				if($("#groupName").val()==""||$("#groupName").val()==null){
					alert("广告组名不能为空");
					return false;
				}
				var addage = new Array();
				var medias = new Array();
				$("#addages").find("span").each(function(i){
					addage.push($(this).text());
				});	
				
				$("#medias").find("span").each(function(i){
					medias.push($(this).text());
				});
				$("#media").val(medias);
				$("#addage").val(addage);
				$("#formtable").submit();
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
	
		function cancel(){
			window.location.href="advertiseGroup/list.html";
		}
		
	</script>
</head>
<body style="font-family:'微软雅黑';">

	<!-- 导航,end -->
	<!-- 正文 -->
	<form method="post" action="advertiseGroup/save.html"  id="formtable">
	<input type="hidden" id="time" value="">
	<input type="hidden" id="industry" value="">
	<input type="hidden" id="age" value="">
	<input type="hidden" id="sex" value="">
	<input type="hidden" id="education" value="">
	<input type="hidden" id="city" value="">
	<input type="hidden" id="media" value="" name="media">
	<input type="hidden" id="addage" value="" name="addage">

			<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 新建广告系列</div>
			<div class="right-box">
				<div class="list-group">
					<div class="list-group-item adgroup-add-head-box">基本信息</div>
					<div class="list-group-item adgroup-add-body-box">
						<span class="red">*</span>广告系列名称：<input type="text" name="groupName" id="groupName" class="form-control">
					</div>
					<div class="list-group-item adgroup-add-head-box">
						<span class="glyphicon glyphicon-list blue"></span> <b>预算和时间设置</b>
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
						<table class="mt5">
							<tr>
								<td>&nbsp;投放周期：</td>
								<td>
									<div class="input-append" id="date1"
										data-date-format="yyyy-MM-dd">
										<input size="16" type="text" name="startTime" id="startTime" value=""
											maxlength="10" class="w100" placeholder="开始日期"> <span
											class="add-on"><i class="icon-th"></i>
										</span>
									</div></td>
								<td>&nbsp;至</td>
								<td>
									<div class="input-append l ml10" id="date2"
										data-date-format="yyyy-MM-dd">
										<input size="16" type="text" name="endTime" id="endTime" value=""
											maxlength="10" class="w100" placeholder="结束日期"> <span
											class="add-on"><i class="icon-th"></i>
										</span>
									</div></td>
								<td><input type="button" value="结束日期不限"
									class="btn btn-default btn-xs ml10"
									onclick="$('#date2').find('input').val('');">
								</td>
							</tr>
						</table>
						<script type="text/javascript">
							$(function() {
								$('#date1').datetimepicker({
									format : 'yyyy-MM-dd',
									language : 'en',
									pickDate : true,
									pickTime : false,
									hourStep : 1,
									minuteStep : 15,
									secondStep : 30,
									inputMask : true
								});
								$('#date2').datetimepicker({
									format : 'yyyy-MM-dd',
									language : 'en',
									pickDate : true,
									pickTime : false,
									hourStep : 1,
									minuteStep : 15,
									secondStep : 30,
									inputMask : true
								});
							});
						</script>
					</div>
					<div class="list-group-item adgroup-add-head-box">
						<span class="glyphicon glyphicon-share-alt green"></span> 出价设置
					</div>
					<div class="list-group-item adgroup-add-body-box">
						<ul class="list-group">
							<li>
								<p class="dib">付费模式：</p>&nbsp&nbsp&nbsp&nbsp&nbsp 
								<label class="dib">	<input type="radio" name="chargeModel" value="0" checked="checked">CPM</label>&nbsp&nbsp&nbsp
								<label class="dib">	<input type="radio" name="chargeModel" value="1" >CPC</label>&nbsp&nbsp&nbsp
								<label class="dib">	<input type="radio" name="chargeModel" value="2" >CPD</label>&nbsp&nbsp&nbsp
								<label class="dib">	<input type="radio" name="chargeModel" value="3" >CPT</label>
							</li>
							<li>
								<div>
									<p>资源选择：</p>
									<div class="height relative">
										<label class="dib titleMargin">	<input type="checkbox" name="newsclient" value="0" >新闻客户端</label>
										<span>出价（¥）：&nbsp<input style="width:80px;height:25px; margin-top:6px;" type="text" value="0" onkeyup="checkNum(this)" class="pricer0" name="newsclientprice">
										&nbsp&nbsp&nbsp元/点击 （推荐单价：<span >1.12</span>~1.39）</span>
										<p class='redb'>您的出价略低，可能会导致曝光量过少，建议提价</p>
									</div>
									<div class="relative height">
										<label class="dib titleMarginT">	<input type="checkbox" name="daynews" value="0" >天天快报</label>
										<span>出价（¥）：&nbsp<input style="width:80px;height:25px; margin-top:6px;" type="text" value="0" onkeyup="checkNum(this)" class="pricer0" name="daynewstprice">
										&nbsp&nbsp&nbsp元/点击 （推荐单价：<span >1.12</span>~1.39）</span>
										<p class='redb'>您的出价略低，可能会导致曝光量过少，建议提价</p>
									</div>
									<div class="height relative">
										<label class="dib titleMargin">	<input type="checkbox" name="phonenews" value="0" >手机腾讯网</label>
										<span>出价（¥）：&nbsp<input style="width:80px;height:25px; margin-top:6px;"  value="0" onkeyup="checkNum(this)" class="pricer0" name="phonenewsprice">
										&nbsp&nbsp&nbsp元/点击 （推荐单价：<span  >1.12</span>~1.39）</span>
										<p class='redb'>您的出价略低，可能会导致曝光量过少，建议提价</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="list-group-item adgroup-add-head-box">
						<span class="glyphicon glyphicon-cog orange"></span> <b>人群定向</b>
					</div>
					<div class="list-group-item adgroup-add-body-box">
					<!-- 1.地域定向 -->
						<ul class="list-group">
							<li class="list-group-item bg-gray"><b>地域定向：</b> 
								<label	class="dib" id="area_checkbox_ctrl_hide">
									<input	type="radio" name="regionalOrientation" checked value="0">中国
								</label>&nbsp;&nbsp;&nbsp; 
								<label	class="dib" id="area_checkbox_ctrl_show">
									<input	type="radio" name="regionalOrientation" value="1">按地域选择
								</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="area_checkbox_box">
								<div>
									<p><b>一级城市</b></p>
									<label  class="dib"><input class="quanbu" type="checkbox" name="city"  value="-1">全部</label>
									<label class="dib"><input type="checkbox" name="city" value="1">北京</label>
									<label class="dib"><input type="checkbox" name="city" value="2">上海</label> 
									<label class="dib"><input type="checkbox" name="city" value="3">广州</label> 
									<label class="dib"><input type="checkbox" name="city" value="4">深圳</label>
								</div>
								<div>
									<p><b>二级城市</b></p>
									<label class="dib"><input class="quanbu" type="checkbox" name="city" value="0">全部</label>
									<label class="dib"><input type="checkbox" name="city" value="5">浙江</label>
									<label class="dib"><input type="checkbox" name="city" value="6">安徽</label> 
									<label class="dib"><input type="checkbox" name="city" value="7">福建</label>
									<label class="dib"><input type="checkbox" name="city" value="8">广西</label>
									<label class="dib"><input type="checkbox" name="city" value="9">河南</label> 
									<label class="dib"><input type="checkbox" name="city" value="10">湖北</label>
									<label class="dib"><input type="checkbox" name="city" value="11">湖南</label> 
									<label class="dib"><input type="checkbox" name="city" value="12">天津</label>
									<label class="dib"><input type="checkbox" name="city" value="13">河北</label>
									<label class="dib"><input type="checkbox" name="city" value="14">山西</label> 
									<label class="dib"><input type="checkbox" name="city" value="15">四川</label>
									<label class="dib"><input type="checkbox" name="city" value="16">重庆</label>
									<label class="dib"><input type="checkbox" name="city" value="17">辽宁</label> 
									<label class="dib"><input type="checkbox" name="city" value="18">吉林</label>
									<label class="dib"><input type="checkbox" name="city" value="19">黑龙江</label>
								</div>
							</li>
						</ul>
						<!-- 2.人口属性设置 -->
						<ul class="list-group">
							<li class="list-group-item bg-gray"><b>人口属性：</b>
								<label class="dib" id="person2_checkbox_ctrl_hide"><input
									type="radio" name="peopleOrientation" value="0" checked>不限</label>&nbsp;&nbsp;&nbsp;
								<label class="dib" id="person2_checkbox_ctrl_show"><input
									type="radio" name="peopleOrientation" value="1">自定义</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="person2_checkbox_box">
								<p class="blue">性别：</p> 
									<label class="dib"><input type="checkbox" name="sex" value="0">男性</label> 
									<label class="dib"><input type="checkbox" name="sex" value="1">女性</label>
								<div>
								<p class="blue mt10">年龄：</p> 
									<label class="dib"><input class="quanbu" type="checkbox" name="" value="0">全部</label>
									<label class="dib"><input type="checkbox" name="age" value="1">0-17</label> 
									<label class="dib"><input type="checkbox" name="age" value="2">18-24</label> 
									<label class="dib"><input type="checkbox" name="age" value="3">25-30</label> 
									<label class="dib"><input type="checkbox" name="age" value="4">31-35</label> 
									<label class="dib"><input type="checkbox" name="age" value="5">36-40岁</label> 
									<label class="dib"><input type="checkbox" name="age" value="6">41-50岁</label> 
									<label class="dib"><input type="checkbox" name="age" value="7">51-60</label>
									<label class="dib"><input type="checkbox" name="age" value="8">61-100</label>
									</div>
									<div class="mt15">
										<label class="dib"><input class="zdyBtn" type="checkbox" name="age" value="9">自定义</label>
										<div class="zidingyi">
										<div class="mt10">
											<p class="dib">年龄：</p>&nbsp&nbsp&nbsp
											<span>
												<input type="number" class="inpWid ageStart" value="0">&nbsp 至 &nbsp<input type="number" class="inpWid ageEnd" value="0">
												&nbsp&nbsp&nbsp
												<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;" id="addage"></span>
											</span>
										</div>
										<div class="mt10">
											<div class="dib yidingyi"  id="addages" >
												<p class="dib">已定义年龄段：</p>
												<a class="bianji" href="javascript:;">编辑</a>
											</div>
										</div>
										</div>
									</div>
								<p class="blue mt10">学历：</p> 
									<label class="dib"><input type="checkbox" name="education" value="1">本科及以上</label> 
									<label class="dib"><input type="checkbox" name="education" value="2">大专</label> 
									<label class="dib"><input type="checkbox" name="education" value="3">高中</label> 
									<label class="dib"><input type="checkbox" name="education" value="4">初中</label> 
									<label class="dib"><input type="checkbox" name="education" value="5">小学及以下</label>
							</li>
						</ul>
						<!-- 3.时段定向 -->
						<ul class="list-group">
								<li class="list-group-item bg-gray">
									<b>时段定向：</b>
									<label class="dib" id="time_checkbox_ctrl_hide">
										<input type="radio" name="timeOrientation" checked value="0">全时段</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="time_checkbox_ctrl_show">
										<input type="radio" name="timeOrientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="time_checkbox_box">
									<div class="mt15 timeZdy" >
										<div class="mt10">
											<p class="dib">时段：</p>
											&nbsp&nbsp&nbsp
											<span>
												<input type="time" class="inpWid1 timeStart">
												&nbsp 至 &nbsp
												<input type="time" class="inpWid1 timeEnd">
												&nbsp&nbsp&nbsp
												<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;"></span>
											</span>
										</div>
										<div class="mt10 timeYdy">
											<p class="dib">已定义时间段：</p>
											&nbsp&nbsp&nbsp
											<div class="dib" id ="medias">
		<!--									<span class="mr15">
													01：20-01：50
													<a href="javascript:;" class="glyphicon glyphicon-remove gray"></a>
												</span>
											-->
												<a class="bianji" href="javascript:;">编辑</a>
											</div>
										</div>
									</div>
								</li>
							</ul>
						<!-- 4.兴趣定向 -->
						<ul class="list-group">
							<li class="list-group-item bg-gray"><b>兴趣定向：</b>
								<label class="dib" id="person1_checkbox_ctrl_hide"><input
									type="radio" name="industryOrientation" value="0" checked>不限</label>&nbsp;&nbsp;&nbsp;
								<label class="dib" id="person1_checkbox_ctrl_show"><input
									type="radio" name="industryOrientation" value="1">按兴趣组定向</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="person1_checkbox_box">
								<label class="dib"><input type="checkbox" name="industry" value="1">工业企业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="2">食品餐饮</label> 
								<label class="dib"><input type="checkbox" name="industry" value="3">孕产育儿</label> 
								<label class="dib"><input type="checkbox" name="industry" value="4">服装鞋包</label> 
								<label class="dib"><input type="checkbox" name="industry" value="5">电子商务</label> 
								<label class="dib"><input type="checkbox" name="industry" value="6">金融财经</label> 
								<label class="dib"><input type="checkbox" name="industry" value="7">体育运动</label> 
								<label class="dib"><input type="checkbox" name="industry" value="8">旅游行业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="9">汽车行业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="10">房产行业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="11">装修家居</label> 
								<label class="dib"><input type="checkbox" name="industry" value="12">生活服务</label> 
							</li>
						</ul>

						
					</div>
					<div class="list-group-item adgroup-add-head-box">
						<b>高级设置</b>
					</div>
					<div class="list-group-item adgroup-add-body-box">
						<ul class="list-group">
							<li class="list-group-item" id="config_checkbox_box" style="border:0;">
								<p class="blue">广告投放位置定向：</p> 
								<label class="dib">	<input type="checkbox" name="adPosition" value="0" >首屏</label>
								<label class="dib"><input type="checkbox" name="adPosition" value="1" >非首屏</label>
								<p class="blue mt10">广告类型定向：</p> 
								<label class="dib"><input type="checkbox" name="adType" value="0" >嵌入式</label>
								<label class="dib"><input type="checkbox" name="adType" value="1" >浮窗</label> 
								<label class="dib"><input type="checkbox" name="adType" value="2" >贴片</label>
							</li>
						</ul>
					</div>
					
					<div class="tc mt20">
						<button type="button" class="btn-green" id="sub">
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
