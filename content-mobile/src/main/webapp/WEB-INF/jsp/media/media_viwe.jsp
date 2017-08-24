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
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>新增媒体</title>
	<script src="resources/plugin/jquery-1.11.0.min.js"></script>
	<script src="resources/plugin/bootstrap.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/media.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
	<!-- 时间插件 -->
	<link rel="stylesheet" href="resources/plugin/bootstrap-combined.min.css">
	<link rel="stylesheet" href="resources/plugin/bootstrap-datetimepicker.min.css" type="text/css" media="screen">
	<script src="resources/plugin/bootstrap-datetimepicker.min.js"type="text/javascript" charset="UTF-8"></script>
	<style type="text/css">
		.list-group label{width:16%;padding:5px 0px;}
		.list-group .bg-gray label{width:auto; padding:0;}
		#list-group-i label {width: auto;}
	</style>
	<script>
		window.onload=function(){
			//导航栏效果
			var aLi=document.getElementById("nav").getElementsByTagName("li");
			for(var i=0; i<aLi.length; i++){
				aLi[i].isClick=false;
				aLi[1].isClick=true;
				aLi[i].onclick=function(){
					for(var i=0; i<aLi.length; i++){
						aLi[i].className="";
						aLi[i].isClick=false;
					}
					this.className="cur";
					this.isClick=true;
				}
				aLi[i].onmouseover=function(){
					this.className="cur";
				}
				aLi[i].onmouseout=function(){
					if(this.isClick){
						this.className="cur";
					}else{
						this.className="";
					}
					
				}
			}
		}
	</script></head>
<body style="font-family:'微软雅黑';">

	<!-- 正文开始-->

		<div class="main-right">
			<!-- 正文 -->
			<form method="post" action="" onsubmit="return checkData()">
				<input type="hidden" id="time" value="">
				<input type="hidden" id="industry" value="">
				<input type="hidden" id="age" value="">
				<input type="hidden" id="sex" value="">
				<input type="hidden" id="education" value="">
				<input type="hidden" id="city" value="">
				<input type="hidden" id="media" value="">

				<div class="right-title">
					当前位置：
					<span class="blue">媒体管理</span>
					&gt; 新建媒体系列
				</div>
				<div class="right-box">
					<div class="list-group">
						<div class="list-group-item adgroup-add-head-box">基本信息</div>
						<div class="list-group-item adgroup-add-body-box" id="list-group-i">
							<p class="mt5">
								<span class="red">*</span>
								媒体名称：
								<input type="text" name="groupName" id="groupName" class="form-control">
							</p>
							<p class="mt5">
								<span class="red">*</span>
								媒体图标：
								<input type="file" value="上传图片" style="width:200px;text-align:center;cursor:pointer;">
								<span style="color:#9EA4C6;font-size:12px;margin-left:10px;">160*160像素，JPG或PNG格式</span>
							</p>
							<p class="mt5">
								<span class="red">*</span>
								媒体类型：
								<label class="dib"><input type="radio" name="mediaType" value="1"/>社交</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="radio" name="mediaType" value="2"/>视频</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="radio" name="mediaType" value="3"/>手机网站</label>
							</p>
							<p class="mt5">
								<span class="red">*</span>
								优化目标：
								<label class="dib"><input type="checkbox" value="1"/>CPC</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="checkbox"  value="2"/>CPM</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="checkbox" value="3"/>CPA</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="checkbox" value="4"/>CTR</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="checkbox" value="5"/>品牌好感度</label>
								&nbsp&nbsp&nbsp
								<label class="dib"><input type="checkbox" value="6"/>阅读量</label>
							</p>
							
						</div>
			
						<div class="list-group-item adgroup-add-head-box"> <b>媒体标签</b>
						</div>
						<div class="list-group-item adgroup-add-body-box">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span style="margin-right:15px;">竞品</span>
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">酒水</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="shipin_checkbox_ctr2_show">
										<input
									type="radio" name="competingProducts" value="1">食品</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="2">日化</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="3">服饰</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="4">IT</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="5">电信</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="6">家用电器</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="7">旅游</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="8">交通</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="9">房地产</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="10">中介</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="11">金融</label>
									
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="12">烟草</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="competingProducts" value="13">医疗</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox"  value="0"><b>白酒</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="1">五粮液</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="2">茅台</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="3">古井贡酒</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="4">西凤酒</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="5">国窖1573
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="6">洋河大曲
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="7">郎酒
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="8">剑南春
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="9">汾酒
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="10">稻花香
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="11">衡水老白干
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="12">内蒙古鸿茅
										</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="13">金种子
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>啤酒</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="jiushui" value="14">青岛</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="15">燕京</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="16">百威</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="17">嘉士伯</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="18">雪花</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="19">哈尔滨</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="20">珠江</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>红酒</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="jiushui" value="21">张裕</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="22">王朝</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="23">长城</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="24">拉菲庄园</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="25">勃朗宁</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="26">贝乐颂</label>
										<label class="dib">
											<input type="checkbox" name="jiushui" value="27">百利生</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="food" value="1">德芙</label>
										<label class="dib">
											<input type="checkbox" name="food" value="2">金帝</label>
										<label class="dib">
											<input type="checkbox" name="food" value="3">雀巢</label>
										<label class="dib">
											<input type="checkbox" name="food" value="4">吉百利</label>
											<label class="dib">
											<input type="checkbox" name="food" value="5">明治</label>
										<label class="dib">
											<input type="checkbox" name="food" value="6">怡侬</label>
										<label class="dib">
											<input type="checkbox" name="food" value="7">金丝猴</label>
										<label class="dib">
											<input type="checkbox" name="food" value="8">瑞士莲</label>
											<label class="dib">
											<input type="checkbox" name="food" value="9">金莎</label>
										<label class="dib">
											<input type="checkbox" name="food" value="10">好时</label>
										<label class="dib">
											<input type="checkbox" name="food" value="11">费列罗</label>
										<label class="dib">
											<input type="checkbox" name="food" value="12">达能</label>
											<label class="dib">
											<input type="checkbox" name="food" value="13">奥利奥</label>
										<label class="dib">
											<input type="checkbox" name="food" value="14">徐福记</label>
										<label class="dib">
											<input type="checkbox" name="food" value="15">旺旺</label>
										<label class="dib">
											<input type="checkbox" name="food" value="16">好吃点</label>
											<label class="dib">
											<input type="checkbox" name="food" value="17">达利园</label>
										<label class="dib">
											<input type="checkbox" name="food" value="18">搞笑型</label>
										<label class="dib">
											<input type="checkbox" name="food" value="19">好丽友</label>
										<label class="dib">
											<input type="checkbox" name="food" value="20">盼盼</label>
											<label class="dib">
											<input type="checkbox" name="food" value="21">味多美</label>
										<label class="dib">
											<input type="checkbox" name="food" value="22">多乐之日</label>
										<label class="dib">
											<input type="checkbox" name="food" value="23">好利来</label>
										<label class="dib">
											<input type="checkbox" name="food" value="24">可比克</label>
											<label class="dib">
											<input type="checkbox" name="food" value="25">上好佳</label>
										<label class="dib">
											<input type="checkbox" name="food" value="26">乐事</label>
										<label class="dib">
											<input type="checkbox" name="food" value="27">品客</label>
										<label class="dib">
											<input type="checkbox" name="food" value="28">洽洽</label>
											<label class="dib">
											<input type="checkbox" name="food" value="29">傻子</label>
										<label class="dib">
											<input type="checkbox" name="food" value="30">正林</label>
										<label class="dib">
											<input type="checkbox" name="food" value="31">绿箭</label>
										<label class="dib">
											<input type="checkbox" name="food" value="32">益达</label>
											<label class="dib">
											<input type="checkbox" name="food" value="33">乐天</label>
										<label class="dib">
											<input type="checkbox" name="food" value="34">曼妥思</label>
										<label class="dib">
											<input type="checkbox" name="food" value="35">雅客</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>保洁</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="rihua" value="1">力士</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="2">夏士莲</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="3">旁氏</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="4">奥妙</label>
										<label class="dib">
											<input type="checkbox" name="dianbo" value="5">中华</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="6">洁诺</label>
										<label class="dib">
											<input type="checkbox" name="dianbo" value="7">凡士林</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="8">金纺</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="9">立顿</label>
											<label class="dib">
											<input type="checkbox" name="rihua" value="10">Elizabeth</label>
											<label class="dib">
											<input type="checkbox" name="rihua" value="11">海飞丝</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>化妆品</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="rihua" value="12">雅诗兰黛</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="13">Clinique</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="14">Arden</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="15">欧珀莱</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="16">资生堂</label>
										<label class="dib">
											<input type="checkbox" name="rihua" value="17">兰蔻</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>个人卫生用品</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="rihua" >护舒宝</label>
										<label class="dib">
											<input type="checkbox" name="rihua" >高洁丝</label>
										<label class="dib">
											<input type="checkbox" name="rihua" >苏菲</label>
										<label class="dib">
											<input type="checkbox" name="rihua">安尔乐</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="fushi" >CHANEL (香奈尔)</label>
											<label class="dib">
											<input type="checkbox" name="fushi" >D&G</label>
											<label class="dib">
											<input type="checkbox" name="fushi" >COCAH</label>
											<label class="dib">
											<input type="checkbox" name="fushi" >Gucci (古琦)</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>3c数码</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="shuma" >苹果
										</label>
										<label class="dib">
											<input type="checkbox" name="shuma" >华为
										</label>
										<label class="dib">
											<input type="checkbox" name="shuma" >三星
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>网络服务</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="shuma" >58同城
										</label>
										<label class="dib">
											<input type="checkbox" name="shuma" >赶集网
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>电子商务</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="shuma" >我买网
										</label>
										<label class="dib">
											<input type="checkbox" name="shuma" >淘宝
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="dianxin" >移动</label>
											<label class="dib">
											<input type="checkbox" name="dianxin" >联通</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>空调</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >格力
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >LG
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >美的
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>冰箱</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >海尔
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >西门子
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>电视</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >飞利浦
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >索尼
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>净化器</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >夏普
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >飞利浦
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>洗衣机</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >小天鹅
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >海尔
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>微波炉</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >格兰仕
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >美的
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>油烟机</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="dianqi" >华帝
										</label>
										<label class="dib">
											<input type="checkbox" name="dianqi" >方太
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>旅游网站</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="lvyou" >携程
										</label>
										<label class="dib">
											<input type="checkbox" name="lvyou" >去哪儿
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>旅行社</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="lvyou" >中国国旅
										</label>
										<label class="dib">
											<input type="checkbox" name="lvyou" >中青旅
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>航空</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="jiaotong" >中国国际
										</label>
										<label class="dib">
											<input type="checkbox" name="jiaotong" >南方航空
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>汽车品牌</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="jiaotong" >大众
										</label>
										<label class="dib">
											<input type="checkbox" name="jiaotong" >奔驰
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>房产</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="fangchan" >万科地产
										</label>
										<label class="dib">
											<input type="checkbox" name="fangchan" >富力地产
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="zhongjie" >链家地产
										</label>
										<label class="dib">
											<input type="checkbox" name="zhongjie" >安居客
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>银行</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="jinrong" >中国工商银行
										</label>
										<label class="dib">
											<input type="checkbox" name="jinrong" >建设银行
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>p2p</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="jinrong" >余额宝
										</label>
										<label class="dib">
											<input type="checkbox" name="jinrong" >陆金所
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="yancao" >中华
										</label>
										<label class="dib">
											<input type="checkbox" name="yancao" >红塔山
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>医药品牌</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="yiliao" >同仁堂
										</label>
										<label class="dib">
											<input type="checkbox" name="yiliao" >修正药业
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="" value="0"><b>保健品</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="yiliao" >纽崔莱
										</label>
										<label class="dib">
											<input type="checkbox" name="yiliao" >金维他
										</label>
									</div>
								</li>
							</ul>
						</div>
						<div class="list-group-item adgroup-add-head-box"> <b>媒体标签</b>
						</div>
						<div class="list-group-item adgroup-add-body-box">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span style="margin-right:15px;">场景</span>
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">交通类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">运动类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">建筑/景点类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">娱乐类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">生活类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">服务类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">工作类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">通用/设施类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">农耕类</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="competingProducts" value="0">自然经管类</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="jt" >巴士车内
										</label>
										<label class="dib">
											<input type="checkbox" name="jt" >船甲板
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="yd" >棒球场
										</label>
										<label class="dib">
											<input type="checkbox" name="yd" >保龄球场
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="jz" >办公楼
										</label>
										<label class="dib">
											<input type="checkbox" name="jz" >博物馆
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="yl" >冰激凌商店
										</label>
										<label class="dib">
											<input type="checkbox" name="yl" >餐厅
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="sh" >阿拉伯人聚居区
										</label>
										<label class="dib">
											<input type="checkbox" name="sh" >餐厅厨房
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="fw" >餐厅大堂
										</label>
										<label class="dib">
											<input type="checkbox" name="fw" >等候室
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="work" >办公室
										</label>
										<label class="dib">
											<input type="checkbox" name="work" >播音室
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="sheshi" >安全出口
										</label>
										<label class="dib">
											<input type="checkbox" name="sheshi" >地下室
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="ng" >菜园
										</label>
										<label class="dib">
											<input type="checkbox" name="ng" >池塘
										</label>
									</div>
								</li>
								<li class="list-group-item nrBox" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox"  value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="zr" >冰山
										</label>
										<label class="dib">
											<input type="checkbox" name="zr" >荒地/荒原
										</label>
									</div>
								</li>
							</ul>
						</div>
						<div class="list-group-item adgroup-add-head-box"> <b>媒体资源</b>
						</div>
						<div class="list-group-item adgroup-add-body-box mediaZy">
							<span id="addBtn" style="padding:5px 7px;border:solid 1px #ccc; display:inline-block;cursor:pointer;">点击添加</span>
							<div id="addBox" style="border:solid 1px #ccc; padding:20px;display:inline-block;display:none; margin-top:30px;">
								<p>资源描述：<input type="text" class="miaoshu" style="width:400px;" /></p>
								<p>创意尺寸：&nbsp&nbsp&nbsp宽：<input class="kuan" type="text" style="width:60px;margin-right:25px;"/>
									高：<input class="gao"  type="text" style="width:60px;"/>
								</p>
								<p id="geshi">创意类型：&nbsp&nbsp&nbsp
									<label class="dib" style="width:70px;">
										<input type="checkbox" value="JPG">JPG
									</label>
									<label class="dib" style="width:70px;">
										<input type="checkbox" value="PNG">PNG
									</label>
									<label class="dib" style="width:70px;">
										<input type="checkbox" value="GIF">GIF
									</label>
								</p>
								<p style="text-align:center;"><span class="baocun" style="padding:5px 7px;border:solid 1px #ccc; display:inline-block;cursor:pointer;margin-top:20px;">保存</span></p>
							</div>
						</div>
						<div class="tc mt20">
							<button type="submit" class="btn-green">
								<span class="glyphicon glyphicon-ok"></span>
								保存媒体
							</button>
							&nbsp;
							<button type="button" class="btn-gray" onclick="cancel()">
								<span class="glyphicon glyphicon-remove"></span>
								取消操作
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
		</div>
	</div>
	<!-- 正文结束-->
</body>
</html>