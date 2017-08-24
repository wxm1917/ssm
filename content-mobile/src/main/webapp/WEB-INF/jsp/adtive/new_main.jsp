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
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
		<script>
		function interAction(){
		var key = document.getElementById("reset").value;
		  	$.ajax({
  			type:"get",
   			url:"deleteAllAttr.do",
			data:{act:key},
				}); 
		$("#main-left-box").css("display","none");		
   			}
   				
		function ss(){
			//左侧导航栏点击与内容部分交互效果开始
	
			var aDiv1=$("#mian-center").find('div');
			$("#mian-center").find('div').css("display","block");
			
			aDiv1[1].css('display','block');
			}
			
    	</script>
    	<script type="text/javascript">
  
    		function reinitIframe1(){
			    var iframe = document.getElementById("mainFrame");
			    try{
				    var bHeight = iframe.contentWindow.document.body.scrollHeight;
				    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				    var height = Math.max(bHeight, dHeight);
				    iframe.height =  height;
			    }catch (ex){}
			    var realHeight = height > 563 ? height : 563;
			    if ($("#iframeBody", window.parent.document).is("iframe")) {
			        $("#iframeBody", window.parent.document).height(realHeight);
			    }
		    }
		    
		    
		    window.setInterval("reinitIframe1()", 1);
    	
    		$(function(){
    			$(".left-line").eq(0).addClass("left-cur");
				$(".left-line").click(function(){
				
				
				document.getElementById("main-left-box").style.display="block";
				
				$(this).parent().css("display","block");
				    var value=$(this).attr("value");
				    value -= 13; 
				    if(value==0){document.getElementById("label").innerHTML="请选择人口属性";}
				    else if(value==1){document.getElementById("label").innerHTML="请选择地域信息";}
				    else if(value==2){document.getElementById("label").innerHTML="请选择运营商家";}
				    else if(value==3){document.getElementById("label").innerHTML="请选择时段选择";}
				    else if(value==4){document.getElementById("label").innerHTML="请选择行业类别";}
				    else if(value==5){document.getElementById("label").innerHTML="请选择品牌兴趣";}
				    else if(value==6){document.getElementById("label").innerHTML="请选择频道信息";}
				    else if(value==7){document.getElementById("label").innerHTML="请选择剧类影视";}
					var href = $(this).attr("href");
					$(this).addClass("left-cur").siblings().removeClass("left-cur");
					$("#inputFrame").attr("src",$(".left-line").eq(value).attr("href"));
					return false;
				});
			})
	
    	</script>
    	
    </head>
    <body>
		
		<!-- 正文 -->
		<form name="groupForm" action="" method="post">
			<input type="hidden" value="" name="id" id="id">
			<input type="hidden" value="" name="groupName" id="groupName">
		</form>
		<!-- 左侧选择栏 -->
		<div id="content main">
			<div class="main-left" id="main-left" >
				<div class="left-box">
				<c:forEach items="${menuList}" var="m">
					<a class="left-line" href="${m.menuUrl}?menuId=${m.id}"
					 value="${m.id}" target="cont-right">${m.menuName}
					 <span class="glyphicon glyphicon-chevron-right r"></span></a>
				</c:forEach>
				
			
		       
		        <button id="sub" onclick="ss()">提交</button>
		        <button id="reset" name="act" value="res" onclick="interAction()">重置</button>
		       
				</div>
			</div>
			<div class="main-center" id="mian-center">
				<div class="one"></div>
				<div class="two"></div>
				<div class="three"></div>
				<div class="four"></div>
				<div class="five"></div>
				<div class="six"></div>
				<div class="seven"></div>
				<div class="eight"></div>
			</div>
	
			<!-- 广告管理右侧内容,start --> 
		<div class="main-right">
			<div class="area">
				<h3><strong></strong>投放预算</h3>
				<div class="rmb">
					<span>¥</span><input type="text" />
				</div>
			</div>
			<div class="area">
				<h3><strong></strong>投放开始</h3>
				<div>
					<input type="text" class="year"/>年
					<input type="text" />月
					<input type="text" />日
				</div>
			</div>
			<div class="area">
				<h3><strong></strong>投放结束</h3>
				<div>
					<input type="text" class="year"/>年
					<input type="text" />月
					<input type="text" />日
				</div>
			</div>
			<div class="line">
			</div>
			<div class="area num">受众数量：<span>100000</span></div>
			<div class="area">预估转化：<span>5%</span></div>
			<div class="area">投放费用预估：</br><span class="cpm">100元/CPM</span></div>
			<button id="sub1">提交</button>
		</div>
	</div>
		<div class="main-left-box" id="main-left-box" style="display:none;">	  
			 <div style="display:block;">
			    <h4><label id="label"></label></h4>   
			    <iframe id="inputFrame"  name="cont-right"  width="100%" marginwidth="200px" 
			     marginheight="120px" scrolling="yes" frameborder="0"  src="">
			    </iframe>
			 </div>
		</div>
		<!-- 正文,end -->
	</body>
</html>
