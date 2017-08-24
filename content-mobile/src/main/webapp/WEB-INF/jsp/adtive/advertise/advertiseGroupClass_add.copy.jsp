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
			
			$("#sub").click(function(){
				
				if($("#group_name").val()==""||$("#group_name").val()==null){
					alert("广告组名不能为空");
					return false;
				}
				var voices = new Array();
				var musics = new Array();
				$("#voices").find("span").each(function(i){
					voices.push($(this).text());
				});
				$("#musics").find("span").each(function(i){
					musics.push($(this).text());
				});
				$("#voice").val(voices);
				$("#music").val(musics);
				
				$("#formtable").submit();
			});
			
		});	
		function cancel(){
			window.location.href="advertiseGroupClass/list2.html?groupid=${groupid}";
		}
	</script>
</head>
<body style="font-family:'微软雅黑';">

	<!-- 导航,end -->
	<!-- 正文 -->
	<div class="main-right">
			<!-- 正文 -->
			<form method="post" action="advertiseGroupClass/save2.html?groupid=${groupid}"  id="formtable">
			<input type="hidden" name="voice" id="voice" value="">
			<input type="hidden" name="music" id="music" value="">
			<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 新建广告组</div>
				<div class="right-box">
					<div class="list-group">
						<div class="list-group-item adgroup-add-head-box">基本信息</div>
						<div class="list-group-item adgroup-add-body-box">
							<span class="red">*</span>
							广告组名称：
							<input type="text" name="group_name" id="group_name" class="form-control"></div>
						<div class="list-group-item adgroup-add-head-box"> <b>投放媒体</b>
						</div>
						<div class="list-group-item adgroup-add-body-box">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="media_group" value="0">直播</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="shipin_checkbox_ctr2_show">
										<input
									type="radio" name="media_group" value="1">短视频</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="media_group" value="2">点播</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="zhibo_checkbox_box">
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="live_media" value="x"><b>手机电视</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="live_media" value="1">CCTV-1综合</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="2">CCTV-2财经</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="3">CCTV-3综艺</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="4">CCTV-4国际</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="5">CCTV-5体育
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="6">CCTV-5+
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="7">BTV北京
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="8">浙江卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="9">江苏卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="10">东方卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="11">深圳卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="12">安徽卫视
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="live_media" value="y"><b>CCTV微视</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="live_media" value="13">CCTV-1综合</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="14">CCTV-2财经</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="15">CCTV-3综艺</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="16">CCTV-4国际</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="17">CCTV-5体育</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="18">CCTV-5+</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="19">CCTV-6电影</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="20">CCTV-8电视剧</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="21">CCTV-10科教</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="22">CCTV-12法制</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="23">CCTV-13新闻</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="24">GTV竞技游戏</label>
									</div>
								</li>
								<li class="list-group-item" id="shipin_checkbox_box">
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox"  name="video_media" value="x"><b>美拍</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="video_media" value="1">技能型</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="2">搞笑型</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="3">IP型</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="4">专项型</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="video_media" value="y	"><b>VS-Media</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="video_media" value="5">搞笑IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="6">旅行IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="7">赛车IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="8">韩国IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="9">音乐IP</label>
									</div>
								</li>
								<li class="list-group-item" id="dianbo_checkbox_box">
										<label  class="dib">
											<input class="groupCkQuanX1" type="checkbox"   name="planting_media" value="0">全部</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="1">推荐</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="2">订阅</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="3">电视剧</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="4">电影</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="5">体育</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="6">综艺</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="7">动漫</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="8">资讯</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="9">娱乐</label>
											<label class="dib">
											<input type="checkbox" name="planting_media" value="10">搞笑</label>
											<label class="dib">
											<input type="checkbox" name="planting_media" value="11">少儿</label>
								</li>
							</ul>
						</div>
						<div class="list-group-item adgroup-add-head-box"> <b>投放场景</b>
						</div>
						<div class="list-group-item adgroup-add-body-box">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>竞品定向</span>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="jingpin_checkbox_ctr1_hide">
										<input
									type="radio" name="commodity_orientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="jingpin_checkbox_ctr2_show">
										<input
									type="radio" name="commodity_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="jingpin_checkbox_box" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="x"><b>酒水</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="commodity" value="1">白酒</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="2">啤酒</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="3">红酒</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="y"><b>食品</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="commodity" value="4">德芙</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="5">金帝</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="6">雀巢</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="7">吉百利</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="8">可比克</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="9">达能</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="z"><b>日化</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="commodity" value="10">保洁</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="11">化妆品</label>
										<label class="dib">
											<input type="checkbox" name=commodity value="12">个人卫生用品</label>
									</div>
											<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="m"><b>服饰</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="commodity" value="13">CHANEL</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="14">D&G</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="15">COACH</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="16">GUCCI</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="17">LV</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="18">CK</label>
									</div>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>场景定向</span>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="scene_checkbox_ctr1_hide">
										<input
									type="radio" name="scene_orientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="scene_checkbox_ctr2_show">
										<input
									type="radio" name="scene_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="scene_checkbox_box" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="x"><b>交通类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="scene" value="1">巴士车内</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="2">船甲板</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="3">灯塔</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="4">地铁站/站台</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="5">发动机室</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="6">港口</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="y"><b>运动类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="scene" value="7">棒球场</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="8">保龄球场</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="9">冰屋</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="10">高尔夫球场</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="11">海崖</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="12">滑雪场</label>
									</div>
											<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="z"><b>建筑/景点类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="scene" value="13">办公室</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="14">博物馆</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="15">城堡</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="16">村舍花园</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="17">大教堂/室外</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="18">大厦</label>
									</div>
											<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="m"><b>娱乐类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="scene" value="19">冰淇淋商店</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="20">餐厅</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="21">服装店</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="22">购物中心</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="23">画廊</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="24">酒吧</label>
									</div>
								</li>
							</ul>

							<ul class="list-group" >
								<li class="list-group-item bg-gray">
									<span>人脸定向</span>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="face_checkbox_ctr1_hide">
										<input
									type="radio" name="facerecognition_orientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="face_checkbox_ctr2_show">
										<input
									type="radio" name="facerecognition_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="face_checkbox_box" >
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition" value="1"><b>老人</b></label>
									</p>
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition"  value="2"><b>小孩</b></label>
									</p>
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition"  value="3"><b>女人</b></label>
									</p>
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition"  value="4"><b>男人</b></label>
									</p>
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input  type="checkbox" class="groupCkQuanX" name="facerecognition"  value="5"><b>明星</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="6">王子文</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="7">刘涛</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="8">Angelababy</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="9">林允儿</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="10">蒋欣</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="11">赵丽颖</label>
									</div>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>情绪定向</span>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="emotion_checkbox_ctr1_hide">
										<input
									type="radio" name="emotion_orientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="emotion_checkbox_ctr2_show">
										<input
									type="radio" name="emotion_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="emotion_checkbox_box" >
									<label class="dib">
											<input type="checkbox" name="emotion" value="1">喜</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="2">怒</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="3">哀</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="4">乐</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="5">惊</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="6">恐</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="7">思</label>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>语义定向</span>&nbsp;&nbsp;&nbsp;
									<label class="dib" id="yuyi_checkbox_ctrl_hide">
										<input type="radio" name="voice_orientation" checked value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="yuyi_checkbox_ctr2_show">
										<input type="radio" name="voice_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="yuyi_checkbox_box">
									<div class="mt15 yuyiZdy">
										<div class="mt10">
											<input type="text" class="yuyiText" value="请输入语义">
												&nbsp&nbsp&nbsp
												<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;"></span>
											</span>
										</div>
										<div class="mt10 yuyiYdy">
											<p class="dib">已定义语义：</p>
											&nbsp&nbsp&nbsp
											<div class="dib" id="voices">
												<a class="bianji" href="javascript:;">编辑</a>
											</div>
										</div>
									</div>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>音乐定向</span>&nbsp;&nbsp;&nbsp;
									<label class="dib" id="music_checkbox_ctrl_hide">
										<input type="radio" name="music_orientation" checked value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="music_checkbox_ctr2_show">
										<input type="radio" name="music_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="music_checkbox_box">
									<div class="mt15 musicZdy">
										<div class="mt10">
											<input type="text" class="musicText" value="请输入音乐">
												&nbsp&nbsp&nbsp
												<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;"></span>
											</span>
										</div>
										<div class="mt10 musicYdy">
											<p class="dib">已定义音乐：</p>
											&nbsp&nbsp&nbsp
											<div class="dib" id="musics">
											
												<a class="bianji" href="javascript:;">编辑</a>
											</div>
										</div>
									</div>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>设备定向</span>&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="device_checkbox_ctr1_hide">
										<input
									type="radio" name="equipment_orientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="device_checkbox_ctr2_show">
										<input
									type="radio" name="equipment_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="device_checkbox_box" >
									<label class="dib">
											<input type="checkbox" name="equipment" value="1">苹果</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="2">小米</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="3">三星</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="4">华为</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="5">vivo</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="6">OPPO</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="7">魅族</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="8">联想</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="9">其他</label>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>终端定向</span>&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="terminal_checkbox_ctr1_hide">
										<input
									type="radio" name="terminal_orientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="terminal_checkbox_ctr2_show">
										<input
									type="radio" name="terminal_orientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="terminal_checkbox_box" >
									<label class="dib">
											<input type="checkbox" name="terminal" value="1">IOS</label>
									<label class="dib">
											<input type="checkbox" name="terminal" value="2">andriod</label>
									<label class="dib">
											<input type="checkbox" name="terminal" value="3">其他</label>
								</li>
							</ul>
						</div>
						<div class="tc mt20">
							<button type="button" class="btn-green" id ="sub">
								<span class="glyphicon glyphicon-ok"></span>
								完成
							</button>
							&nbsp;
							<button type="button" class="btn-gray" onclick="cancel()">
								<span class="glyphicon glyphicon-remove"></span>
								取消
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
	<!-- 正文,end -->
</body>
</html>
