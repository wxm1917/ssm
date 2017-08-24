<%@include file="/WEB-INF/commons/include.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加菜单</title>
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
               <a>菜单类型管理 &gt; 新增
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
							<a class="btn btn-primary" href="menu/toAdd.html"><span class="glyphicon glyphicon-plus"><span>添加</span></span></a>
							<a class="btn btn-default" href="menu/list.html"><span class="glyphicon glyphicon-align-justify"><span>列表</span></span></a>
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
			                <form action="menu/save.html" method="post" name="myform" >
				                <table class="table-detail">
				                	<tr>
				                		<th>菜单级别</th>
				                		<td>
				                			<select class="form-control" style="width: 180px;" id="menuType" name="menuType" onchange="changeMenuGrade()">
				                				<option value="0">一级菜单</option>
				                				<option value="1">二级菜单</option>
				                			</select>
				                		</td>
				                	</tr>
				                    <tr id="parentMenu"style="display:none">
										<th>父级菜单</th>
										<td>
										   <select class="form-control" style="width: 180px;" name="parentId">
												<c:forEach items="${parentMenuList}" var="parentMenu">
													<option value="${parentMenu.id}">${parentMenu.menuName}</option>
												</c:forEach>
											</select>
										</td>
				                    </tr>
				                    <tr>
										<th>菜单名称</th>
										<td>
										  <input type="text" name="menuName" class="form-control">
										</td>
				                    </tr>
				                    <tr>
										<th>链接地址</th>
										<td>
										  <input type="text" name="menuUrl" class="form-control">
										</td>
				                    </tr>
									<tr>
										<th>排序编号</th>
										<td>
											<input type="text" name="orderNum" class="form-control">
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
	<script>
		function changeMenuGrade(){
			var value = $("#menuType").val();
			if(value==1){
				$("#parentMenu").show();
			}else{
				$("#parentMenu").hide();
			}
		}
	</script></body>
</html>