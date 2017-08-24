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
            <li class="active">
               <a>资源类型管理 &gt; 
                 <c:if test="${type eq 'add'}">新增</c:if>
                 <c:if test="${type eq 'update'}">修改</c:if>
               </a>
            </li>
        </ul>
        <div class="tab-content" id="tabContent">
			<div data-role="userGrid">
			  <div class="table-responsive">
			    <table class="table table-responsive table-bordered grid">
			      <thead>
			        <tr>
			          <th>
						<div class="btn-group buttons">
							<a class="btn btn-primary" href="manage/user/toadduser.html"><span class="glyphicon glyphicon-plus"><span>添加</span></span></a>
							<a class="btn btn-default" href="manage/user/getalluser.html"><span class="glyphicon glyphicon-align-justify"><span>列表</span></span></a>
						</div>
			           </th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td>
			            <div class="colResizePointer"></div>
			            <div class="grid-body" style="width: 1053px;">
			              <div class="" style="height: 474.0241935483871px; position: relative;">
			                <form action="user/saveuser.html" method="post" name="myform" >
			                    <input type="hidden" value="${oneuser.id}" name="id">
			                    <input type="hidden" value="${type}" name="type">
				                <table class="table-detail">
				                    <tr>
										<th>用户名</th>
										<td>
										  <c:if test="${type eq 'add'}">
											  <input type="text" name="username" class="form-control" value="${oneuser.username}">
                                             </c:if>
              								  <c:if test="${type eq 'update'}">
											  <input type="text" name="username" class="form-control" value="${oneuser.username}" readonly="readonly">
										  </c:if>
										</td>
				                    </tr>
				                    <tr>
										<th>密码</th>
										<td><input type="text" name="password" class="form-control"></td>
				                    </tr>
				                    <tr>
				                    	<th>角色选择</th>
				                    	<td>
				                    		<select class="form-control" style="width: 200px;" name="role">
				                    			<c:forEach items="${roleList}" var="role">
				                    				<option value="${role.id}" <c:if test="${role.id==oneuser.role}">selected</c:if>>${role.roleName}</option>
				                    			</c:forEach>
				                    		</select>
				                    	</td>
				                    </tr>

				                    <tr>
										<th></th>
										<td class="tc">
										<input type="submit" class="btn btn-primary" value=" 提 交 ">
										<input type="button" class="btn btn-default" value="返回" onclick="history.back();">
										</td>
				                    </tr>
								</table>
			                </form>
			              </div>
			            </div>
			          </td>
			        </tr>
			      </tbody>
			    </table>
			  </div>
			</div>
		</div>
    </div>
	
</body>
</html>