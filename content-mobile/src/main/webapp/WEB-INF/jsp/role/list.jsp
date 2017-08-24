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
            <li class="active"><a>角色信息管理</a></li>
        </ul>
        <div class="tab-content" id="tabContent">
			<div data-role="userGrid">
			  <div class="table-responsive">
			    <table class="table table-responsive grid">
			      <thead>
			        <tr>
			          <th>
						<div class="btn-group buttons">
							<a class="btn btn-primary" href="role/toAdd.html"><span class="glyphicon glyphicon-plus"><span>添加</span></span></a>
							<a class="btn btn-default" href="role/list.html"><span class="glyphicon glyphicon-align-justify"><span>列表</span></span></a>
						</div>
			          </th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td>
			            <div class="colResizePointer"></div>
			            <div class="grid-body">
			              <div class="grid-table-body" style="min-height: 100px; position: relative;width:400px;">
			                <table class="table table-responsive table-bordered table-hover table-striped">
			                  	<thead>
			                    <tr>
			                      <%--<th width="5%"><input type="checkbox" name="check_all" id="check_all" class="input-medium form-control"></th>--%>
			                      <th width="5%"  style="text-align: center;">序号</th>
			                      <th width="15%"  style="text-align: center;">角色名称</th>
			                      <%--<th width="8%">权限描述</th>--%>
			                      <%--<th width="60%">所属菜单</th>--%>
			                      <%--<th width="10%">创建时间</th>--%>
			                      <th width="20%"  style="text-align: center;">操作</th>
			                    </tr>
								</thead>
								<tbody>
			                    <c:forEach items="${pu.list}" var="role" varStatus="st">
				                    <tr>
				                      <%--<td align="center"><input type="checkbox" name=""></td>--%>
				                      <td align="center">${st.count}</td>
				                      <td align="center">${role.roleName}</td>
				                      <%--<td align="center">${role.description}</td>--%>
				                      <%--<td align="center">${role.menuNames}</td>--%>
				                      <%--<td align="center">${role.createTime}</td>--%>
				                      <td align="center">
				                      	<c:choose>
				                      		<c:when test="${role.id==1}">
				                      			<a class="btn btn-success btn-xs">
										   			<span class="glyphicon glyphicon-edit"><span>修改</span></span>
												</a>
												<a class="btn btn-danger btn-xs" type="button">
										   			<span class="glyphicon glyphicon-remove"><span>删除</span></span>
												</a>
				                      		</c:when>
				                      		<c:otherwise>
				                      			<a href="role/toEdit.html?roleId=${role.id}" class="btn btn-success btn-xs">
										   			<span class="glyphicon glyphicon-edit"><span>修改</span></span>
												</a>
												<a onclick="deleteRoleById(${role.id})" class="btn btn-danger btn-xs" type="button">
										   			<span class="glyphicon glyphicon-remove"><span>删除</span></span>
												</a>
				                      		</c:otherwise>
				                      	</c:choose>
										
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
								<jsp:param name="urlStr" value="role/list.html"/>
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
</body>
	
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
		function deleteRoleById(roleId){
			if(confirm("删除请确认")){
				window.location.href="role/delete.html?roleId="+roleId;
			}
		}
	</script>
</html>