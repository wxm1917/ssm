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
<title>广告系列信息修改</title>
<script src="resources/plugin/jquery-1.11.0.min.js"></script>
<script src="resources/plugin/bootstrap.js"></script>
<script src="resources/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="resources/plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="resources/plugin/bootstrap-datetimepicker.min.css"type="text/css" media="screen">
<script src="resources/plugin/bootstrap-datetimepicker.min.js"type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
	
	$(function(){
		$("#sub").click(function(){
			var addage = new Array();
			var medias = new Array();
			$("#addage").find("span").each(function(i){
				addage.push($(this).text());
			});	
			
			$("#medias").find("span").each(function(i){
				medias.push($(this).text());
			});
			$("#media").val(medias);
			$("#addages").val(addage);
			$("#formtable").submit();
		});
		
		var media = "${group.media}";
		var addage = "${group.addage}";			
		
		if(null !=media ){
			var medias  = media.split(",");
			for(var i=0;i<medias.length;i++){
				$("#medias").children(".bianji").before('<span class="mr15">'+medias[i]+'<a href="javascript:;" class="glyphicon glyphicon-remove gray"></a></span>');
			}
			$("#time_checkbox_box .timeYdy").show();
		}
		if(null !=addage ){
			var addages  = addage.split(",");
			for(var i=0;i<addages.length;i++){
				$("#addages").children(".bianji").before('<span class="mr15">'+addages[i]+'<a href="javascript:;" class="glyphicon glyphicon-remove gray"></a></span>');
			}
			$(".zidingyi").show();
			$(".yidingyi").show();
		}
		
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
	
	<!-- 正文 -->
	<form method="post" action="advertiseGroup/update.html" onsubmit="return checkData()">
	<input type="hidden" id="id" name="id" value="${group.id}">
	<input type="hidden" id="media"  name="media" value="">
	<input type="hidden" id="addage" name="addage" value="">
			<div class="right-box">
				<div class="list-group">
					<div class="list-group-item adgroup-add-head-box">广告系列详细信息</div>
					<div class="list-group-item adgroup-add-body-box">
						<span class="red">*</span>广告系列名称：<input type="text" name="groupName" id="groupName" value="${group.groupName}" class="form-control">
					</div>
					<div class="list-group-item adgroup-add-head-box">
						<span class="glyphicon glyphicon-list blue"></span> <b>预算和时间设置</b>
					</div>
					<div class="list-group-item adgroup-add-body-box">
						<p class="mt5">
							<span class="red">*</span> 总 预 算：<input type="text" onkeyup="checkNum(this)" name="generalBudget" id="generalBudget" value="${group.generalBudget}" class="form-control">元
						</p>
						<p class="mt5">
							<span class="red">*</span>每日预算：<input type="text" onkeyup="checkNum(this)" name="dailyBudget" id="dailyBudget" class="form-control" value="${group.dailyBudget}">元
						</p>
						<table class="mt5">
							<tr>
								<td>&nbsp;投放周期：</td>
								<td>
									<div class="input-append" id="date1"
										data-date-format="yyyy-MM-dd">
										<input size="16" type="text" name="startTime" id="startTime" value="${group.startTime}"
											maxlength="10" class="w100" placeholder="开始日期"> <span
											class="add-on"><i class="icon-th"></i>
										</span>
									</div></td>
								<td>&nbsp;至</td>
								<td>
									<div class="input-append l ml10" id="date2"
										data-date-format="yyyy-MM-dd">
										<input size="16" type="text" name="endTime" id="endTime" value="${group.endTime}"
											maxlength="10" class="w100" placeholder="结束日期"> <span
											class="add-on"><i class="icon-th"></i>
										</span>
									</div></td>
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
						<span class="glyphicon glyphicon-cog orange"></span> <b>出价设置</b>
					</div>
					<div class="list-group-item adgroup-add-body-box">
						<ul class="list-group">
							<li>
								<p class="dib">付费模式：</p>&nbsp&nbsp&nbsp&nbsp&nbsp 
								<label class="dib">	<input type="radio" name="chargeModel" value="0" <c:if test="${group.chargeModel==0}">checked</c:if> >CPM</label>&nbsp&nbsp&nbsp
								<label class="dib">	<input type="radio" name="chargeModel" value="1" <c:if test="${group.chargeModel==1}">checked</c:if> >CPC</label>&nbsp&nbsp&nbsp
								<label class="dib">	<input type="radio" name="chargeModel" value="2" <c:if test="${group.chargeModel==2}">checked</c:if> >CPD</label>&nbsp&nbsp&nbsp
								<label class="dib">	<input type="radio" name="chargeModel" value="3" <c:if test="${group.chargeModel==3}">checked</c:if> >CPT</label>
							</li>
							<li>
								<div>
									<p>资源选择：</p>
									<div class="height relative">
										<label class="dib titleMargin">	<input type="checkbox" name="newsclient" value="0" <c:if test="${group.newsclient==0}">checked</c:if>>新闻客户端</label>
										<span>出价（¥）：&nbsp<input style="width:80px;height:25px; margin-top:6px;" type="text" onkeyup="checkNum(this)" class="pricer0" name="newsclientprice" value="${group.newsclientprice}" ="">
										&nbsp&nbsp&nbsp元/点击 （推荐单价：<span >1.12</span>~1.39）</span>
									</div>
									<div class="relative height">
										<label class="dib titleMarginT">	<input type="checkbox" name="daynews" value="0" <c:if test="${group.daynews==0}">checked</c:if>>天天快报</label>
										<span>出价（¥）：&nbsp<input style="width:80px;height:25px; margin-top:6px;" type="text" onkeyup="checkNum(this)"  class="pricer0" name="daynewstprice" value="${group.daynewstprice}" ="">
										&nbsp&nbsp&nbsp元/点击 （推荐单价：<span >1.12</span>~1.39）</span>
									</div>
									<div class="height relative">
										<label class="dib titleMargin">	<input type="checkbox" name="phonenews" value="0" <c:if test="${group.phonenews==0}">checked</c:if>>手机腾讯网</label>
										<span>出价（¥）：&nbsp<input style="width:80px;height:25px; margin-top:6px;" type="text" onkeyup="checkNum(this)"  class="pricer0" name="phonenewsprice" value="${group.phonenewsprice}" ="">
										&nbsp&nbsp&nbsp元/点击 （推荐单价：<span  >1.12</span>~1.39）</span>
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
								<label class="dib" id="area_checkbox_ctrl_hide">
									<input type="radio" name="regionalOrientation" value="0" <c:if test="${group.regionalOrientation==0}">checked</c:if> >中国
								</label>&nbsp;&nbsp;&nbsp; 
								<label class="dib" id="area_checkbox_ctrl_show">
									<input type="radio" name="regionalOrientation" value="1" <c:if test="${group.regionalOrientation==1}">checked</c:if> >按地域选择
								</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="area_checkbox_box">
								<div>
									<p><b>一级城市</b></p>
									<label  class="dib"><input class="quanbu" type="checkbox" name="city" value="-1" >全部</label>
									<label class="dib"><input type="checkbox" name="city" value="1" >北京</label>
									<label class="dib"><input type="checkbox" name="city" value="2" >上海</label> 
									<label class="dib"><input type="checkbox" name="city" value="3" >广州</label> 
									<label class="dib"><input type="checkbox" name="city" value="4" >深圳</label>
								</div>
								<div>
									<p><b>二级城市</b></p>
									<label class="dib"><input class="quanbu" type="checkbox" name="city" value="0" >全部</label>
									<label class="dib"><input type="checkbox" name="city" value="5" >浙江</label>
									<label class="dib"><input type="checkbox" name="city" value="6" >安徽</label> 
									<label class="dib"><input type="checkbox" name="city" value="7" >福建</label>
									<label class="dib"><input type="checkbox" name="city" value="8" >广西</label>
									<label class="dib"><input type="checkbox" name="city" value="9" >河南</label> 
									<label class="dib"><input type="checkbox" name="city" value="10" >湖北</label>
									<label class="dib"><input type="checkbox" name="city" value="11" >湖南</label> 
									<label class="dib"><input type="checkbox" name="city" value="12" >天津</label>
									<label class="dib"><input type="checkbox" name="city" value="13" >河北</label>
									<label class="dib"><input type="checkbox" name="city" value="14" >山西</label> 
									<label class="dib"><input type="checkbox" name="city" value="15" >四川</label>
									<label class="dib"><input type="checkbox" name="city" value="16" >重庆</label>
									<label class="dib"><input type="checkbox" name="city" value="17" >辽宁</label> 
									<label class="dib"><input type="checkbox" name="city" value="18" >吉林</label>
									<label class="dib"><input type="checkbox" name="city" value="19" >黑龙江</label>
								</div>
							</li>
						</ul>
						<!-- 2.人口属性设置 -->
						<ul class="list-group">
							<li class="list-group-item bg-gray"><b>人口属性：</b>
								<label class="dib" id="person2_checkbox_ctrl_hide">
									<input	type="radio" name="peopleOrientation" value="0" <c:if test="${group.peopleOrientation==0}">checked</c:if>  >不限
								</label>&nbsp;&nbsp;&nbsp;
								<label class="dib" id="person2_checkbox_ctrl_show">
									<input	type="radio" name="peopleOrientation" value="1" <c:if test="${group.peopleOrientation==1}">checked</c:if>  >自定义
								</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="person2_checkbox_box">
								<p class="blue">性别：</p> 
									<label class="dib"><input type="checkbox" name="sex" value="0" >男性</label> 
									<label class="dib"><input type="checkbox" name="sex" value="1" >女性</label>
								<div>
								<p class="blue mt10">年龄：</p> 
									<label class="dib"><input class="quanbu" type="checkbox" name="age" value="0">全部</label>
									<label class="dib"><input type="checkbox" name="age" value="1" >0-17</label> 
									<label class="dib"><input type="checkbox" name="age" value="2" >18-24</label> 
									<label class="dib"><input type="checkbox" name="age" value="3" >25-30</label> 
									<label class="dib"><input type="checkbox" name="age" value="4" >31-35</label> 
									<label class="dib"><input type="checkbox" name="age" value="5" >36-40岁</label> 
									<label class="dib"><input type="checkbox" name="age" value="6" >41-50岁</label> 
									<label class="dib"><input type="checkbox" name="age" value="7" >51-60</label>
									<label class="dib"><input type="checkbox" name="age" value="8" >61-100</label>
									</div>
									<div class="mt15">
										<label class="dib"><input  type="checkbox" name="age" value="9">自定义</label>
										<div class="zidingyi">
										<div class="mt10">
											<p class="dib">年龄：</p>&nbsp&nbsp&nbsp
											<span>
												<input type="number" class="inpWid ageStart">&nbsp 至 &nbsp<input type="number" class="inpWid ageEnd">
												&nbsp&nbsp&nbsp
												<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;"></span>
											</span>
										</div>
										<div class="mt10">
											<p class="dib">已定义年龄段：</p>&nbsp&nbsp&nbsp
											<div class="dib yidingyi" id = "addages">
											
												<a class="bianji" href="javascript:;">编辑</a>
											</div>
										</div>
										</div>
									</div>
								<p class="blue mt10">学历：</p> 
									<label class="dib"><input type="checkbox" name="education" value="1" >本科及以上</label> 
									<label class="dib"><input type="checkbox" name="education" value="2" >大专</label> 
									<label class="dib"><input type="checkbox" name="education" value="3" >高中</label> 
									<label class="dib"><input type="checkbox" name="education" value="4" >初中</label> 
									<label class="dib"><input type="checkbox" name="education" value="5" >小学及以下</label>
							</li>
						</ul>
						<!-- 3.时段定向 -->
						<ul class="list-group">
							<li class="list-group-item bg-gray"><b>时段定向：</b> 
								<label class="dib" id="time_checkbox_ctrl_hide"><input type="radio" name="timeOrientation" value="0" <c:if test="${group.timeOrientation==0}">checked</c:if>  >全时段</label>&nbsp;&nbsp;&nbsp; 
								<label class="dib" id="time_checkbox_ctrl_show"><input type="radio" name="timeOrientation" value="1" <c:if test="${group.timeOrientation==1}">checked</c:if>  >自定义</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="time_checkbox_box">
								<div class="mt15 timeZdy">
									<div class="mt10">
										<p class="dib">时段：</p>&nbsp&nbsp&nbsp
										<span>
											<input type="time" class="inpWid1 timeStart">&nbsp 至 &nbsp<input type="time" class="inpWid1 timeEnd">
											&nbsp&nbsp&nbsp
											<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;"></span>
										</span>
									</div>
									<div class="mt10">
										<p class="dib">已定义时间段：</p>&nbsp&nbsp&nbsp
										<div class="dib timeYdy" id = "medias">
											<!-- <span class="mr15">
												<a href="javascript:;" class="glyphicon glyphicon-remove gray"></a>
											</span>-->
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
									type="radio" name="industryOrientation" value="0" <c:if test="${group.industryOrientation==0}">checked</c:if> >不限</label>&nbsp;&nbsp;&nbsp;
								<label class="dib" id="person1_checkbox_ctrl_show"><input
									type="radio" name="industryOrientation" value="1" <c:if test="${group.industryOrientation==1}">checked</c:if> >按兴趣组定向</label>&nbsp;&nbsp;&nbsp;
							</li>
							<li class="list-group-item" id="person1_checkbox_box">
								<label class="dib"><input type="checkbox" name="industry" value="1" >工业企业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="2" >食品餐饮</label> 
								<label class="dib"><input type="checkbox" name="industry" value="3" >孕产育儿</label> 
								<label class="dib"><input type="checkbox" name="industry" value="4" >服装鞋包</label> 
								<label class="dib"><input type="checkbox" name="industry" value="5" >电子商务</label> 
								<label class="dib"><input type="checkbox" name="industry" value="6" >金融财经</label> 
								<label class="dib"><input type="checkbox" name="industry" value="7" >体育运动</label> 
								<label class="dib"><input type="checkbox" name="industry" value="8" >旅游行业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="9" >汽车行业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="10" >房产行业</label> 
								<label class="dib"><input type="checkbox" name="industry" value="11" >装修家居</label> 
								<label class="dib"><input type="checkbox" name="industry" value="12" >生活服务</label> 
							</li>
						</ul>
					</div>
		
					<!-- 6.高级设置 -->
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
						<button type="submit" class="btn-green" id="sub">
							<span class="glyphicon glyphicon-ok"></span> 完成
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
<script>
		$(function(){
			
			var inputs = document.getElementsByTagName("input");
		
			var timeOrien = ${group.timeOrientation};
			var cityOrien = ${group.regionalOrientation};
			var industryOrien = ${group.industryOrientation};
			var peopleOrien = ${group.peopleOrientation};
			
			
			var adPosition = "${group.adPosition}";
			if(adPosition!=null&&adPosition!=""){
				var adPositions  = adPosition.split(",");
				for(var i=0;i<adPositions.length;i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==adPositions[i]&&inputs[j].name=="adPosition"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var adType = "${group.adType}";
			if(adType!=null&&adType!=""){
				var adTypes  = adType.split(",");
				for(var i=0;i<adTypes.length;i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==adTypes[i]&&inputs[j].name=="adType"){
							inputs[j].checked=true;
						}
					}
				}
			}
			
			
			if(timeOrien==1){
				$("#time_checkbox_box").slideDown();
				var time = '${group.time}';
				if(time!=null&&time!=""){
					var times  = time.split(",");
					for(var i=0;i<times.length;i++){
						for(var j=0; j< inputs.length; j++){
							if(inputs[j].type == "checkbox"&&inputs[j].value==times[i]&&inputs[j].name=="time"){
								inputs[j].checked=true;
							}
						}
					}
				}
			}
			if(cityOrien==1){
				$("#area_checkbox_box").slideDown();
				var city = '${group.city}';
				if(city!=null&&city!=""){
					var citys  = city.split(",");
					for(var i=0;i<citys.length;i++){
						for(var j=0; j< inputs.length; j++){
							if(inputs[j].type == "checkbox"&&inputs[j].value==citys[i]&&inputs[j].name=="city"){
								inputs[j].checked=true;
							}
						}
					}
				}
			}
			if(industryOrien==1){
				$("#person1_checkbox_box").slideDown();
				var industry = '${group.industry}';
				if(industry!=null&&industry!=""){
					var industrys  = industry.split(",");
					for(var i=0;i<industrys.length;i++){
						for(var j=0; j< inputs.length; j++){
							if(inputs[j].type == "checkbox"&&inputs[j].value==industrys[i]&&inputs[j].name=="industry"){
								inputs[j].checked=true;
							}
						}
					}
				}
			}
			if(peopleOrien==1){
				$("#person2_checkbox_box").slideDown();
				var sex = '${group.sex}';
				var age = '${group.age}';
				var education = '${group.education}';
				if(sex!=null&&sex!=""){
					var sexs  = sex.split(",");
					for(var i=0;i<sexs.length;i++){
						for(var j=0; j< inputs.length; j++){
							if(inputs[j].type == "checkbox"&&inputs[j].value==sexs[i]&&inputs[j].name=="sex"){
								inputs[j].checked=true;
							}
						}
					}
				}
				if(age!=null&&age!=""){
					var ages  = age.split(",");
					for(var i=0;i<ages.length;i++){
						for(var j=0; j< inputs.length; j++){
							if(inputs[j].type == "checkbox"&&inputs[j].value==ages[i]&&inputs[j].name=="age"){
								inputs[j].checked=true;
							}
						}
					}
				}
				if(education!=null&&education!=""){
					var educations  = education.split(",");
					for(var i=0;i<educations.length;i++){
						for(var j=0; j< inputs.length; j++){
							if(inputs[j].type == "checkbox"&&inputs[j].value==educations[i]&&inputs[j].name=="education"){
								inputs[j].checked=true;
							}
						}
					}
				}
			}
		})
		
		
	</script>
</html>
