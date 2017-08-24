<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String urlStr = request.getParameter("urlStr");
//urlStr+= (urlStr.indexOf("?")<=-1)?"?":"&";
request.setAttribute("urlStr", urlStr);
%>
<style type="text/css">
/*翻页*/
.pagebar{text-align:center;margin:22px auto;width:900px;line-height:22px;font-size:14px;vertical-align:middle;}
.pagebar a{display:inline-block;color:#428bca;padding:2px;border:1px solid #428bca;padding:5px;line-height:14px;text-decoration:none;text-align:center;}
.pagebar a:hover{color:#428bca;background:#e0e0e0;border:1px solid #428bca;}
.pagebar .page-cur{color:#FFF;background:#428bca;border:1px solid #428bca;padding:5px;line-height:14px;}
.pagebar .page-input{margin:0px 5px;border:1px solid #999;width:24px;text-align:center;font-size:14px;line-height:14px;height:14px;font-size:14px;padding:5px;border-radius:0px;}
.pagebar .page-select{margin:0px 5px;border:1px solid #999;width:65px;text-align:center;font-size:14px;line-height:14px;height:26px;font-size:14px;border-radius:0px;vertical-align:middle;}
.pagebar .page-button{margin:0px 5px;border:1px solid #999;width:30px;text-align:center;font-size:14px;line-height:14px;height:26px;font-size:14px;padding:5px;}
</style>
<script>
	function isNum(obj){
		if(!(obj.value>=0)){
			obj.value=1;
		}
	}
	function turnPage(current){
       $("#current").val(current);
       document.getElementById("pageForm").submit();
    }
</script>
<form method="post" action="${urlStr}" class="form-table1" id="pageForm" name="pageForm">
	<input type="hidden" name="pageCount" value="${pu.pageCount}"/>
	<a href="javascript:turnPage(${pu.first})">首页</a>
  	<c:forEach  var="i" begin="${pu.startPage}" end="${pu.endPage}">
  		<c:choose>
  			<c:when test="${i==pu.current}"><a href="javascript:void(0)" class="page-cur">${i}</a></c:when>
  			<c:otherwise>
  				<a href="javascript:turnPage(${i})">${i}</a>
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
  	<a href="javascript:turnPage(${pu.pageCount })">尾页</a>
  	共${pu.pageCount }页&nbsp;&nbsp;第
  	<input name="current" size="2" onblur="isNum(this);" id="current" value="${pu.current}"/>&nbsp;页
  	每页
  	<select name="rowSize"  class="page-select" onchange="document.all.pageForm.submit();">
  		<option value=10 <c:if test="${pu.rowSize==10 }">selected</c:if> >10</option>
  		<option value=20 <c:if test="${pu.rowSize==20 }">selected</c:if> >20</option>
  		<option value=50 <c:if test="${pu.rowSize==50 }">selected</c:if> >50</option>
  		<option value=100 <c:if test="${pu.rowSize==100 }">selected</c:if> >100</option>
  		<option value=200 <c:if test="${pu.rowSize==200 }">selected</c:if> >200</option>
  	</select>条记录
	<input type="submit" value="go" class="page-button">
	<c:forEach items="${paraMap}" var="map">
       <input type="hidden" name="${map.key}" value="${map.value}"/>
    </c:forEach>
</form>
    	