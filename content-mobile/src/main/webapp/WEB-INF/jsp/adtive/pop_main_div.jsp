<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,com.vatestar.cm.entity.Menu"%>
<!doctype html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("*******************************************");
System.out.println(basePath);
System.out.println("*******************************************");
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
		<script src="resources/plugin/jquery-1.4.4.min.js"></script>
		<script src="resources/plugin/bootstrap.js"></script>
		<script src="resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
    	<script type="text/javascript">
    	$(document).ready(function(){
				//点击左侧导航栏弹出框里的确定和取消按钮
				$(".btn1").click(function(){
					window.parent.document.getElementById("main-left-box").style.display="none";
				})
				$(".btn2").click(function(){
					window.parent.document.getElementById("main-left-box").style.display="none";
				})
				//右侧input元素获得焦点时取消蓝色边框
				$(".main-right input").focus(function(){
					$(this).css("outline","none");
				})
				//a标签获得焦点时去掉虚线
				$("a").focus(function(){
					$(this).blur();
				})
		})
	</script>
    </head>
    <body > 
    
        <form action="p1_attribution_pop.do",method=RequestMethod.post>
        
		<div>
	
		<c:forEach items="${menuList}" var="g" varStatus="status">
				<table align="center">
		<h4>${g.menuName}</h4>
		<tr>
		  <c:forEach items="${g.model}" var="m" varStatus="status1">
		   <td width="150">
		   <c:choose>
			 <c:when test="${m.createTime=='1'}">
				
				  <input type="checkbox" id="check1" name="${status.index}" checked value="${m.id}">
				  ${m.menuName}
					
			</c:when >	
			 <c:otherwise>
					<input type="checkbox" id="check1" name="${status.index}"  value="${m.id}" />
					${m.menuName}
			   
		     </c:otherwise>
		     </c:choose>
		     </td>
		    <c:if test="${(status1.count)%2==0}">
		    </tr><tr>
		</c:if> 
		</c:forEach>
		</tr>
		</table>
		<br>
		</c:forEach>

		</div>
		<input type="text" name="user_id" value="${userId}" style="display:none"/>
		<c:forEach items="${st}" var="s" varStatus="status">
			<input type="text" name="parent_id" value="${s}" style="display:none"/>
		</c:forEach>
<!-- 		<input type="text" name="gentle_parent_id" value="${ls0[0].parentId}" style="display:none"/>
		<input type="text" name="age_parent_id" value="${ls1[0].parentId}" style="display:none"/>
		<input type="text" name="degree_parent_id" value="${ls2[0].parentId}" style="display:none"/>
		<input type="text" name="income_parent_id" value="${ls3[0].parentId}" style="display:none"/> -->
		<input type="text" name="count" value="${count}" style="display:none"/> 
		<br>
		<p>
		<input type="submit" class="btn1" name="submit" value="提交" /> 
		<input type="submit" class="btn2" name="cancel" value="取消" />
		</p>
		</form>
	   
	</body>
</html>
