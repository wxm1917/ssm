$(function(){
	$(".list-group").find(".nrBox").hide();
        $(".adgroup-add-body-box").each(function(){
           var aInpu=$(this).find(".bg-gray label");
           $(aInpu).each(function(index,element){
             $(this).click(function(){
                 $(this).parents(".adgroup-add-body-box").find(".nrBox").hide();
                 $(this).parents(".adgroup-add-body-box").find(".nrBox").eq(index).slideDown();
            })
        })
    });
    $("#addBtn").click(function(){
        $("#addBox").show();
    });
    var array = new Array();
    $("#addBox .baocun").click(function(){
        var arr=[];
        $("#geshi input").each(function(index,element){
            if($(this).is(':checked')){
                arr.push($(this).val());
            }
        });
        var txt=arr.join("\\")+"格式";
        if($("#addBox .miaoshu").val()!=""&&$("#addBox .kuan").val()!=""&&$("#addBox .gao").val()!=""&&$("#geshi input:checkbox:checked").length>0){
        	$.post("media/admedialist.html",
	             	 {  mediasname : $("#addBox .miaoshu").val(),
	     	            whight : $("#addBox .kuan").val(),
	     	            hight :$("#addBox .gao").val(),
	     	            ptype : txt},
	     	     function(res){
	     	       var str='<p class="mt5 mt6" style="font-size:16px;color:#333;"><input type="hidden"  value="'+res+'"><span  style="margin-right:30px;">'+$("#addBox .miaoshu").val()+'</span><span style="margin-right:30px;">'+$("#addBox .kuan").val()+"x"+$("#addBox .gao").val()+'</span><span style="margin-right:30px;">'+txt+'</span><span class="shanchu" style="margin-right:30px;padding:5px 7px;border:solid 1px #ccc; display:inline-block;cursor:pointer;">删除</span></p>';
	     	       $(str).insertBefore($("#addBtn"));
	               $("#addBox").hide(); 
	               $("#addBox .miaoshu").val("");
	               $("#addBox .kuan").val("");
	               $("#addBox .gao").val("");
	               $("#geshi input").attr("checked",false);
	               
	               $(".mediaZy .shanchu").click(function(){
	            	   $.post("media/remedia.html",
	              			{id :$(this).parent().find("input").val()},
	              			function(res){
	              			});
	            	   $(this).parent().remove();
	              });
	     	     
	     	     }
             );
        	 
 		
        }else{
            alert("您的信息填写不完全");
        }
        
     });
    
    $("#sub").on("click",function(){ 
    	if($("#groupName").val()==""||$("#groupName").val()==null){
			alert("媒体名称不能为空");
			return false ;
		}
    	if($("input[name='file']").val()==""||$("input[name='file']").val()==null){
    		alert("请上传文件");
    		return false;
    	}else{
    		if(!/\.(jpg|png|JPG|PNG)$/.test($("input[name='file']").val())){
    			alert("图片类型必须是jpg,png中的一种")
    	        return false;
    		}
    		/*var img = new Image();
            img.src = $("input[name='file']").val();  
            if(img.width!=16||img.height!=16){}*/
    	}
    	var count = 0;
    	$("input[name='mediatype']").each(function(){
    		if($(this).is(":checked")){
   			 count++;
   		 }
    	});
    	if(count==0){
    		alert("请选择媒体类型");
    		return false;
    	}
    	var count2 = 0;
    	$("input[name='optimal']").each(function(){
    		 if($(this).is(":checked")){
    			 count2++;
    		 }
    	});
    	if(count2==0){
    		alert("请选择优化目标");
    		return false;
    	}
    	var count3 = 0;
    	$("input[name='medialabelone']").each(function(){
    		 if($(this).is(":checked")){
    			 count3++;
    		 }
    	});
    	if(count3==0){
    		alert("请选择标签");
    		return false;
    	}
    	
		var medias = new Array();
		$(".mt6").each(function(i){
			$(this).find("input").each(function(i){
				medias.push($(this).val())
			})
		});
		if(medias.length==0){
			alert("请添加媒体资源");
			return false;
		}
    	$("#mediapid").val(medias.toString());
		$("#formtable").submit();
    });
    
    
    /* ---------------------------------------------------------------------------------------------------------*/
    
    $(function(){
		$('#date1').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'en',
			pickDate : true,
			pickTime : false,
			hourStep : 1,
			minuteStep : 15,
			secondStep : 30,
			inputMask : true
		});
		$('#date2').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'en',
			pickDate : true,
			pickTime : false,
			hourStep : 1,
			minuteStep : 15,
			secondStep : 30,
			inputMask : true
		});
		$("#submit").click(function(){
			if($("#groupName").val()==""||$("#groupName").val()==null){
				alert("广告名不能为空");
				return false;
			}
			if($("#mediapid").val()==""||$("#mediapid").val()==null){
				alert("请选择广告计划");
				return false;
			}
			if($("#tourl").val()==""||$("#tourl").val()==null){
				alert("推广页面不能为空");
				return false;
			}
			if($("#adPositionId").val()==""||$("#adPositionId").val()==null){
				alert("请选择广告位");
				return false;
			}
			if($("#startTime").val()==""||$("#startTime").val()==null){
				alert("请选择开始时间");
				return false;
			}
			if($("#endTime").val()==""||$("#endTime").val()==null){
				alert("请选择结束时间");
				return false;
			}
			if($("input[name='file']").val()==""||$("input[name='file']").val()==null){
	    		alert("请上传文件");
	    		return false;
	    	}
			var settime = new Array();
			$("#settimes").find("span").each(function(){
				settime.push($(this).text());
			});
			$("settime").val(settime);
			
			var voices = new Array();
			$("#voices").find("span").each(function(i){
				voices.push($(this).text());
			});
			$("#voice").val(voices);

			var addages = new Array();
			$("#addages").find("span").each(function(i){
				addages.push($(this).text());
			});
			$("#addage").val(addages);
			
			var count = 0;
	    	$("input[name='chargeMode']").each(function(){
	    		if($(this).is(":checked")){
	   			 count++;
	   		 }
	    	});
	    	if(count==0){
	    		alert("请选择出价模式");
	    		return false;
	    	}
			if($("#price").val()==""||$("#price").val()==null){
				alert("您的出价为空");
				return false;
			}
			
			$("#formtable").submit();
		});
	});	
	function cancel(){
		window.location.href="advertiseGroupClass/list2.html";
	}
	$(function(){
		$("#mediapid").change(function(){
			$.post("advertiseGroupClass/adpositionid.html",
				{mediaid : $("#mediapid").val()},
				function(res){
					var res = JSON.parse(res);
					var melist=res.melist;
					var labellist = res.labellist;
					$("#adPositionId").empty();
					for(var i=0;i<melist.length;i++){
						$("#adPositionId").append("<option value='"+melist[i].id+"'>"+melist[i].mediasname+"</option>");
					}
					$("li.list-none .dib").hide();
					for(var j=0;j<labellist.length;j++){
						$("input[name='medialabelone']").each(function(){
							if($(this).val()== labellist[j]){
								$(this).parent().css("display","inline-block");
							}
						})
					}
				}
			);
		
		});
		
		$("#texareaAddBtn").click(function(){
			$(this).before('<textarea name="excode" id="" style="resize:none;width:350px; height:70px;"></textarea>');
		});
		$("#textareaBtn1").click(function(){
			if($("#textareaBox textarea").size()==1){
				return false;
			}else{
				$("#textareaBox textarea:last").remove();
			}
		});
		
	})
    
    function getObjectURL(file) {
	    var url = null ; 
	    if (window.createObjectURL!=undefined) { // basic
	        url = window.createObjectURL(file) ;
	    } else if (window.URL!=undefined) { // mozilla(firefox)
	        url = window.URL.createObjectURL(file) ;
	    } else if (window.webkitURL!=undefined) { // webkit or chrome
	        url = window.webkitURL.createObjectURL(file) ;
	    }
	    return url ;
	}
	$("#file").change(function(){
		if(!/\.(jpg|png|JPG|PNG)$/.test($("input[name='file']").val())){
 			alert("图片类型必须是jpg,png中的一种")
 	        return false;
 		}
		 var objUrl = getObjectURL(this.files[0]) ;
		 console.log("objUrl = "+objUrl) ;
		 if (objUrl) {
			 $("#show_img").attr("src", objUrl) ;
			 $("#show_img").show();
		 }
		 
	}) ;
    
    
})

  function checkNum(obj) {  
     //检查是否是非数字值  
     if (isNaN(obj.value)) {  
         obj.value = "";  
     }  
     if (obj != null) {  
         //检查小数点后是否对于两位http://blog.csdn.net/shanzhizi  
         if (obj.value.toString().split(".").length > 1 && obj.value.toString().split(".")[1].length > 2) {  
        	 obj.value = obj.value.substring(0, obj.value.indexOf('.') + 3);
         }  
     }  
 } 


