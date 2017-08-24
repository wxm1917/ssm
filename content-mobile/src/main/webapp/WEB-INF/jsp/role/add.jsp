<%@include file="/WEB-INF/commons/include.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>更新角色</title>
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
               <a>角色管理 &gt; 新增
               </a>
            </li>
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
			            <div class="grid-body" style="width: 1053px;">
			              <div class="" style="height: 474.0241935483871px; position: relative;">
			                <form action="role/save.html" onsubmit="return checkData()" method="post" name="myform" >
				                <table class="table-detail">
				                    <tr>
										<th>角色名称</th>
										<td>
											<input type="text" name="roleName" id="roleName" class="form-control"><span style="color:red" id="checkRoleName">*</span>
										</td>
				                    </tr>
				                    <%--<tr>--%>
										<%--<th>角色权限描述:</th>--%>
										<%--<td>--%>
											<%--<input type="text" name="description" id="description" class="form-control"/>--%>
										<%--</td>--%>
									<%--</tr>--%>
				                    <tr>
				                    	<th>菜单选择</th>
				                    	<td>
				                    		<c:forEach items="${menuList}" var="menu" varStatus="st">
				                    			<div class="title"><input type="checkbox" value="${menu.id}" id="m${menu.id}" onclick="checkMenus(this)" name="name1" class="pMenu" /><strong>&nbsp;&nbsp;${menu.menuName}</strong></div>
				                    			<c:forEach items="${menu.menuList}" var="m" varStatus="vs">
				                    				<c:if test="${vs.count>1&&m.id!=null}"><br/></c:if>
													<span style="margin-left:30px"></span><input type="checkbox" value="${m.id}" id="m${m.id}"  title="${menu.id}" onclick="checkMenu(this)" name="name2" class="cMenu" />&nbsp;&nbsp;${m.menuName}
												</c:forEach>
				                    		</c:forEach>
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
								<input type="hidden" value="" name="menuIdList" id="menuIdList"/>
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
		function checkMenus(obj){
		   	var inputs = document.getElementsByTagName("input");
			var flag=obj.checked;
			for(var i=0; i< inputs.length; i++){
				if(inputs[i].type == "checkbox"){
					if(inputs[i].title==obj.value){
						inputs[i].checked = flag; 
					}
				}
			} 
		}
		function checkMenu(obj){
		   	if(obj.checked){
                 document.getElementById("m"+obj.title).checked=true;
            }else {
              	var inputs = document.getElementsByTagName("input");
                var flag=false;
               	for(var i=0; i< inputs.length; i++){
					if(inputs[i].type == "checkbox"){
						if(inputs[i].title==obj.title){
							if(inputs[i].checked==true){
								flag=true;
							}
						}
					}
				}
				if(!flag){
					document.getElementById("m"+obj.title).checked=false;
				} 
            }
		}
		function checkData(){
		   	$("#checkRoleName").html("");
		   	var roleName=$("#roleName").val();
		   	if(roleName==""){
		   		$("#checkRoleName").html("角色名称不能为空");
		   		return false;
		   	}
		   	var inputs = document.getElementsByTagName("input");
		   	var result = "";
		   	for(var i=0; i< inputs.length; i++){
				if(inputs[i].type == "checkbox"){
					if(inputs[i].checked==true){
						if(result==""){
							result=inputs[i].value;
						}else{
							result=result+","+inputs[i].value;
						}
					}
				}
			}
			$("#menuIdList").val(result);
		   	return true;
		}
	</script>
</body>
</html>