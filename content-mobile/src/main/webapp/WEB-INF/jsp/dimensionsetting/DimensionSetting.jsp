<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>  
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
        <title>维度设置</title>
		<script type="text/javascript">
		</script>
		<script src="resources/plugin/jquery-1.11.0.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<script src="resources/js/DimensionSetting.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
		<script type="text/javascript">
		var arrayid = new Array();
		var arraymenu = new Array();
		
		function toclear(obj){
			arrayid.splice(0,arrayid.length);
			arraymenu.splice(0,arraymenu.length);
		} 
		function delclick(obj){
			arrayid.push(obj);
			return 	arrayid;
		}
		function addclick(count){
			var mutxt = $("#text"+count).val();
			arraymenu.push(mutxt);
			return arraymenu;
		}
		function delelte(obj){
				if(confirm("是否确认删除!")){
					$.ajax({
						type:"post",
						url:"deletemenurole",
						data:{ id : obj},
						success:function(abc){
							alert(" 操作成功！");
							}
					});
				}else{
					$(".dime_con .panel-heading .delete").click(function(){
						$(this).parents(".pane").show();
					});
				}
			}
		function  subclick(count){
			var model ={
				menuids:this.JSON.stringify(arrayid),
				menus:this.JSON.stringify(arraymenu),
				parentid:$("#parentid"+count).val() 
			}
			$.ajax({
				type:"post",
					url:"updatemenu",
					data:model,
					success:function(data){
						alert(" 操作成功！");
						arrayid.splice(0,arrayid.length);
						arraymenu.splice(0,arraymenu.length);
					}
			}); 
		}
		
		$(function(){
			$("body").on("click",".sub",function(){
				var mename = $(this).parent().parent().find(".weiduName1").text();
				if(mename!="请输入维度名" && mename.replace(/^\s+|\s+$/g, '') !=''){
					$(this).parent().find(".sec_name span").each(function(i){
						var sec_mename =$(this).text();
						arraymenu.push(sec_mename);
						console.log(arraymenu);
						return arraymenu;
					})
					$.ajax({
							type:"post",
							url:"addmenu.html",
							data:{ menuname : mename,
									menus:JSON.stringify(arraymenu)
								},
							success:function(abc){
								alert(abc);
								arraymenu.splice(0,arraymenu.length);
							}
					})
				}else{
					alert("维度名不能为空");
					return false;
				}	
			})		
		})
		</script>
 	</head>
	<body>
	<!-- 正文 -->
		<div class="line-title">
			<span class="glyphicon glyphicon-cog"></span>投放策略设置
			<span class="editWd">
			<a href="javascript:;" class="delete">删除</a>
			|
			<a href="javascript:;" class="add">新增</a>
		</span>
		</div> 
		
		<div class="right-box dime_con"  >
			
			<c:forEach items="${menuslist}" var="m"  varStatus="s">
			<input type="hidden" id="parentid${s.index }" value="${m.id }"/>
			<div class= "pane">
				<div class="panel-heading" style="background:#f5f5f5; border:solid 1px #dddddd; border-radius:5px">${m.menuName}
					<a href="javascript:;" class="operation" onclick="toclear(this)">编辑</a>
					<a href="javascript:;" class="delete"  onclick="delelte(${m.id })">删除</a>
				</div>
				
					<c:choose>
					<c:when test="${m.menuName=='人口属性'}">
						<div class="pane1_content edit">
							<c:forEach items="${m.model}" var="m">
							<div id="div">
							<b><span style="width:100%;">${m.menuName}：<a href="javascript:;" class="glyphicon glyphicon-remove"></a></span></b>
							<p>
								<c:forEach items="${m.model}" var="m">
									<span>${m.menuName}<a href="javascript:;" class="glyphicon glyphicon-remove" ></a></span>
								</c:forEach> 
							</div> 
							</c:forEach> 
							<button class="add_btn">+新增</button>
							<form action="" class="add">
								<input type="text" value="请输入" class="txt" >
								<input type="button" value="确定" class="preservation" >
								<a href="javascript:;" class="glyphicon glyphicon-remove"></a>
							</form>
							<button class="sub" >保存</button>
						</div>
					</c:when>
					
					<c:when test="${m.menuName!='人口属性'}">
						<div class="pane1_content edit">
							<div id="div">
							<c:forEach items="${m.model}" var="m">
								<span>${m.menuName}<a href="javascript:;" class="glyphicon glyphicon-remove" onclick="delclick(${m.id})"></a></span>
							</c:forEach> 
							</div> 
							<button class="add_btn">+新增</button>
							<form action="" class="add">
								<input type="text" value="请输入" class="txt"  id="text${s.index}" >
								<input type="button" value="确定" class="preservation" onclick="addclick(${s.index })">
								<a href="javascript:;" class="glyphicon glyphicon-remove"></a>
							</form>
							<button class="sub" onclick="subclick(${s.index})">保存</button>
						</div>
						</c:when>
					</c:choose>
			</div>
			</c:forEach>
			<button class="preservationAll" id = "sver">保存</button>
		</div>
	<!-- 正文,end -->

	</body>
</html>
