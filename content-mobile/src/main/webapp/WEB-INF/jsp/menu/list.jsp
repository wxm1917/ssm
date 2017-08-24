<%@include file="/WEB-INF/commons/include.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>菜单列表</title>
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
	
    <div class="g-mainc" style="min-height: 600px;">
        <ul class="nav nav-tabs" id="navTabs">
            <li class="active"><a>菜单信息管理</a></li>
        </ul>
        <div class="tab-content" id="tabContent">
			<div data-role="userGrid">
			  <div class="table-responsive">
			    <table class="table table-responsive table-bordered grid">
			      <thead>
			        <tr>
			          <th>
						<div class="btn-group buttons">
							<a class="btn btn-primary" href="menu/toAdd.html"><span class="glyphicon glyphicon-plus"><span>添加</span></span></a>
							<a class="btn btn-default" href="menu/list.html"><span class="glyphicon glyphicon-align-justify"><span>列表</span></span></a>
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
			              <div class="grid-table-body" style="min-height: 100px; position: relative;">
			                <table class="table table-responsive table-bordered table-hover table-striped">
			                  <tbody>
			                    <tr>
			                      <th width="52">
			                      	<div class="btn-group buttons">
										<a class="btn btn-primary"><span class="glyphicon glyphicon-align-justify"></span></a>
									</div>
			                      </th>
			                      <th width="60">序号</th>
			                      <th width="100">菜单级别</th>
			                      <th>菜单名称</th>
			                      <th>链接地址</th>
			                      <th>创建时间</th>
			                      <th width="150">操作</th>
			                    </tr>
			                    <c:forEach items="${menuList}" var="menu" varStatus="st">
				                    <tr>
				                      <td align="center">
			                      		<div class="btn-group buttons">
											<a class="btn btn-default" onclick="showChildMenu(${menu.id})"><span class="glyphicon glyphicon-plus" id="fold${menu.id}"></span></a>
										</div>
				                      </td>
				                      <td align="center">【${menu.orderNum}】</td>
				                      <td align="left"> 一级菜单 </td>
				                      <td align="center">${menu.menuName}</td>
				                      <td align="center">&nbsp;<input type="hidden" id="childIds${menu.id}" value='<c:forEach items="${menu.model}" var="cMenu" varStatus="vs"><c:choose><c:when test="${fn:length(menu.model)==vs.count}">${cMenu.id}</c:when><c:otherwise>${cMenu.id},</c:otherwise></c:choose></c:forEach>'/></td>
				                      <td align="center">${menu.createTime}</td>
				                      <td align="center">
										<a href="menu/toEdit.html?menuId=${menu.id}" class="btn btn-success btn-xs">
										   <span class="glyphicon glyphicon-edit"><span>修改</span></span>
										</a>
										<a onclick="deleteMenuById(${menu.id})" class="btn btn-danger btn-xs" type="button">
										   <span class="glyphicon glyphicon-remove"><span>删除</span></span>
										</a>
									  </td>
				                    </tr>
				                    <c:forEach items="${menu.model}" var="m" varStatus="vs">
				                    	<tr style="display:none" id="childMenu${m.id}">
				                      		<td align="center">&nbsp;</td>
				                      		<td align="center">${m.orderNum}</td>
				                      		<td align="right">二级菜单</td>
				                      		<td align="center">${m.menuName}</td>
				                      		<td align="center">${m.menuUrl}</td>
				                      		<td align="center">${m.createTime}</td>
				                      		<td align="center">
												<a href="menu/toEdit.html?menuId=${m.id}" class="btn btn-success btn-xs">
										   			<span class="glyphicon glyphicon-edit"><span>修改</span></span>
												</a>
												<a onclick="deleteMenuById(${m.id})" class="btn btn-danger btn-xs" type="button">
										   			<span class="glyphicon glyphicon-remove"><span>删除</span></span>
												</a>
									 		</td>
				                   		 </tr>
				                    </c:forEach>
			                    </c:forEach>
			                  </tbody>
			                </table>
			              </div>
			            </div>
			          </td>
			        </tr>
			      </tbody>
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
		function deleteMenuById(menuId){
			if(confirm("删除请确认")){
				window.location.href="menu/delete.html?menuId="+menuId;
			}
		}
		function showChildMenu(menuId){
			var childIds = $("#childIds"+menuId).val();
			if(childIds!=""&&childIds!=null){
				var ids  =childIds.split(",");
				for(var i=0;i<ids.length;i++){
					var tr = document.getElementById("childMenu"+ids[i]);
					if(tr.style.display=="none"){
						$("#fold"+menuId).attr("class","glyphicon glyphicon-minus");
						$("#childMenu"+ids[i]).show();
					}else{
						$("#fold"+menuId).attr("class","glyphicon glyphicon-plus");
						$("#childMenu"+ids[i]).hide();
					}
				}
			}
		}
	</script>
		
</body>
</html>