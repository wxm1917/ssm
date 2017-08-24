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

<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="resources/plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="resources/plugin/bootstrap-datetimepicker.min.css" type="text/css" media="screen">
<script src="resources/plugin/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script>
	 	$(function(){
			var inputs = document.getElementsByTagName("input");
			var Livemedia = "${groupclass.live_media}";
			if(Livemedia!=null&&Livemedia!=""){
				$("#zhibo_checkbox_box").slideDown();
				var Livemedias  = Livemedia.split(",");
				for(var i=0;i<Livemedias.length;i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==Livemedias[i]&&inputs[j].name=="live_media"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var videomedia = "${groupclass.video_media}";
			if(videomedia!=null&&videomedia!=""){
				$("#shipin_checkbox_box").slideDown();
				var videomedias = videomedia.split(",");
				for(var i=0; i< videomedias.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==videomedias[i]&&inputs[j].name=="video_media"){
							inputs[j].checked=true;
						}
					}
				}
			}

			var plantingmedia = "${groupclass.planting_media}";
			if(plantingmedia!=null&&plantingmedia!=""){
				$("#dianbo_checkbox_box").slideDown();
				var plantingmedias = plantingmedia.split(",");
				for(var i=0; i< plantingmedias.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==plantingmedias[i]&&inputs[j].name=="planting_media"){
							inputs[j].checked=true;
						}
					}
				}
			}
			
			var commodity = "${groupclass.commodity}";
			if(commodity!=null&&commodity!=""){
				 $("#jingpin_checkbox_box").slideDown();
				var commoditys = commodity.split(",");
				for(var i=0; i< commoditys.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==commoditys[i]&&inputs[j].name=="commodity"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var scene = "${groupclass.scene}";
			if(scene!=null&&scene!=""){
				$("#scene_checkbox_box").slideDown();
				var scenes = scene.split(",");
				for(var i=0; i< scenes.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==scenes[i]&&inputs[j].name=="scene"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var facerecognition = "${groupclass.facerecognition}";
			if(facerecognition!=null&&facerecognition!=""){
				$("#face_checkbox_box").slideDown();
				var facerecognitions = facerecognition.split(",");
				for(var i=0; i< facerecognitions.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==facerecognitions[i]&&inputs[j].name=="facerecognition"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var emotion = "${groupclass.emotion}";
			if(emotion!=null&&emotion!=""){
				 $("#emotion_checkbox_box").slideDown();
				var emotions = emotion.split(",");
				for(var i=0; i< emotions.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==emotions[i]&&inputs[j].name=="emotion"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var equipment = "${groupclass.equipment}";
			if(equipment!=null&&equipment!=""){
				$("#device_checkbox_box").slideDown();
				var equipments = equipment.split(",");
				for(var i=0; i< equipments.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==equipments[i]&&inputs[j].name=="equipment"){
							inputs[j].checked=true;
						}
					}
				}
			}
			var terminal = "${groupclass.terminal}";
			if(equipment!=null&&equipment!=""){
				 $("#terminal_checkbox_box").slideDown();
				var terminals = terminal.split(",");
				for(var i=0; i< terminals.length; i++){
					for(var j=0; j< inputs.length; j++){
						if(inputs[j].type == "checkbox"&&inputs[j].value==terminals[i]&&inputs[j].name=="terminal"){
							inputs[j].checked=true;
						}
					}
				}
			}
			
			var voice = "${groupclass.voice}"
			if(voice!=null&&voice!=""){
				$("#yuyi_checkbox_box .yuyiYdy").show();
				var voices = voice.split(",");
				for(var i=0;i<voices.length;i++){
					$("#voices").children(".bianji").before('<span class="mr15">'+voices[i]+'</span>');
				}
			}
			var music = "${groupclass.music}"
			if(music!=null&&music!=""){
				$("#music_checkbox_box .musicYdy").show();
				var musics = music.split(",");
				for(var i=0;i<musics.length;i++){
					$("#musics").children(".bianji").before('<span class="mr15">'+musics[i]+'</span>');
				}
			}
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
			<div class="line-title"><span class="glyphicon glyphicon-list-alt"></span> 广告组详情</div>
				<div class="right-box">
					<div class="list-group">
						<div class="list-group-item adgroup-add-head-box">基本信息</div>
						<div class="list-group-item adgroup-add-body-box">
							<span class="red">*</span>
							广告组名称：
							<input type="text" name="group_name" id="group_name"  value="${groupclass.group_name }" class="form-control" disabled="disabled"></div>
						<div class="list-group-item adgroup-add-head-box"> <b>投放媒体</b>
						</div>
						<div class="list-group-item adgroup-add-body-box">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<label
								class="dib" id="zhibo_checkbox_ctrl_show">
										<input
									type="radio" name="media_group" value="0"<c:if test="${groupclass.media_group==0}">checked</c:if> disabled>直播</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="shipin_checkbox_ctr2_show">
										<input
									type="radio" name="media_group" value="1"<c:if test="${groupclass.media_group==1}">checked</c:if> disabled>短视频</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="dianbo_checkbox_ctr3_show">
										<input
									type="radio" name="media_group" value="2"<c:if test="${groupclass.media_group==2}">checked</c:if> disabled>点播</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="zhibo_checkbox_box">
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="live_media" value="x" disabled><b>手机电视</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="live_media" value="1" disabled>CCTV-1综合</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="2" disabled>CCTV-2财经</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="3" disabled>CCTV-3综艺</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="4" disabled>CCTV-4国际</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="5" disabled>CCTV-5体育
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="6" disabled>CCTV-5+
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="7" disabled>BTV北京
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="8" disabled>浙江卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="9" disabled>江苏卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="10" disabled>东方卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="11" disabled>深圳卫视
										</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="12" disabled>安徽卫视
										</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="live_media" value="y" disabled><b>CCTV微视</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="live_media" value="13" disabled>CCTV-1综合</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="14" disabled>CCTV-2财经</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="15" disabled>CCTV-3综艺</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="16" disabled>CCTV-4国际</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="17" disabled>CCTV-5体育</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="18" disabled>CCTV-5+</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="19" disabled>CCTV-6电影</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="20" disabled>CCTV-8电视剧</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="21" disabled>CCTV-10科教</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="22" disabled>CCTV-12法制</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="23" disabled>CCTV-13新闻</label>
										<label class="dib">
											<input type="checkbox" name="live_media" value="24" disabled>GTV竞技游戏</label>
									</div>
								</li>
								<li class="list-group-item" id="shipin_checkbox_box">
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox"  name="video_media" value="x" disabled><b>美拍</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="video_media" value="1" disabled>技能型</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="2" disabled>搞笑型</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="3" disabled>IP型</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="4" disabled>专项型</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="video_media" value="y" disabled><b>VS-Media</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="video_media" value="5" disabled>搞笑IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="6" disabled>旅行IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="7" disabled>赛车IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="8" disabled>韩国IP</label>
										<label class="dib">
											<input type="checkbox" name="video_media" value="9" disabled>音乐IP</label>
									</div>
								</li>
								<li class="list-group-item" id="dianbo_checkbox_box">
										<label  class="dib">
											<input class="groupCkQuanX" type="checkbox"   name="planting_media" value="0" disabled>全部</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="1" disabled>推荐</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="2" disabled>订阅</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="3" disabled>电视剧</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="4" disabled>电影</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="5" disabled>体育</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="6" disabled>综艺</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="7" disabled>动漫</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="8" disabled>资讯</label>
										<label class="dib">
											<input type="checkbox" name="planting_media" value="9" disabled>娱乐</label>
											<label class="dib">
											<input type="checkbox" name="planting_media" value="10" disabled>搞笑</label>
											<label class="dib">
											<input type="checkbox" name="planting_media" value="11" disabled>少儿</label>
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
									type="radio" name="commodity_orientation" value="0" <c:if test="${groupclass.commodity_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="jingpin_checkbox_ctr2_show">
										<input
									type="radio" name="commodity_orientation" value="1" <c:if test="${groupclass.commodity_orientation==1}">checked</c:if> disabled>自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="jingpin_checkbox_box" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="x" disabled><b>酒水</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="commodity" value="1" disabled>白酒</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="2" disabled>啤酒</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="3" disabled>红酒</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="y" disabled><b>食品</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="commodity" value="4" disabled>德芙</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="5" disabled>金帝</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="6" disabled>雀巢</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="7" disabled>吉百利</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="8" disabled>可比克</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="9" disabled>达能</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="z" disabled><b>日化</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="commodity" value="10" disabled>保洁</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="11" disabled>化妆品</label>
										<label class="dib">
											<input type="checkbox" name=commodity value="12" disabled>个人卫生用品</label>
									</div>
											<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="commodity" value="m" disabled><b>服饰</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="commodity" value="13" disabled>CHANEL</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="14" disabled>D&G</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="15" disabled>COACH</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="16" disabled>GUCCI</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="17" disabled>LV</label>
										<label class="dib">
											<input type="checkbox" name="commodity" value="18" disabled>CK</label>
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
									type="radio" name="scene_orientation" value="0" <c:if test="${groupclass.scene_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="scene_checkbox_ctr2_show">
										<input
									type="radio" name="scene_orientation" value="1"<c:if test="${groupclass.scene_orientation==1}">checked</c:if> disabled>自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="scene_checkbox_box" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="x" disabled><b>交通类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="scene" value="1" disabled>巴士车内</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="2" disabled>船甲板</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="3" disabled>灯塔</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="4" disabled>地铁站/站台</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="5" disabled>发动机室</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="6" disabled>港口</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="y" disabled><b>运动类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="scene" value="7" disabled>棒球场</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="8" disabled>保龄球场</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="9" disabled>冰屋</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="10" disabled>高尔夫球场</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="11" disabled>海崖</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="12" disabled>滑雪场</label>
									</div>
											<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="z" disabled><b>建筑/景点类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="scene" value="13" disabled>办公室</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="14" disabled>博物馆</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="15" disabled>城堡</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="16" disabled>村舍花园</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="17" disabled>大教堂/室外</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="18" disabled>大厦</label>
									</div>
											<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="scene" value="m" disabled><b>娱乐类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="scene" value="19" disabled>冰淇淋商店</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="20" disabled>餐厅</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="21" disabled>服装店</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="22" disabled>购物中心</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="23" disabled>画廊</label>
										<label class="dib">
											<input type="checkbox" name="scene" value="24" disabled>酒吧</label>
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
									type="radio" name="facerecognition_orientation" value="0" <c:if test="${groupclass.facerecognition_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="face_checkbox_ctr2_show">
										<input
									type="radio" name="facerecognition_orientation" value="1"<c:if test="${groupclass.facerecognition_orientation==1}">checked</c:if> disabled>自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="face_checkbox_box" >
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition" value="1" disabled><b>老人</b></label>
									</p>
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition"  value="2" disabled><b>小孩</b></label>
									</p>
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition"  value="3" disabled><b>女人</b></label>
									</p>
									<p class="mt20 mb5">
										<label  class="dib">
										<input  type="checkbox" name="facerecognition"  value="4" disabled><b>男人</b></label>
									</p>
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input  type="checkbox" class="groupCkQuanX" name="facerecognition"  value="5" disabled><b>明星</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="6" disabled>王子文</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="7" disabled>刘涛</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="8" disabled>Angelababy</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="9" disabled>林允儿</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="10" disabled>蒋欣</label>
										<label class="dib">
											<input type="checkbox" name="facerecognition" value="11" disabled>赵丽颖</label>
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
									type="radio" name="emotion_orientation" value="0" <c:if test="${groupclass.emotion_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="emotion_checkbox_ctr2_show">
										<input
									type="radio" name="emotion_orientation" value="1" <c:if test="${groupclass.emotion_orientation==1}">checked</c:if> disabled>自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="emotion_checkbox_box" >
									<label class="dib">
											<input type="checkbox" name="emotion" value="1" disabled>喜</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="2" disabled>怒</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="3" disabled>哀</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="4" disabled>乐</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="5" disabled>惊</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="6" disabled>恐</label>
									<label class="dib">
											<input type="checkbox" name="emotion" value="7" disabled>思</label>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>语义定向</span>&nbsp;&nbsp;&nbsp;
									<label class="dib" id="yuyi_checkbox_ctrl_hide">
										<input type="radio" name="voice_orientation"  value="0" <c:if test="${groupclass.voice_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="yuyi_checkbox_ctr2_show">
										<input type="radio" name="voice_orientation" value="1" <c:if test="${groupclass.voice_orientation==1}">checked</c:if> disabled>自定义</label>
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
										
											</div>
										</div>
									</div>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>音乐定向</span>&nbsp;&nbsp;&nbsp;
									<label class="dib" id="music_checkbox_ctrl_hide">
										<input type="radio" name="music_orientation"  value="0" <c:if test="${groupclass.music_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="music_checkbox_ctr2_show">
										<input type="radio" name="music_orientation" value="1" <c:if test="${groupclass.music_orientation==1}">checked</c:if> disabled>自定义</label>
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
									type="radio" name="equipment_orientation" value="0" <c:if test="${groupclass.equipment_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="device_checkbox_ctr2_show">
										<input
									type="radio" name="equipment_orientation" value="1"<c:if test="${groupclass.equipment_orientation==1}">checked</c:if> disabled>自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="device_checkbox_box" >
									<label class="dib">
											<input type="checkbox" name="equipment" value="1" disabled>苹果</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="2" disabled>小米</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="3" disabled>三星</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="4" disabled>华为</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="5" disabled>vivo</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="6" disabled>OPPO</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="7" disabled>魅族</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="8" disabled>联想</label>
									<label class="dib">
											<input type="checkbox" name="equipment" value="9" disabled>其他</label>
								</li>
							</ul>

							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>终端定向</span>&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="terminal_checkbox_ctr1_hide">
										<input
									type="radio" name="terminal_orientation" value="0" <c:if test="${groupclass.terminal_orientation==0}">checked</c:if> disabled>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label
								class="dib" id="terminal_checkbox_ctr2_show">
										<input
									type="radio" name="terminal_orientation" value="1"<c:if test="${groupclass.terminal_orientation==1}">checked</c:if> disabled>自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item" id="terminal_checkbox_box" >
									<label class="dib">
											<input type="checkbox" name="terminal" value="1" disabled>IOS</label>
									<label class="dib">
											<input type="checkbox" name="terminal" value="2" disabled>andriod</label>
									<label class="dib">
											<input type="checkbox" name="terminal" value="3" disabled>其他</label>
								</li>
							</ul>
						</div>
						<div class="tc mt20">
							<a href="advertiseGroupClass/list2.html?groupid=${groupclass.group_id }" class="btn-green">
							<span class="glyphicon glyphicon-ok"></span>返回
							</a>
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
