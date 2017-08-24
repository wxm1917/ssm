<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<!doctype html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建广告</title>
<style type="text/css">
		.list-group .bg-gray1 label{width:auto; padding:0;}
		/* li.list-none .dib{display: none;} */
</style>
<script src="resources/plugin/jquery-1.11.0.min.js"></script>
<script src="resources/plugin/bootstrap.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/media.js"></script>
<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="resources/plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="resources/plugin/bootstrap-datetimepicker.min.css" type="text/css" media="screen">
<script src="resources/plugin/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body style="font-family:'微软雅黑';">
		<div class="main-right">
			<!-- 正文 -->
			<form method="post" action="advertiseGroupClass/save2.html" enctype="multipart/form-data">
				<input type="hidden" id="settime"  name="settime" value="">
				<input type="hidden" id="voice"  name="voices" value="">
				<input type="hidden" id="time" value="">
				<div class="right-box">
					<div class="list-group">
						<div class="list-group-item adseries-add-head-box">基本信息</div>
						<div class="list-group-item adseries-add-body-box">
							<p class="mt5">
								<span class="red">*</span>
								广 告 名 称：
								<input type="text" name="groupName" id="groupName" class="form-control">
							</p>
							<p class="mt5">
								<span class="red">*</span>
								所属广告计划：
								<select name="mediagroup" id="mediapid">
								<option value="">请选择</option>
									<c:forEach items="${groupList}" var="groupList">
										<option value="${groupList.id }">${groupList.groupName }</option>
									</c:forEach>
								</select>
							</p>
							<p class="mt5">
								<span class="red">*</span>
								推 广 页 面：
								<input type="text" id="tourl"  name="tourl"  class="form-control">
							</p>
							<p class="mt5">	
								<span class="red">*</span>
								广 告 位：
								<select name="adPositionId" id="adPositionId">
									<option value="">请选择</option>
									<%-- <c:forEach items="${adlist}" var="adlist">
										<option value="${adlist.id }">${adlist.medianame }</option>
									</c:forEach> --%>
								</select>
							</p>
						</div>
						<div class="list-group-item adseries-add-head-box">
							<span class="glyphicon glyphicon-list blue"></span> <b>时间设置</b>
						</div>
						<div class="list-group-item adseries-add-body-box">
							<table class="mt5">
								<tr>
									<td>&nbsp;投放周期：</td>
									<td>
										<div class="input-append" id="date1" data-date-format="yyyy-MM-dd">
											<input size="16" type="text" name="startTime" id="startTime" value="" maxlength="10" class="w100" placeholder="开始日期">
											<span class="add-on"> <i class="icon-th"></i> </span>
										</div>
									</td>
									<td>&nbsp;至</td>
									<td>
										<div class="input-append l ml10" id="date2" data-date-format="yyyy-MM-dd">
											<input size="16" type="text" name="endTime" id="endTime" value="" maxlength="10" class="w100" placeholder="结束日期">
											<span class="add-on"> <i class="icon-th"></i> </span>
										</div>
									</td>
									<td>
										<input type="button" value="结束日期不限" class="btn btn-default btn-xs ml10" onclick="$('#date2').find('input').val('');"></td>
								</tr>
							</table>
						</div>
						<div class="list-group-item adseries-add-head-box">
							<span class="glyphicon glyphicon-cog orange"></span>
							<b>时段定向：</b>
							<label class="dib" id="time_checkbox_ctrl_hide" style="width:70px">
									<input type="radio" name="timeOrientation" checked value="0">全时段
							</label>
							<label class="dib" id="time_checkbox_ctrl_show">
								<input type="radio" name="timeOrientation" value="1">自定义
							</label>
						</div>
						<div class="list-group-item adseries-add-body-box">
							<!-- 3.时段定向 -->
							<ul class="list-group" >
								<li class="list-group-item" id="time_checkbox_box" style="border:solid 0px #dddddd;padding:0px;">
									<div class="mt15 timeZdy">
										<div class="mt10">
											<p class="dib">时段：</p>
											&nbsp&nbsp&nbsp
											<span>
												<input type="text" class="inpWid1 timeStart">
												&nbsp 至 &nbsp
												<input type="text" class="inpWid1 timeEnd">
												&nbsp&nbsp&nbsp
												<span class="glyphicon glyphicon-plus-sign green" style="cursor:pointer; font-size:16px;"></span>
											</span>
										</div>
										<div class="mt10 timeYdy" id ="settimes">
											<p class="dib">已定义时间段：</p>
											&nbsp&nbsp&nbsp
											<div class="dib">
												<a class="bianji" href="javascript:;">编辑</a>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="list-group-item adseries-add-head-box"><b>媒体标签</b></div>
						<div class="list-group-item adgroup-add-body-box">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<c:forEach items="${labels}" var="labels">
										<label class="dib" id="zhibo_checkbox_ctrl_show">
										<input type="checkbox" name="competingProducts" value="${labels.id }">${labels.labelname }</label>
									</c:forEach>
								</li>	
								<c:forEach items="${labels}" var="labels">
								<li class="list-group-item nrBox" >
									<div>
									<label class="dib">
									<input class="groupCkQuanX1" type="checkbox" >全部</label>
									<c:forEach items="${labels.labelList}" var="labellist">
										<label class="dib">
										<input type="checkbox" name="competingProducts" value="${labellist.id}">${labellist.labelname }</label>
									</c:forEach>	
									</div>
								</li>	
								</c:forEach>
							</ul>
						</div>
						<div class="list-group-item adseries-add-head-box">
							<span class="glyphicon glyphicon-list blue"></span> <b>创意</b>
						</div>
						<div class="list-group-item adseries-add-body-box">
							<p class="mt5">
								<span class="red">*</span>
								创 意：
								<input type="file" name="file" value="上传创意" style="text-align:center;cursor:pointer;" id="file">
								<span style="color:#9EA4C6;font-size:12px;margin-left:10px;">160*160像素，JPG或PNG格式</span> <br/>
								<div style="padding-left:55px;"><img  id="show_img" src="${filepath }" alt="" style="width: 160px;height: 160px; display: none" /></div>
							</p>
							<p class="mt5">
								
							</p>
						</div>
						<div class="list-group-item adseries-add-head-box">
							<span class="glyphicon glyphicon-list blue"></span> <b>检测代码</b>
						</div>
						<div class="list-group-item adseries-add-body-box">
							<div style="width:390px;position:relative;" id="textareaBox" >
								<textarea name="excode" id="first"   style="resize:none;width:350px; height:70px;"></textarea>
								<input  type="button" value="删除" id="textareaBtn1"
								style="position:absolute; right:-20px; bottom:50px;background: #d6532b;border-radius:5px;border: 1px solid #78b951;color: #FFF;" >
								<input type="button"  value="增加" id="texareaAddBtn" 
								style="position:absolute; right:-20px; bottom:20px;background: #8fd31a;border-radius:5px;border: 1px solid #78b951;color: #FFF;" >
							</div>
						</div>
						<div class="list-group-item adgroup-add-head-box"> <b>投放场景</b>
						</div>
						<div class="list-group-item adgroup-add-body-boxx">
							<ul class="list-group">
								<li class="list-group-item bg-gray">
									<span>场景定向</span>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="scene_checkbox_ctr1_hide">
										<input type="radio" name="sceneOrientation" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="scene_checkbox_ctr2_show">
										<input type="radio" name="sceneOrientation" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
								<li class="list-group-item list-none" id="scene_checkbox_box" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox"  name="medialabelone" value="713"><b>交通类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="724">巴士车内</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="725">船甲板</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="726">灯塔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="727">地铁站/站台</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="728">发动机室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="729">港口</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="730">高架桥</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="731">高速公路</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="732">轨道</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="733">海岸线</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="734">海洋</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="735">航道</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="736">河流</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="737">火车铁路</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="738">火车站</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="739">机场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="740">加油站</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="741">林中道路</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="742">林中小路</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="743">马路</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="744">码头</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="745">牧场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="746">桥</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="747">人行横道</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="748">铁轨</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="749">停车场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="750">橡皮艇</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="751">座舱/驾驶舱</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="714"><b>运动类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="753">棒球场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="754">保龄球场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="755">冰屋</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="756">高尔夫球场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="757">海崖</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="758">滑雪场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="759">溜冰场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="760">门口/户外</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="761">木栈道</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="762">跑道</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="763">拳击场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="764">赛道/跑马场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="765">水下/珊瑚礁</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="766">体育场/棒球</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="767">体育场/足球</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="768">天空</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="769">武术馆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="770">小岛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="771">小径/小巷</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="772">游泳池</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="715"><b>建筑/景点类</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="774">办公楼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="775">博物馆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="776">城堡</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="777">村舍花园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="778">大教堂/室外</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="779">大厦</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="780">大厅/大会堂</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="781">店面</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="782">雕塑园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="783">洞穴/古迹</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="784">法院</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="785">废墟</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="786">公寓楼/户外</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="787">宫殿</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="788">拱门</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="789">规则式庭院</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="790">河口</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="791">建筑工地</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="792">建筑立面</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="793">教会/教堂/室外</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="794">教堂</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="795">酒店/室外</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="796">礼堂</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="797">裂缝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="798">陵墓</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="799">露天剧场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="800">美术馆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="801">摩天大楼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="802">墓地</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="803">喷泉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="804">棚</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="805">贫民区</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="806">水坝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="807">水塔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="808">水族馆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="809">寺庙/东亚</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="810">寺庙/南亚</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="811">寺院/修道院</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="812">索桥</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="813">塔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="814">糖果屋</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="815">天井</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="816">亭子/阁楼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="817">小屋</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="818">校舍</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="819">宿舍</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="820">岩拱</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="716"><b>娱乐类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="821">冰激凌商店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="822">餐厅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="823">服装店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="824">购物中心</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="825">画廊</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="826">酒吧</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="827">酒店房间</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="828">咖啡店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="829">礼品商店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="830">书店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="831">温泉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="832">舞台</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="833">舞厅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="834">鞋店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="835">宴会厅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="836">野餐地</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="837">野营地</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="838">游乐场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="839">游乐园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="840">娱乐</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="717"><b>生活类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="842">阿拉伯人聚居区</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="843">餐厅厨房</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="844">餐桌/家里</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="845">超市</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="846">厨房</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="847">饭厅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="848">阁楼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="849">黄油</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="850">家居办公</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="851">客厅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="852">淋浴</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="853">美容院</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="854">美食广场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="855">面包店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="856">起居室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="857">人口聚居区</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="858">肉店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="859">食品间</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="860">土民区</label>	
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="861">卧室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="862">洗衣机</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="863">小厨房</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="864">阳台</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="865">衣柜</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="866">衣帽间/更衣室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="867">自助餐厅</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="718"><b>服务类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="869">餐厅大堂</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="870">等候室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="871">教室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="872">垃圾场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="873">牢房</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="874">汽车旅馆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="875">市场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="876">消防局</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="877">小旅馆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="878">休息室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="879">医院</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="880">医院病房</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="881">幼儿园/育婴室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="882">幼儿园教室</label>	
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="719"><b>工作类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="884">办公室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="885">播音室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="886">电视演播室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="887">会议室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="888">会议中心</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="889">讲坛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="890">流水线</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="720"><b>通用/设施类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="892">安全出口</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="893">地下室</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="894">风车</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="895">风力田/风力场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="896">公用电话亭</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="897">沟/渠</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="898">楼梯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="899">水管</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="900">院子</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="901">走廊</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="902">水坑</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="721"><b>农耕类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="904">菜园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="905">池塘</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="906">稻田</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="907">耕地</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="908">果园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="909">林场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="910">麦田</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="911">玉米地</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="722"><b>自然经管类</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="913">冰山</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="914">荒地/荒原</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="915">荒野</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="916">火山</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="917">沙漠/沙子</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="918">沙漠/植物</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="919">沙洲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="920">山脉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="921">湿地/沼泽</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="922">峡谷</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="923">小溪/支流</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="924">雪地</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="925">雪山</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="926">药用植物园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="927">雨林</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="928">沼泽</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="929">植物园</label>
										</label><label class="dib">
											<input type="checkbox" name="medialabelone" value="930">竹林</label>
									</div>
								</li>
							</ul>
							<ul class="list-group">
								<li class="list-group-item bg-gray1" style="background: #f0f0f0;">
									<span>竞品定向</span>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="jingpin_checkbox_ctr1_hide">
										<input type="radio" name="commodity" value="0" checked>不限</label>
									&nbsp;&nbsp;&nbsp;
									<label class="dib" id="jingpin_checkbox_ctr2_show">
										<input type="radio" name="commodity" value="1">自定义</label>
									&nbsp;&nbsp;&nbsp;
								</li>
							<li class="list-group-item" id="jingpin_checkbox_box" style="border:1px solid #dddddd;padding:0" >
							<div  class="adgroup-add-body-box" style="border:solid 0px #ddddd;padding:10px 0 0 0">
							<ul  style="border:solid 0px #ddddd;padding:0">
								<li class="list-group-item bg-gray list-none">
									<label class="dib" id="zhibo_checkbox_ctrl_show">
										<input type="checkbox" name="medialabelone" value="79">酒水</label>
									<label class="dib" id="shipin_checkbox_ctr2_show">
										<input type="checkbox" name="medialabelone" value="1">食品</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="2">日化</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="3">服饰</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="4">IT</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="5">电信</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="6">家用电器</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="7">旅游</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="8">交通</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="9">房地产</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="10">中介</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="11">金融</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="12">烟草</label>
									<label class="dib" id="dianbo_checkbox_ctr3_show">
										<input type="checkbox" name="medialabelone" value="13">医疗</label>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<p class="mt20 mb5">
											<label  class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="14"><b>白酒</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="15">五粮液</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="16">茅台</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="17">古井贡酒</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="18">西凤酒</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="19">国窖1573</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="20">洋河大曲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="21">郎酒</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="22">剑南春</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="23">汾酒</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="24">稻花香</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="25">衡水老白干</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="26">内蒙古鸿茅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="27">金种子</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="28"><b>啤酒</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="29">青岛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="30">燕京</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="31">百威</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="32">嘉士伯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="33">雪花</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="34">哈尔滨</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="35">珠江</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="36"><b>红酒</b></label>
										</p>
										
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="37">张裕</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="38">王朝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="39">长城</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="40">拉菲庄园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="41">勃朗宁</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="42">贝乐颂</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="43">百利生</label>
									</div>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<label class="dib">
										<input class="groupCkQuanX1" type="checkbox" name="medialabelone" value="44">全部</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="45">德芙</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="46">金帝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="47">雀巢</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="48">吉百利</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="49">明治</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="50">怡侬</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="51">金丝猴</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="52">瑞士莲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="53">金莎</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="54">好时</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="55">费列罗</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="56">达能</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="57">奥利奥</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="58">徐福记</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="59">旺旺</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="60">好吃点</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="61">达利园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="62">搞笑型</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="63">好丽友</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="64">盼盼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="65">味多美</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="66">多乐之日</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="67">好利来</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="68">可比克</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="69">上好佳</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="70">乐事</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="71">品客</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="72">洽洽</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="73">傻子</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="74">正林</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="75">绿箭</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="76">益达</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="77">乐天</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="78">曼妥思</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="80">雅客</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="81">肯德基</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="82">麦当劳</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="83">必胜</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="84">吉野家</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="85">真功夫</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="86">德克士</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="87">永和大王</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="88">味千拉面</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="89">丽华</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="90">上岛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="91">雀巢</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="92">星巴克</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="93">蓝山</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="94">麦斯威尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="95">新岛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="96">迪欧</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="97">真锅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="98">香飘飘</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="99">优乐美</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="100">惠氏</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="101">多美滋</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="102">美赞臣</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="103">雅培</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="104">贝因美</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="105">圣元</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="106">施恩</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="107">雅士利</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="108">完达山</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="109">飞鹤</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="110">亨氏</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="111">蒙牛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="112">伊利</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="113">三元</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="114">光明</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="115">飞鹤</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="116">完达山</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="117">旺仔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="118">维维</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="119">特仑苏</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="120">可口</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="121">百事</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="122">统一</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="123">康师傅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="124">汇源</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="125">娃哈哈</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="126">美汁源</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="127">王老吉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="128">椰树</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="129">红牛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="130">脉动</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="131">健力宝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="132">宝矿力水特</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="133">尖叫</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="134">日加满</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="135">鲁花</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="136">福临门</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="137">金龙鱼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="138">胡姬花</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="139">太太乐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="140">古币</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="141">品利</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="142">欧丽薇兰</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="143">多利</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="144">海狮</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="145">李锦记</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="146">海天</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="147">太太乐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="148">家乐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="149">味好美</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="150">老干妈</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="151">王致和</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1238">三全</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="152">思念</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="153">龙凤</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="154">稻香村</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="155">海霸王</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="156">湾仔码头</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="157">康师傅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="158">统一</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="159">今麦郎</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="160">五谷道场</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="161">福满多</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="162">白象</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="163">冠生园</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="164">狗不理</label>
									</div>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="165"><b>保洁</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="166">力士</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="167">夏士莲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="168">旁氏</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="169">奥妙</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="170">中华</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="171">洁诺</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="172">凡士林</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="173">金纺</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="174">立顿</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="175">Elizabeth</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="176">海飞丝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="177">飘柔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="178">潘婷</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="179">沙宣</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="180">伊卡璐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="181">舒肤佳</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="182">云南白药</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="183">雕牌</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="184">立白</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="185">白猫</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="186">六神</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="187">安利</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="188">百雀羚</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="189">奥妙</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="190">拉芳</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="191">满婷</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="192">两面针</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="193">田七</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="194">霸王</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="195">贝亲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="196">汰渍</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="197">超能</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="198">碧浪</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="199">洁霸</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="200">奇强</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="201">浪奇</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="202">鹏锦</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="203">黑人</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="204">竹盐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="205">三笑</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="206">冷酸灵</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="207"><b>化妆品</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="208">雅诗兰黛</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="209">Clinique</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="210">Arden</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="211">欧珀莱</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="212">资生堂</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="213">兰蔻</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="214">DIOR,Guerlain</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="215">Christian Dior</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="216">纪梵希</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="217">CLARINS</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="218">雅芳</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="219">强生</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="220">玉兰油</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="221">SK-II</label>
											<label class="dib">
											<input type="checkbox" name="medialabelone" value="222">HR</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="223">Lancome</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="224">Biotherm</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="225">L'Oreal Paris</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="226">Maybelline</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="227">Vichy</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="228">Garnier</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="229">羽西</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="230">小护士</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="231">佰草集</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="232">大宝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="233">植树秀</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="234">曼秀雷敦</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="235">妮维雅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="236">施巴</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="237"><b>个人卫生用品</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="238">护舒宝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="239">高洁丝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="240">苏菲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="241">安尔乐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="242">ABC</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="243">娇爽</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="244">洁婷</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="245">洁柔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="246">维达</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="247">清风</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="248">心相印</label>
									</div>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<label class="dib">
											<input class="groupCkQuanX1" type="checkbox"  name="medialabelone" value="249">全部</label>
										<label class="dib" style="font-size:12px;">
											<input type="checkbox" name="medialabelone" value="250">CHANEL(香奈尔)</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="251">D&G</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="252">COCAH</label>
										<label class="dib" style="font-size:12px;">
											<input type="checkbox" name="medialabelone" value="253">Gucci(古琦)</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="254">路易威登</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="255">ELLE</label>
										<label class="dib" style="font-size:12px;">
											<input type="checkbox" name="medialabelone" value="256">Calvin Klein(CK)</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="257">GUESS</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="258">Christian Dior</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="259">范思哲</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1239">PRADA</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1240">阿玛尼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1241">三宅一生</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1242">巴宝莉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1243">杰尼亚</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1244">杉 杉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1245">波司登</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1246">红豆</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1247">报喜鸟</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1248">柒牌</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="260">鄂尔多斯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="261">雅戈尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="262">庄吉</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="263">森马</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="264">李宁</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="265">耐克</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="266">阿迪达斯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="267">乔丹</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="268">佐丹奴</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="269">美特斯邦威</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="270">zara.H&M</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="271">太平鸟</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="272">ONLY</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="273">劲霸</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="274">爱慕</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="275">班尼路</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="276">百丽</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="277">安踏</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="278">特步</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="279">361度</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="280">达芙妮</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="281">彪马</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="282">新百伦</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="283">匹克</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="284">李维斯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="285">LEE</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="286">金利来</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="287">英氏</label>
									</div>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="288"><b>3c数码</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="289">苹果</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="290">华为</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="291">三星</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="292">小米</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="293">oPPO</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="294">中兴</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="295">酷派</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="296">HTC</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="297">联想</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="298">小辣椒</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="299">vivo</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="300">IBM</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="301">惠普</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="302">戴尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="303">华硕</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="304">宏基</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="305">海尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="306">方正</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="307">富士通</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="308">东芝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="309">索尼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="310">NEC</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="311">佳能</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="312">尼康</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="313">索尼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="314">富士</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="315">卡西欧</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="316">松下</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="317">奥林巴斯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="318">徕卡</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="319">宾得</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="320"><b>网络服务</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="321">58同城</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="322">赶集网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="323">智联招聘</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="324">51JOB</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="325"><b>电子商务</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="326">我买网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="327">淘宝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="328">阿里巴巴</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="329">天猫</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="330">亚马逊</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="331">美团</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="332">京东</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="333">苏宁易购</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="334">1号店</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="335">百度糯米</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="336">大红点评</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="337">国美在线</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="338">唯品会</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="339">蘑菇街</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="340">聚美优品</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="341">大麦网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="342">美丽说</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="343">拉手网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="344">返利网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="345">酒仙网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="346">优购网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="347">凡客诚品</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="348">蜜芽宝贝</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="349">优衣库</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="350">当当网</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="351">红孩子</label>
									</div>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<label class="dib">
											<input class="groupCkQuanX1" type="checkbox" name="medialabelone" value="1249">全部</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="352">移动</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="353">联通</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="354">电信</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="355">网通</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="356">铁通</label>
									</div>
								</li>
								<li class="list-group-item nrBox list-none" >
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="357"><b>空调</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="358">格力</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="359">LG</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="360">美的</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="361">海尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="362">大金</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="363">海信</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="364">奥克斯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="365">格兰仕</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="366"><b>冰箱</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="367">海尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="368">西门子</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="369">容声</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="370">美的</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="371">美菱</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="372">新飞</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="373">三星</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="374">海信</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="375">松下</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="376">LG</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="377"><b>电视</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="378">飞利浦</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="379">索尼</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="380">雅马哈</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="381">三星</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="382">JBL</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="383">创维</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="384">乐视</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="385">TCL</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="386">夏普</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="387">长虹</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="388">康佳</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="389">酷开</label>
									</div>
									<div>
										<p class="mt20 mb5">
											<label class="dib">
											<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="390"><b>净化器</b></label>
										</p>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="391">夏普</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="392">飞利浦</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="393">松下</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="394">亚都</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="395">大金</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="396">美的</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="397">布鲁雅尔</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="398">远大</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="399">三星</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="400">霍尼韦尔</label>
									</div>
									<div>
										<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="401"><b>洗衣机</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="402">小天鹅</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="403">海尔</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="404">西门子</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="405">三洋</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="406">博世</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="407">惠而浦</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="408">美的</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="409">三星</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="410">松下</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="1250"><b>微波炉</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="411">格兰仕</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="412">美的</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="413">松下</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="414">三洋</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="415">海尔</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="416">西门子</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="417">LG</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="418">惠而浦</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="419">方太</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="420">威力</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="421"><b>油烟机</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="422">华帝</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="423">方太</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="424">老板</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="425">万家乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="426">万和</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="427">奥田</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="428">帅康</label>
										</div>
									</li>
									<li class="list-group-item nrBox" >
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="429"><b>旅游网站</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="430">携程</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="431">去哪儿</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="432">艺龙</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="433">去啊</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="434">同程</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="435">途牛</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="436">芒果</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="437">驴妈妈</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="438">蚂蜂窝</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="439">乐途</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="440"><b>旅行社</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="441">中国国旅</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="442">中青旅</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="443">凯撒旅游</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="444">中信旅游</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="445">众信旅游</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="446">康辉</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="447">春秋</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="448">锦江旅游</label>
										</div>
									</li>
									<li class="list-group-item nrBox list-none" >
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="449"><b>航空</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="450">中国国际</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="451">南方航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="452">东方航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="453">国泰航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="454">海南航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="455">港龙航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="456">深圳航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="457">中华航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="458">长荣航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="459">新西兰航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="460">新加波航空 </label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="461">加拿大航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="462">汉莎航空</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="463">美国航空</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="464"><b>汽车品牌</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="465">大众</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="466">奔驰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="467">宝马</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="468">奥迪</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="469">凯迪拉克</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="470">悦达起亚</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="471">JEEP</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="472">沃尔沃</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="473">东风</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone"  value="474">日产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="475">现代</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="476">福特</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="477">长城</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="478">丰田</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="479">本田</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="480">别克</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="481">雪佛兰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="482">标致</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="483">长安</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="484">雪铁龙</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="485">斯柯达</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="486">铃木</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="487">奇瑞</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="488">马自达</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="489">中华</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="490">宝骏</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="491">江淮</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="492">荣威</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="493">哈佛</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="494">海马</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="495">路虎</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="496">一汽</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="497">奔腾</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="498">启辰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="499">三菱</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="500">保时捷</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="501">斯巴鲁</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="502">东南</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="503">风行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="504">东风风神</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="505">广汽</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="506">陆风</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="507">菲亚特</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="508">雷诺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="509">捷豹</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="510">英菲尼迪</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="511">华泰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="512">众泰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="513">力帆</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="514">长城</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="515">道奇</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="516">北京</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="517">兰博基尼</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="518">福田</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="519">法拉利</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="520">阿斯顿·马丁</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="521">理念</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="522">宾利</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="523">劳斯莱斯</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="524">克莱斯勒</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="525"><b>跑车</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="526">奥迪A5</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="527">奥迪A7</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="528">奔驰CLS</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="529">尚酷</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="530">奥迪TT</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="531">宝马2系</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="532">宝马Z4</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="533">保时捷911</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="534">panamera</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="1251"><b>豪华车</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="535">宝马7系</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="536">奔驰S级</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="537">panamera</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="538">奥迪A8</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="539">捷豹XJ</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="540">辉腾</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="541">雷克萨斯LS</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="542">幻影</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="543">慕尚</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="544">总裁</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="545"><b>SUV</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="546">途观</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="547">本田CR-V</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="548">汉兰达</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="549">奥迪A5</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="550">翼虎</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="551">奇骏</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="552">一汽丰田RAV4</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="553">昂科拉</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="554">逍客</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="555">北京现代IX35</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="556"><b>MPV</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="557">五菱宏光 </label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="558">五菱之光</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="559">五菱荣光</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="560">途安</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="561">逸志</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="562">菱智</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="563">奥迪赛</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="564">宝骏730</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="565">别克GL8</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="566">日产NV200</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="567"><b>中大型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="568">宝马5系</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="569">奔驰E级</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="570">奥迪A6L</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="571">皇冠</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="572">雷克萨斯ES</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="573">奥迪A7</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="574">宝马5系GT</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="575">凯迪拉克XTS</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="576">沃尔沃S80L</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="577"><b>中型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="578">凯美瑞</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="579">奥迪A4L</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="580">迈腾</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="581">雅阁</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="582">君威</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="583">天籁</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="584">迈锐宝</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="585">蒙迪欧</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="586">帕萨特</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="587">宝马3系</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="588"><b>紧凑型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="589">福克斯</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="590">朗逸</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="591">速腾</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="592">新科鲁兹</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="593">卡罗拉</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="594">宝来</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="595">新轩逸</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="596">凯越</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="597">英朗</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="598">高尔夫</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="599"><b>小型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="600">飞度</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="601">POLO</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="602">赛欧</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="603">起亚K2</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="604">威驰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="605">锋范</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="606">瑞纳</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="607">嘉年华</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="608">骊威</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="609">YARISL致炫</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="610"><b>微型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="611">比亚迪FO</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="612">奥拓</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="613">奇瑞QQ3</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="614">北斗星X5</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="615">奔奔MINI</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="616">熊猫</label>
											<label class="dib" style="font-size:12px;">
												<input type="checkbox" name="medialabelone" value="617">SMART FORTWO</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="618">乐驰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="619">旗云1</label>
										</div>
									</li>
									<li class="list-group-item nrBox list-none" >
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="620"><b>房产</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="621">万科地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="622">富力地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="623">保利地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="624">万达集团</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="625">绿地地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="626">恒大地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="627">中海地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="628">碧桂园</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="629">华润置地</label>
										</div>
									</li>
									<li class="list-group-item nrBox list-none" >
										<div>
											<label class="dib">
											<input class="groupCkQuanX1" type="checkbox" name="medialabelone" value="630">全部</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="631">链家地产</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="632">我爱我家</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="633">安居客</label>
										</div>
									</li>
									<li class="list-group-item nrBox list-none" >
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="634"><b>银行</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="635">中国工商银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="636">建设银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="637">招商银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="638">农业银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="639">广发银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="640">中国银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="641">交通银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="642">民生银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="643">兴业银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="644">中信银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="645">浦发银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="646">中国银联</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="647">渣打银行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="648">华夏银行</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="649"><b>p2p</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="650">余额宝</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="651">陆金所</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="652">京东金融</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="653">苏宁金融</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="654">百度金融</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="656">理财通</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="657">宜信</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="658">活期通</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="659">人人贷</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="660">拍拍贷</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="661"><b>保险</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="662">中国人寿</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="663">中国平安</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="664">太平洋保险</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="665">中国人保</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="666">新华保险</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="667">泰康保险</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="668">友邦保险</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="669">中国太平保险</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="670">阳光保险</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="671">安邦保险</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="672"><b>第三方支付</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="673">银联商务</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="674">支付宝</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="675">财付通</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="676">块钱</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="677">拉卡拉</label>
										</div>
									</li>
									<li class="list-group-item nrBox list-none" >
										<div>
											<label class="dib">
											<input class="groupCkQuanX1" type="checkbox" name="medialabelone" value="678">全部</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="679">中华</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="680">红塔山</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="681">云烟</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="682">苏烟</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="683">黄鹤楼</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="684">娇子</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="685">中南海</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="686">大红鹰</label>
										</div>
									</li>
									<li class="list-group-item nrBox list-none" >
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="687"><b>医药品牌</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="688">同仁堂</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="689">修正药业</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="690">云南白药</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="691">葵花药业</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="692">哈药</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="693">三九药业</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="694">神威药业</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="695">三精制药</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="696">江中集团</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="697">仁和</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="698">康恩贝</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="699"><b>保健品</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="700">纽崔莱</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="701">金维他</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="702">善存</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="703">盖中盖</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="704">钙尔奇</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="705">黄金搭档</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="706">脑白金</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="707">合生元</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="708">汉臣氏</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="709">金施尔康</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="710">汤臣倍健</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="711">康恩贝</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="712">迪巧</label>
										</div>
									</li>
								</ul>
							</div>
							</li>
							</ul>
								<ul class="list-group" >
									<li class="list-group-item bg-gray">
										<span>明星定向</span>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="star_checkbox_ctr1_hide">
											<input type="radio" name="starOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="star_checkbox_ctr2_show">
											<input type="radio" name="starOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item list-none" id="star_checkbox_box" >
										<div>
											<label class="dib">
											<input class="groupCkQuanX1" type="checkbox" name="medialabelone" value="932">全部</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="933">王子文</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="934">刘涛</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="935">angelababy</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="936">林允儿</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="937">蒋欣</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="938">赵丽颖</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="939">张天爱</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="940">杨紫</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="941">俞飞鸿</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="942">宋慧乔</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="943">郑爽</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="944">杨幂</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="945">郝蕾</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="946">范冰冰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="947">唐嫣</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="948">林心如</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="949">刘诗诗</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="950">张雨绮</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="951">关悦</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="952">古力娜扎</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="953">吴亦凡</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="954">陈学冬</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="955">宋仲基</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="956">鹿晗</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="957">吴秀波</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1252">马天宇</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="958">蒋劲夫</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="959">薛之谦</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="960">靳东</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="961">杨洋</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="962">王凯</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="963">胡歌</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="964">杨烁</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="965">李易峰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="966">郭德纲</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="967">邓超</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="968">霍建华</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="969">黄子韬</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="970">周星驰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="971">佟大为</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="972">关悦</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="973">宋茜</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="974">郑秀晶</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="975">戚薇</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="976">王菲</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="977">萨顶顶</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="978">鞠婧祎</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="979">郑秀妍</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="980">邓紫棋</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="981">杨钰莹</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="982">邓丽君</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="983">宋祖英</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="984">李宇春</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="985">田馥甄</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="986">弦子</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="987">徐怀钰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="988">姚贝娜</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="989">贾青</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="990">张靓颖</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="991">徐佳莹</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="992">tfboys</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="993">exo组合</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="994">黄子韬</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="995">张艺兴</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="996">周杰伦</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="997">刘德华</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="998">钟汉良</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="999">张杰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1000">张国荣</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1001">谢霆锋</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1002">陈奕迅</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1003">许嵩</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1004">汪峰</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1005">罗志祥</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1006">丁俊晖</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1007">科比</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1008">潘晓婷</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1009">c罗</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1010">詹姆斯</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1011">林书豪</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1012">孙杨</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1013">乔丹</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1014">梅西</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1015">欧文</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1016">史鸿飞</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1017">官秀昌</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1018">姚明</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1019">福原爱</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1020">刘莎莎</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1021">宁泽涛</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1022">郭晶晶</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1023">贝克汉姆</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1024">齐达内</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1025">张怡宁</label>
										</div>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>频道定向</span>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="pindao_checkbox_ctr1_hide">
											<input type="radio" name="pindaoOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="pindao_checkbox_ctr2_show">
											<input type="radio" name="pindaoOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item list-none" id="pindao_checkbox_box" >
										<div>
											<p class="mt20 mb5">
												<label  class="dib">
												<input class="groupCkQuanX" type="checkbox"  name="medialabelone" value="1026"><b>央视</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1031">CCTV-1综合</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1032">CCTV-2财经</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1033">CCTV-3综艺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1034">CCTV-4国际</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1035">CCTV-5体育</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1036">CCTV5+</label>
											<label class="dib" style="font-size:12px;">
												<input type="checkbox" name="medialabelone" value="1037">CCTV-6电影频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1038">CCTV-7军事</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1039">CCTV-8电视剧</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1040">CCTV-9纪录</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1041">CCTV-10科教</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1253">CCTV-11戏曲</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1042">CCTV-12法制</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1043">CCTV-13新闻</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1044">CCTV-14少儿</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1045">CCTV-15音乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1046">CCTV NEWS</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1047">证券资讯</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label  class="dib" style="width:40%;">
												<input class="groupCkQuanX"  type="checkbox" name="medialabelone" value="1027"><b>上星卫视（32家）</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1049">BTV北京</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1050">浙江卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1051">江苏卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1052">东方卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1053">深圳卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1054">安徽卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1055">山东卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1056">四川卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1057">辽宁卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1058">重庆卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1059">新疆卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1060">內蒙古卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1061">青海卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1062">江西卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1063">西藏卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1064">甘肃卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1065">广东卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1066">吉林卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1067">宁夏卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1068">黑龙江卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1069">云南卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1070">河北卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1071">广西卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1072">旅游卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1073">贵州卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1074">东南卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1075">湖北卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1076">天津卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1077">陕西卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1078">河南卫视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1079">湖南卫视</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label  class="dib">
												<input class="groupCkQuanX" type="checkbox" name="medialabelone" value="1028"><b>卫视以下地方台</b></label>
											</p>
											<label class="dib" style="font-size:12px;">
												<input type="checkbox" name="medialabelone" value="1081">湖南卫视国际频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1082">湖南经视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1083">湖南都市</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1084">金鹰纪实</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1085">湖南电视剧频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1086">湖南公共</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1087">湖南娱乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1088">金鹰卡通</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1089">快乐购</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1090">长沙政法频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1091">长沙新闻频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1092">BTV文艺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1093">BTV科教</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1094">BTV青年</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1095">BTV体育</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1096">BTV财经</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1097">河南新闻频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1098">河南电视剧频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1099">河南法制频道</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label  class="dib">
												<input class="groupCkQuanX" type="checkbox"  name="medialabelone" value="1029"><b>其他</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1101">CIBN电影导视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1102">CIBN电影频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1103">CIBN华视院线</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1104">CIBN精品影院</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1105">CIBN情感影院</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1106">CIBN热播剧场</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1107">CIBN骄阳剧场</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1108">CIBN古装剧场</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1109">CIBN综艺频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1110">CIBN动漫频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1111">CIBN纪录频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1112">CIBN微电影频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1113">CIBN禅文化频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1114">CIBN汽车频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1115">CIBN教育频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1116">CIBN财经频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1117">CIBN音乐频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1118">CIBN TEA电竞</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1119">CIBN风尚频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1120">CIBN环球频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1121">CNC6中文台</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1122">CNC World 6</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1123">GTV游戏竞技</label>
											<label class="dib" style="font-size:12px;">
												<input type="checkbox" name="medialabelone" value="1124">GTV游戏竞技网络</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1125">家庭理财</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1126">电子体育</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1127">网络棋牌</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1128">新动漫</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1129">快乐宠物</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1130">车迷频道</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1131">新娱乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1132">收藏天下</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1133">家庭健康</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1134">职业指南</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1135">百姓健康</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1136">时代出行</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1137">时代风尚</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1138">时代家居</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1139">时代美食</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1140">优漫卡通</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1141">法律服务</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1142">潮体育</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1143">i综艺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1144">车视界</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1145">快新闻</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1146">热动漫</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1147">新影视</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1148">炫韩娱</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1149">e娱乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1150">靓妆</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1151">WCA2016</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1152">国际流行音乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1153">环球资讯广播</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1154">轻松调频</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1155">南海之声</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1156">NEWSPLUS</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1157">环球旅游广播</label>
										</div>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>栏目定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="lanmu_checkbox_ctrl_hide">
											<input type="radio" name="lanmuOrientation" checked value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="lanmu_checkbox_ctr2_show">
											<input type="radio" name="lanmuOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item list-none" id="lanmu_checkbox_box" >
										<div>
											<label class="dib">
											<input class="groupCkQuanX1" type="checkbox"  name="medialabelone" value="1213">全部</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1214">热门推荐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1215">订阅</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1216">电视剧</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1217">电影</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1218">体育</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1219">综艺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1220">动漫</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1221">资讯</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1222">娱乐</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1223">搞笑</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1224">少儿</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1225">原创</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1226">游戏</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1227">健康</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1228">母婴</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1229">汽车</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1230">财经</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1231">军事</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1232">科技</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1233">教育</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1234">纪录片</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1235">时尚</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1236">旅游</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1237">音乐</label>
										</div>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>视频类别定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="ship_checkbox_ctrl_hide">
											<input type="radio" name="shipOrientation" checked value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="ship_checkbox_ctr2_show">
											<input type="radio" name="shipOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item list-none" id="ship_checkbox_box">
										<div>
											<p class="mt20 mb5">
												<label  class="dib">
												<input class="groupCkQuanX" type="checkbox"  name="medialabelone" value="1158"><b>技能型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1162">电脑绘画</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1163">创意</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1164">舞蹈</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1165">手工艺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1166">美妆</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label  class="dib">
												<input class="groupCkQuanX" type="checkbox"  name="medialabelone" value="1159"><b>搞笑型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1162">电脑绘画</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1163">创意</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1164">舞蹈</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1165">手工艺</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1166">美妆</label>
										</div>
										<div>
											<p class="mt20 mb5">
												<label  class="dib">
												<input class="groupCkQuanX" type="checkbox"  name="medialabelone" value="1160"><b>专项型</b></label>
											</p>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1168">搞笑短剧</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1169">段子手</label>
											<label class="dib">
												<input type="checkbox" name="medialabelone" value="1170">老外搞笑</label>
										</div>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>点播类别定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="dianb_checkbox_ctr1_hide">
											<input type="radio" name="dianbOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="dianb_checkbox_ctr2_show">
											<input type="radio" name="dianbOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item list-none" id="dianb_checkbox_box" >
										<label class="dib">
											<input class="groupCkQuanX1" type="checkbox"  name="medialabelone" value="1178">全部</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1179">推荐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1180">订阅</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1190">电视剧</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1191">电影</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1192">体育</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1193">综艺</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1194">动漫</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1195">资讯</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1196">娱乐</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1197">搞笑</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1198">少儿</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1199">原创</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1200">游戏</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1201">健康</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1202">母婴</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1203">汽车</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1204">财经</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1205">军事</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1206">科技</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1207">教育</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1208">纪录片</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1209">时尚</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1210">旅游</label>
										<label class="dib">
											<input type="checkbox" name="medialabelone" value="1211">音乐</label>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>语义定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="yuyi_checkbox_ctrl_hide">
											<input type="radio" name="voiceorientation" checked value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="yuyi_checkbox_ctr2_show">
											<input type="radio" name="voiceorientation" value="1">自定义</label>
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
										<span>地域定向</span>&nbsp;&nbsp;&nbsp;
										<label 	class="dib" id="area_checkbox_ctrl_hide">
											<input type="radio" name="regionalOrientation" checked value="0">中国</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="area_checkbox_ctrl_show">
											<input type="radio" name="regionalOrientation" value="1">按地域选择</label>
										&nbsp;&nbsp;&nbsp;
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
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>人口属性</span>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="person2_checkbox_ctrl_hide">
											<input type="radio" name="peopleOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="person2_checkbox_ctrl_show">
											<input type="radio" name="peopleOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item" id="person2_checkbox_box">
									<p class="blue">性别：</p> 
										<label class="dib"><input type="checkbox" name="Orient" value="b">男性</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="g">女性</label>
									<div>
									<p class="blue mt10">年龄：</p> 
										<label class="dib"><input class="quanbu" type="checkbox" name="Orient" value="0">全部</label>
										<label class="dib"><input type="checkbox" name="Orient" value="1">0-17</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="2">18-24</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="3">25-30</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="4">31-35</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="5">36-40岁</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="6">41-50岁</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="7">51-60</label>
										<label class="dib"><input type="checkbox" name="Orient" value="8">61-100</label>
										</div>
										<div class="mt15">
											<label class="dib"><input class="zdyBtn" type="checkbox" name="Orient" value="9">自定义</label>
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
										<label class="dib"><input type="checkbox" name="Orient" value="10">本科及以上</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="12">大专</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="13">高中</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="14">初中</label> 
										<label class="dib"><input type="checkbox" name="Orient" value="15">小学及以下</label>
								</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>运营商定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="operator_checkbox_ctr1_hide">
											<input type="radio" name="operatorOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="operator_checkbox_ctr2_show">
											<input type="radio" name="operatorOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item" id="operator_checkbox_box" >
										<label class="dib">
												<input type="checkbox" name="operace" value="1">移动</label>
										<label class="dib">
												<input type="checkbox" name="operace" value="2">联通</label>
										<label class="dib">
												<input type="checkbox" name="operace" value="3">电信</label>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>设备定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="device_checkbox_ctr1_hide">
											<input type="radio" name="deviceOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="device_checkbox_ctr2_show">
											<input type="radio" name="deviceOrientation" value="1">自定义</label>
										&nbsp;&nbsp;&nbsp;
									</li>
									<li class="list-group-item" id="device_checkbox_box" >
										<label class="dib">
												<input type="checkbox" name="device" value="1">苹果</label>
										<label class="dib">
												<input type="checkbox" name="device" value="2">小米</label>
										<label class="dib">
												<input type="checkbox" name="device" value="3">三星</label>
										<label class="dib">
												<input type="checkbox" name="device" value="4">华为</label>
										<label class="dib">
												<input type="checkbox" name="device" value="5">vivo</label>
										<label class="dib">
												<input type="checkbox" name="device" value="6">OPPO</label>
										<label class="dib">
												<input type="checkbox" name="device" value="7">魅族</label>
										<label class="dib">
												<input type="checkbox" name="device" value="8">联想</label>
										<label class="dib">
												<input type="checkbox" name="device" value="9">其他</label>
									</li>
								</ul>
								<ul class="list-group">
									<li class="list-group-item bg-gray">
										<span>终端定向</span>&nbsp;&nbsp;&nbsp;
										<label class="dib" id="terminal_checkbox_ctr1_hide">
											<input type="radio" name="terminalOrientation" value="0" checked>不限</label>
										&nbsp;&nbsp;&nbsp;
										<label class="dib" id="terminal_checkbox_ctr2_show">
											<input type="radio" name="terminalOrientation" value="1">自定义</label>
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
						<div class="list-group-item adseries-add-head-box">
							<span class="glyphicon glyphicon-share-alt green"></span>
							<b>出价设置</b>
						</div>
						<div class="list-group-item adseries-add-body-box">
							<ul class="list-group">
								<li>
									<p class="dib">付费模式：</p>
									&nbsp&nbsp&nbsp&nbsp&nbsp
									<label class="dib" style="width:45px;">
										<input type="radio" name="chargeMode" value="CPC" >CPC</label>
									&nbsp&nbsp&nbsp
									<label class="dib" style="width:45px;">
										<input type="radio" name="chargeMode" value="CPM" >CPM</label>
									&nbsp&nbsp&nbsp
									<label class="dib" style="width:45px;">
										<input type="radio" name="chargeMode" value="CPD" >CPD</label>
									&nbsp&nbsp&nbsp
									<label class="dib" style="width:45px;">
										<input type="radio" name="chargeMode" value="CPT" >CPT</label>
								</li>
								<li>
									<span>
										出价：&nbsp
										<input name="price" id="price" style="width:80px;height:25px; margin-top:6px;" type="text" onkeyup="checkNum(this)" ></span>&nbsp 元
								</li>
							</ul>
						</div>
						<div class="tc mt20">
							<button type="submit" class="btn-green" id="submit">
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

</body>
</html>
