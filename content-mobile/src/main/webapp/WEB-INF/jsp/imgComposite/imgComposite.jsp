<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit" />
	<meta content="width=device-width, initial-scale=1.00, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport"/>
	<meta name="description" content="">
	<title>自媒体图片原生广告平台</title>
	<link rel="stylesheet" href="">
	<link rel="stylesheet" href="${ctx}/resources/css/semantic.min.css">
	<!--[if lt IE 9]>
	<link rel="stylesheet" href="${ctx}/resources/css/IE8.css">
	<script src="${ctx}/resources/js/html5shiv.js"></script>
	<script src="${ctx}/resources/js/respond.min.js"></script>
	<![endif]-->
	<script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>

    <script src="${ctx}/resources/js/semantic.min.js"></script>
	<script src="${ctx}/resources/js/imgComposite.js"></script>
	<script src="${ctx}/resources/js/watermark.js"></script>
	<script src="${ctx}/resources/plugin/clipboard.min.js"></script>
	<script src="${ctx}/resources/plugin/ajaxfileupload.js"></script>

	<style>
		#content{
			width:800px;
			margin:auto;
		}
		.fade_content_two{
			border: #c7c7c7 solid 1px;
			margin-top: 10px;
			margin-bottom: 20px;
			padding:5px;
		}
		.adver-img{
			width:800px;
			height:200px;
			display:none;
		}
		ul li{
			float:left;
			list-style-type: none;
			margin :10px;
			width:100px;
		}
		ul li img{
			width:100px;

		}
		#imgCompositeModal{
			width:800px;
		}
		.work_tab{
			width:700px;
			float:left;
			margin-right:5px;
		}
		.param{
			width:150px;
			float:left;
		}
		.show_tab{
			display:inline-block;
			margin:10px 0px 30px 0px;
			min-width: 600px;
		}
		table tr td{
			width:50px;
		}
		table tr td input{
			width:50px;
		}
		.text_adver_word{
			margin-left:auto;
			margin-right:auto;
			display:block;
			font-size:16px;
		}
		#wait_bg{
			display: none;
			text-align: center;
			position: absolute;
			top:0px;
			background-color: white;
			filter:alpha(opacity=50);  /*支持 IE 浏览器*/
			-moz-opacity:0.50; /*支持 FireFox 浏览器*/
			opacity:0.50;  /*支持 Chrome, Opera, Safari 等浏览器*/
			z-index: 99999;
			height: 100%;
			width:100%;
		}
		#wait_bg img{
			margin-top: 300px;
		}
	</style>
</head>
<body>
	<div id="content">
		<div class="fade_content">
			<div class="fade_content_two">
              <h2>自媒体图片原生广告平台</h2>
				<div>
					<h4>说明示例：</h4>
					<span class="text_adver_word"><p>1.请您上传图片<span style="font-size: 10px;color:darkgray;">(图片宽度大于600像素会被自动压缩)</span>，我们将自动为您匹配相关广告（如下图）</p></span>
					<span class="text_adver_word"><p>2.上传完成后您可以鼠标拖动或输入参数调整广告位置和大小,合适后下载使用</p></span>
					<img src="${ctx}/images/1.png" alt="说明" width="700px">
				</div>

				<hr style="height:3px;border:none;border-top:3px double red;" />
				<div class="inner_pc">
					<div class="upload" style="text-align: center; margin-bottom:10px;">
						<label style="cursor: pointer;border: 1px #000000 solid; width:100px;height: 30px;display: inline-block;font-size: 20px;padding-top:4px;background-color: lightgray;" for="imageUpload" >上传图片</label>
					</div>
					<div class="img" id="imgCompositeModal">
						<img  id="imgSrc" style="display: none;">


						<%--<div class="show_tab" meta-data="0">--%>
							<%--<div class="work_tab" id="setImgComposite">--%>
								<%--<div style="width:600px;height:340px;background-color: lightgray;"></div>--%>
							<%--</div>--%>
							<%--<div class="param">--%>
								<%--<table class="param_tb" style="margin:auto;">--%>
									<%--<tr>--%>
										<%--<td>X坐标:</td>--%>
										<%--<td><input type="text" class="position_x" value="0"></td>--%>
									<%--</tr>--%>
									<%--<tr>--%>
										<%--<td>Y坐标:</td>--%>
										<%--<td><input type="text" class="position_y" value="0"/></td>--%>
									<%--</tr>--%>
									<%--<tr>--%>
										<%--<td>宽度:</td>--%>
										<%--<td>--%>
											<%--<input type="text" class="wm_width"/>--%>
										<%--</td>--%>
									<%--</tr>--%>
									<%--<tr>--%>
										<%--<td>高度:</td>--%>
										<%--<td><input type="text" class="wm_height" readonly="readonly"/></td>--%>
									<%--</tr>--%>
									<%--<tr>--%>
										<%--<td>透明度:</td>--%>
										<%--<td><input type="text" class="wm_opacity" value="0.5"/></td>--%>
									<%--</tr>--%>
								<%--</table>--%>
							<%--</div>--%>
							<%--<div class="actions" style="margin-top: 10px;">--%>
								<%--<div class="ui approve teal button">下载</div>--%>
							<%--</div>--%>
						<%--</div>--%>
					</div>
				</div>
				<div class="adver-img">
					<ul>
						<li>
							<img  src="${ctx}/images/a1.png">
						</li>
						<li>
							<img  src="${ctx}/images/a2.png">
						</li>
						<li>
							<img  src="${ctx}/images/a3.png">
						</li>
						<li>
							<img  src="${ctx}/images/a4.png">
						</li>
						<li>
							<img  src="${ctx}/images/a5.png">
						</li>
						<li>
							<img  src="${ctx}/images/a6.png">
						</li>
						<li>
							<img  src="${ctx}/images/a7.png">
						</li>
						<li>
							<img  src="${ctx}/images/a8.png">
						</li>
						<li>
							<img  src="${ctx}/images/a9.png">
						</li>
						<li>
							<img  src="${ctx}/images/a10.png">
						</li>
					</ul>
				
				</div>
			</div>
		 </div>
	</div>
	<div style="display:none">
		<form enctype="multipart/form-data" id="imgForm"  method="POST">
			<input type="file" style="display:none" name="imageFile"  id="imageUpload"  accept=".jpg,.png,.gif">
		</form>
	</div>
	<div id="wait_bg">
		<img src="${ctx}/images/wait.gif" alt="">
	</div>
</body>
</html>




