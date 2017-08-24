<%@include file="/WEB-INF/commons/include.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>角色</title>
	<script type="text/javascript">
	</script>
	<script src="resources/plugin/jquery-1.11.0.min.js"></script>
	<script src="resources/plugin/bootstrap.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/DimensionSetting.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>
<body>
    <div class="g-mainc" style="min-height: 400px;">
        <ul class="nav nav-tabs" id="navTabs">
            <li class="active"><a>用户信息管理</a></li>
        </ul>
        <div class="tab-content" id="tabContent">
			<div data-role="userGrid">
			  <div class="table-responsive">
			    <table class="table table-responsive table-bordered grid">
			      <thead>
			        <tr>
			          <th>
						<div class="btn-group buttons">
							<a class="btn btn-primary" href="user/toadduser.html"><span class="glyphicon glyphicon-plus"><span>添加</span></span></a>
							<a class="btn btn-default" href="user/getalluser.html"><span class="glyphicon glyphicon-align-justify"><span>列表</span></span></a>
						</div>
			            <%--<div class="search">--%>
			              <%--<div class="input-group" style="width:300px;">--%>
			                <%--<input type="text" class="input-medium form-control" placeholder="搜索用户" data-role="searchValue">--%>
			                <%--<div class="input-group-btn">--%>
			                  <%--<button type="button" class="btn btn-default" data-role="searchBtn">--%>
			                     <%--<span class="glyphicon glyphicon-search"></span>--%>
			                  <%--</button>--%>
			                <%--</div>--%>
			              <%--</div>--%>
			            <%--</div>--%>
			          </th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td>
			            <div class="colResizePointer"></div>
			            <div class="grid-body">
			              <div class="grid-table-body" style="min-height: 100px; position: relative;width:500px;">
			                <table class="table table-responsive table-bordered table-hover table-striped">
			                  <tbody>
			                    <tr>
			                      <th align="center" width="150">用户名</th>
			                      <th align="center" width="200">创建时间</th>
			                      <th align="center" width="185">操作</th>
			                    </tr>
			                    <c:forEach items="${pu.list}" var="u" varStatus="st">
				                    <tr>
				                      <td align="center">${u.username}</td>
				                      <td align="center">${u.createTime}</td>
				                      <td align="left">
										<a href="user/toupuser.html?userId=${u.id}" class="btn btn-success btn-xs">
										   <span class="glyphicon glyphicon-edit"><span>修改</span></span>
										</a>
										<a href="user/deluser.html?userId=${u.id}" class="btn btn-danger btn-xs" type="button">
										   <span class="glyphicon glyphicon-remove"><span>删除</span></span>
										</a>
									  </td>
				                    </tr>
			                    </c:forEach>
			                  </tbody>
			                </table>
			              </div>
			            </div>
			          </td>
			        </tr>
			      </tbody>
					<tfoot>
			        <tr>
			          <td>
			          	 <div class="pagebar">
						     <jsp:include page="/WEB-INF/jsp/util/pageUtil.jsp">
								<jsp:param name="urlStr" value="user/getalluser.html"/>
							 </jsp:include>
						 </div>
			           </td>
			        </tr>
			      </tfoot>
			    </table>
				<br/>
				<br/>
			  </div>
			</div>
			
		</div>
    </div>

	
	<script type="text/javascript">
		$(function(){
			//选择所有
		    $("#check_all").click(function(){
				var a=$(this)[0].checked;
				var inputs = document.getElementsByTagName("input");
				for(var i=0; i< inputs.length; i++){
					if(inputs[i].type == "checkbox"){
						inputs[i].checked = a; 
					}
				}
		    });
		});
	</script>
</body>
</html>