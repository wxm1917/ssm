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
<title>登录</title>
<script type="text/javascript">
	
</script>
<script src="plugin/jquery-1.11.0.min.js"></script>
<script src="plugin/bootstrap.js"></script>
<script src="js/common.js"></script>
<link rel="stylesheet" type="text/css" href="plugin/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<!-- 时间插件 -->
<link rel="stylesheet" href="plugin/bootstrap-combined.min.css">
<link rel="stylesheet" href="plugin/bootstrap-datetimepicker.min.css"type="text/css" media="screen">
<script src="plugin/bootstrap-datetimepicker.min.js"></script>
	<script>
		
		
	</script>
</head>
<body style="font-family:'微软雅黑';">

	<!-- 导航,end -->
	<!-- 正文 -->
	<form method="post" action="user/updateUser.html" onsubmit="return checkData()">
		<input type="hidden" name="id" value="${userEntity.id}">
		<div class="right-title">
			当前位置：<span class="blue">客户管理</span> &gt; 查看
		</div>
		<div class="right-box">
			<div class="list-group">
				<div class="list-group-item adgroup-add-head-box">基本信息</div>
				<div class="list-group-item adgroup-add-body-box" align="center">
					<span class="red"></span>客户名称：<input type="text" name="username" id="username" class="form-control" readonly value="${userEntity.username}"><br/>
					<span class="red"></span>客户密码：<input type="password" name="password" id="password" readonly class="form-control " value="${userEntity.password}"><br/>
					<span class="red"></span>客户主页：<input type="text" name="indexUrl" id="indexUrl" readonly class="form-control" value="${userEntity.indexUrl}"><br/>
					<span class="red"></span>客户电话：<input type="text" name="phone" id="phone" readonly class="form-control" value="${userEntity.phone}"><br/>
					<span class="red"></span>客户    QQ：<input type="text" name="qq" id="qq"  readonly class="form-control" value="${userEntity.qq}"><br/>
					<span class="red">*</span>充值金额：<input type="text" name="residualMoney"  readonly id="residualMoney" class="form-control" value="${userEntity.residualMoney}">元
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
