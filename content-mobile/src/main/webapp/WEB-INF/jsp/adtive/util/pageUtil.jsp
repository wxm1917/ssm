<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
/*翻页*/
.pagebar{text-align:center;margin:22px auto;width:840px;line-height:20px;font-size:14px;vertical-align:middle;}
.pagebar a{display:inline-block;color:#428bca;padding:2px;border:1px solid #428bca;padding:5px;line-height:14px;text-decoration:none;text-align:center;}
.pagebar a:hover{color:#428bca;background:#e0e0e0;border:1px solid #428bca;}
.pagebar .page-cur{color:#FFF;background:#428bca;border:1px solid #428bca;padding:5px;line-height:14px;}
.pagebar .page-input{vertical-align:middle;margin:0px 5px;border:1px solid #999;width:34px;text-align:center;font-size:14px;line-height:24px;height:24px;font-size:14px;border-radius:0px;}
.pagebar .page-select{margin:0px 5px;border:1px solid #999;width:65px;text-align:center;font-size:14px;line-height:24px;height:24px;font-size:14px;border-radius:0px;}
.pagebar .page-button{margin:0px 5px;border:1px solid #999;width:30px;text-align:center;font-size:14px;line-height:24px;height:24px;font-size:14px;}
</style>
<script>
	function isNum(obj){
		if(!/^[1-9]\d*\d$/g.test(obj.value)){
			obj.value=1;
		}
	}
	function turnPage(current){
	  $("#current").val(current);
      $(".form-table1").submit();
    }
</script>
<%
   String url = request.getParameter("urlStr");
   request.setAttribute("urlStr", url);
 %>
    <form method="get" action="${urlStr}" class="form-table1">
		<input type="hidden" name="current" value="" id="current"/>
		<input type="hidden" name="id" value="${id}"/>
		<a href="javascript:turnPage(${pu.first})">首页</a>
    	<c:forEach  var="i" begin="${pu.startPage}" end="${pu.endPage}">
    		<c:choose>
    			<c:when test="${i==pu.current}"><a href="javascript:void(${i})" class="page-cur">${i}</a></c:when>
    			<c:otherwise>
    				<a href="javascript:turnPage(${i})">${i}</a>
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    	<a href="javascript:turnPage(${pu.pageCount })">尾页</a>
    </form>
    	