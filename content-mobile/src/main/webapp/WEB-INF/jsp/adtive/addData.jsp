<%@include file="/WEB-INF/commons/include.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>数据导入</title>
	<script type="text/javascript">
	</script>
	<script src="resources/plugin/jquery-1.11.0.min.js"></script>
	<script src="resources/plugin/bootstrap.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/DimensionSetting.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/plugin/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/css.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
	<script>
	
		function showcostValue(obj){ //消费
			
			var ck =  $("#cktext").val();
			if(ck != 0){
				$("#cpcCharge").val(Math.round(obj/ck*100)/100);
			}
			var adv =  $("#advtext").val();
			if(adv != 0){
				var value = obj/adv*1000;
				$("#cpmCharge").val(Math.round(value*100)/100);
			}	
		}
		function showckValue(obj){ //点击
			/* if(obj!=""){
				var cpmsum = $("#costtext").val();
				//var value=cpmsum/obj).substring(0,s.indexOf(".") + 3);
				var value = cpmsum/obj*100;
				$("#cpcCharge").val(Math.round(value)/100);
			} */
			var cost =  $("#costtext").val();
			if(cost !=""){
				$("#cpcCharge").val(Math.round(cost/obj*100)/100);
			}else{
				return false;
			}
		}
		function showadvValue(obj){	//展现
			var cost =  $("#costtext").val();
			if(cost !=""){
				var value = cost/obj*1000;
				$("#cpmCharge").val(Math.round(value*100)/100);
			}else{
				return false;
			}
		}
/* 		function showcpmValue(obj){
			if(obj!=""){
				var cpm = $("#cpmCharge").val();
				$("#costtext").val(obj*cpm/1000);
				var cpmsum = $("#costtext").val();
				//var value=cpmsum/obj).substring(0,s.indexOf(".") + 3);
				var value = cpmsum/obj*100;
				$("#cpcCharge").val(Math.round(value)/100);
			}
		} */
	
	</script>
</head>
<body>
	
    <div class="g-mainc" style="min-height: 400px;">
        <ul class="nav nav-tabs" id="navTabs">
            <li class="active">
               <a>数据导入
               </a>
            </li>
        </ul>
        <div class="tab-content" id="tabContent">
			<div data-role="userGrid">
			  <div class="table-responsive">
			    <table class="table table-responsive table-bordered grid">
			      <tbody>
			        <tr>
			          <td>
			            <div class="colResizePointer"></div>
			            <div class="grid-body" style="width: 1053px;">
			              <div class="" style="height: 474.0241935483871px; position: relative;">
			                <form action="advertiseData/save.html" method="post" name="myform" >
				                <table class="table-detail">
				                	<tr>
										<th>日期</th>
										<td>
											<input type="date" name="cTime" class="form-control" value="${cTime}" >
										</td>
				                	</tr>
				                    <tr>
										<th>消费</th>
										<td>
										  <input type="number" name="cost" class="form-control" value="0"  id="costtext" oninput="showcostValue(this.value)">
										</td>
				                    </tr>
				                    <tr>
										<th>展现</th>
										<td>
										  <input type="number" name="adv"  value="0" class="form-control" id="advtext" oninput="showadvValue(this.value)" >
										</td>
				                    </tr>
									<tr>
										<th>点击</th>
										<td>
											<input type="number" name="ck" value="0" class="form-control" id= "cktext" oninput="showckValue(this.value)" >
										</td>
									</tr>
									<tr>
										<th>展示费用/千次</th>
										<td>
											<input type="number" name="cpmCharge" class="form-control" value="0"  readonly="readonly" id="cpmCharge" oninput="showcpmValue(this.value)">
										</td>
									</tr>
									<tr>
										<th>点击费用</th>
										<td>
											<input type="text" name="cpcCharge"  class="form-control" value="0" readonly="readonly"  id="cpcCharge" oninput="showcpcValue(this.value)">
										</td>
									</tr>
				                    <tr>
										<th></th>
										<td class="tc">
											<input type="hidden" name="creativeId" value="${user.id}"/>
										<input type="submit" class="btn btn-primary" value="提 交 ">
										<input type="reset" class="btn btn-default" value="重置" >
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