$(function(){
    $("#index_table .glyphicon").click(function(){
		var _desc = $(this).attr("data-desc");
		var _type = $(this).attr("data-type");
		alert("ÕâÀïÌø×ªÒ³Ãæ£º ÅÅÐò£º"+_desc + "£¬ÁÐ£º"+_type);
		location.href="index.html?type=" + _type + "&order=" + _desc;
    });

	//Ìí¼Ó¹ã¸æ×é£º Ê±¶ÎÑ¡Ôñ
    $("#time_checkbox_ctrl_hide").click(function(){
		$("#time_checkbox_box").slideUp();
    });
    $("#time_checkbox_ctrl_show").click(function(){
		$("#time_checkbox_box").slideDown();
    });

	//Ìí¼Ó¹ã¸æ×é£º µØÇøÑ¡Ôñ
    $("#area_checkbox_ctrl_hide").click(function(){
		$("#area_checkbox_box").slideUp();
    });
    $("#area_checkbox_ctrl_show").click(function(){
		$("#area_checkbox_box").slideDown();
    });

	//Ìí¼Ó¹ã¸æ×é£º ÈËÈºÑ¡Ôñ¡ª¡ª¶¨ÏòÌõ¼þÑ¡Ôñ
    $("#person1_checkbox_ctrl_hide").click(function(){
		$("#person1_checkbox_box").slideUp();
    });
    $("#person1_checkbox_ctrl_show").click(function(){
		$("#person1_checkbox_box").slideDown();
    });

	//Ìí¼Ó¹ã¸æ×é£º ÈËÈºÑ¡Ôñ¡ª¡ªÈËÈºÊôÐÔÑ¡Ôñ
    $("#person2_checkbox_ctrl_hide").click(function(){
		$("#person2_checkbox_box").slideUp();
    });
    $("#person2_checkbox_ctrl_show").click(function(){
		$("#person2_checkbox_box").slideDown();
    });

	//Ìí¼Ó¹ã¸æ×é£º ÈËÈºÑ¡Ôñ¡ª¡ªÃ½ÌåÀà±ð
    $("#person3_checkbox_ctrl_hide").click(function(){
		$("#person3_checkbox_box").slideUp();
    });
    $("#person3_checkbox_ctrl_show").click(function(){
		$("#person3_checkbox_box").slideDown();
    });
    //新建广告组页面点击直播显示直播的下拉内容
    $("#zhibo_checkbox_ctrl_show").click(function(){
    	$("#zhibo_checkbox_box").slideDown();
    	$("#shipin_checkbox_box").hide();
    	$("#dianbo_checkbox_box").hide();

    });
    //新建广告组页面点击视频显示视频的下拉内容
     $("#shipin_checkbox_ctr2_show").click(function(){
    	$("#zhibo_checkbox_box").hide();
    	$("#shipin_checkbox_box").slideDown();
    	$("#dianbo_checkbox_box").hide();
    });
    //新建广告组页面点击点播显示点播的下拉内容
     $("#dianbo_checkbox_ctr3_show").click(function(){
    	$("#zhibo_checkbox_box").hide();
    	$("#shipin_checkbox_box").hide();
    	$("#dianbo_checkbox_box").slideDown();
    });
    //新建广告组页面点击竞品定向下的自定义和不限显示和隐藏内容
    $("#jingpin_checkbox_ctr1_hide").click(function(){
        $("#jingpin_checkbox_box").slideUp();
        $(this).parents(".list-group").find(".bg-gray label input").attr("checked",false);
        $(this).parents(".list-group").find(".nrBox").slideUp();
    });
    $("#jingpin_checkbox_ctr2_show").click(function(){
        $("#jingpin_checkbox_box").slideDown();
    });
    //新建广告组页面点击场景定向下的自定义和不限显示和隐藏内容
    $("#scene_checkbox_ctr1_hide").click(function(){
         $("#scene_checkbox_box").slideUp();
    });
    $("#scene_checkbox_ctr2_show").click(function(){
         $("#scene_checkbox_box").slideDown();
    });
    //新建广告组页面点击人脸定向下的自定义和不限显示和隐藏内容
    $("#face_checkbox_ctr1_hide").click(function(){
         $("#face_checkbox_box").slideUp();
    });
    $("#face_checkbox_ctr2_show").click(function(){
         $("#face_checkbox_box").slideDown();
    });
    //新建广告组页面点击情绪定向下的自定义和不限显示和隐藏内容
    $("#emotion_checkbox_ctr1_hide").click(function(){
         $("#emotion_checkbox_box").slideUp();
    });
    $("#emotion_checkbox_ctr2_show").click(function(){
         $("#emotion_checkbox_box").slideDown();
    });
    //新建广告组页面点击语义定向下的自定义和不限显示和隐藏内容
    $("#yuyi_checkbox_ctrl_hide").click(function(){
         $("#yuyi_checkbox_box").slideUp();
    });
    $("#yuyi_checkbox_ctr2_show").click(function(){
         $("#yuyi_checkbox_box").slideDown();
    });
     //新建广告组页面点击音乐定向下的自定义和不限显示和隐藏内容
    $("#music_checkbox_ctrl_hide").click(function(){
         $("#music_checkbox_box").slideUp();
    });
    $("#music_checkbox_ctr2_show").click(function(){
         $("#music_checkbox_box").slideDown();
    });
    //新建广告组页面点击设备定向下的自定义和不限显示和隐藏内容
    $("#device_checkbox_ctr1_hide").click(function(){
         $("#device_checkbox_box").slideUp();
    });
    $("#device_checkbox_ctr2_show").click(function(){
         $("#device_checkbox_box").slideDown();
    });
    //新建广告组页面点击终端定向下的自定义和不限显示和隐藏内容
    $("#terminal_checkbox_ctr1_hide").click(function(){
         $("#terminal_checkbox_box").slideUp();
    });
    $("#terminal_checkbox_ctr2_show").click(function(){
         $("#terminal_checkbox_box").slideDown();
    });
    $("#lanmu_checkbox_ctrl_hide").click(function(){
        $("#lanmu_checkbox_box").slideUp();
    });
    $("#lanmu_checkbox_ctr2_show").click(function(){
        $("#lanmu_checkbox_box").slideDown();
    });

    $("#dianb_checkbox_ctr1_hide").click(function(){
        $("#dianb_checkbox_box").slideUp();
    });
    $("#dianb_checkbox_ctr2_show").click(function(){
        $("#dianb_checkbox_box").slideDown();
    });
    $("#ship_checkbox_ctrl_hide").click(function(){
        $("#ship_checkbox_box").slideUp();
    });
    $("#ship_checkbox_ctr2_show").click(function(){
        $("#ship_checkbox_box").slideDown();
    });
     $("#star_checkbox_ctr1_hide").click(function(){
        $("#star_checkbox_box").slideUp();
    });
    $("#star_checkbox_ctr2_show").click(function(){
        $("#star_checkbox_box").slideDown();
    });
    $("#pindao_checkbox_ctr1_hide").click(function(){
        $("#pindao_checkbox_box").slideUp();
    });
    $("#pindao_checkbox_ctr2_show").click(function(){
        $("#pindao_checkbox_box").slideDown();
    });

    $("#operator_checkbox_ctr1_hide").click(function(){
        $("#operator_checkbox_box").slideUp();
    });
    $("#operator_checkbox_ctr2_show").click(function(){
        $("#operator_checkbox_box").slideDown();
    });

    //点击当前类别选中该类别下所有的checkbox
    $(".groupCkQuanX").click(function(){
    	if($(this).prop("checked")){
    		$(this).parent().parent().parent().find("input:checkbox").prop("checked",true)
    	}else{

    		$(this).parent().parent().parent().find("input:checkbox").prop("checked",false);
    	}
    });
    $(".groupCkQuanX1").click(function(){
    	if($(this).prop("checked")){
    		$(this).parent().parent().find("input:checkbox").prop("checked",true)
    	}else{

    		$(this).parent().parent().find("input:checkbox").prop("checked",false);
    	}
    });
    $("#check_all").click(function(){
            var a=$(this)[0].checked;
            var inputs = document.getElementsByTagName("input");
            for(var i=0; i< inputs.length; i++){
                if(inputs[i].type == "checkbox"){
                    inputs[i].checked = a; 
                }
            }
    });
    $(".userInformation input").each(function(index,element){
    	var $val=$(this).val();
    	$(this).focus(function(){
    		if($(this).val()==$val){
    			$(this).val("");
    		}
    	}).blur(function(){
    		if($(this).val()==""){
    			$(this).val($val);
    		}
    	})
    });
    $(".hfsAd .adTable tbody td input").focus(function(){
    	if($(this).val()=="次"){
    		$(this).val("");
    	}
    }).blur(function(){
    	if($(this).val()==""){
    		$(this).val("次");
    	}
    });

    $(".quanbu").change(function(){
    	if($(this).prop("checked")){
    		$(this).parent().parent().find("input:checkbox").prop("checked",true)
    	}else{

    		$(this).parent().parent().find("input:checkbox").prop("checked",false);
    	}
  		
    });
    $(".zdyBtn").change(function(){
    	$(".zidingyi").slideDown();
    });
    //新建广告组页面人口属性年龄自定义js效果
    $(".zidingyi .bianji").click(function(){
        if($(".zidingyi .bianji").text()=="编辑"){
             $(".zidingyi  .glyphicon-remove").show();
             $(".zidingyi  .bianji").text("保存");
        }else{
           $(".zidingyi  .glyphicon-remove").hide(); 
           $(".zidingyi  .bianji").text("编辑");
            if($("#person2_checkbox_box .yidingyi span.mr15").length==0){
                $("#person2_checkbox_box .yidingyi").hide();
            }
        }
    });
    $(".zidingyi .glyphicon-plus-sign").click(function(){
    	var str='<span class="mr15" >'+$(".zidingyi .ageStart").val()+"-"+$(".zidingyi .ageEnd").val()+'<a href="javascript:;" class="glyphicon glyphicon-remove gray rThis"></a></span>'
    	$(".yidingyi .bianji").before(str);
        $(".zidingyi .ageEnd").val("0");
        $(".zidingyi .ageStart").val("0");
        $("#person2_checkbox_box .yidingyi").show();
    	$(".yidingyi .glyphicon-remove").click(function(){
    		$(this).parent().remove();
    	});
    });
    	$(".yidingyi .glyphicon-remove").click(function(){
    	$(this).parent().remove();
    });
      //新建广告组页面时段定向js效果
    $(".timeZdy .bianji").click(function(){
        if($(".timeZdy .bianji").text()=="编辑"){
             $(".timeZdy .glyphicon-remove").show();
             $(".timeZdy .bianji").text("保存");
        }else{
           $(".timeZdy .glyphicon-remove").hide(); 
           $(".timeZdy .bianji").text("编辑");
            if($("#time_checkbox_box .timeYdy span.mr15").length==0){
                $("#time_checkbox_box .timeYdy").hide();
            }
        }
    });
    $(".timeZdy .glyphicon-plus-sign").click(function(){
    	if($(".timeZdy .timeStart").val()==""||$(".timeZdy .timeEnd").val()==""){
    		alert("请选择时间")
    	}else{
    		var str='<span class="mr15">'+$(".timeZdy .timeStart").val()+"-"+$(".timeZdy .timeEnd").val()+'<a href="javascript:;" class="glyphicon glyphicon-remove gray rThis"></a></span>'
        	$(".timeYdy .bianji").before(str);
            $(".timeZdy .timeStart").val("");
            $(".timeZdy .timeEnd").val("");
            $("#time_checkbox_box .timeYdy").show();
    	}
    	
    	$(".timeYdy .glyphicon-remove").click(function(){
    		$(this).parent().remove();
    	});
    });
     $(".timeYdy .glyphicon-remove").click(function(){
    	$(this).parent().remove();
    });
    //新建广告组页面语义定向js效果
    $(".yuyiZdy .bianji").click(function(){
        if($(".yuyiZdy .bianji").text()=="编辑"){
             $(".yuyiZdy .glyphicon-remove").show();
             $(".yuyiZdy .bianji").text("保存");
        }else{
           $(".yuyiZdy .glyphicon-remove").hide(); 
           $(".yuyiZdy .bianji").text("编辑");
            if($("#yuyi_checkbox_box .yuyiYdy span.mr15").length==0){
                $("#yuyi_checkbox_box .yuyiYdy").hide();
            }
        }
    });
    $(".yuyiZdy .glyphicon-plus-sign").click(function(){
        if($(".yuyiZdy .yuyiText").val()=="请输入语义"){
            alert("请输入后再提交");
        }else{
            var str='<span class="mr15">'+$(".yuyiZdy .yuyiText").val()+'<a href="javascript:;" class="glyphicon glyphicon-remove gray rThis"></a></span>'
            $(".yuyiYdy .bianji").before(str);
            $("#yuyi_checkbox_box .yuyiYdy").show();
            $(".yuyiZdy .yuyiText").val("请输入语义");
        }
        $(".yuyiYdy .glyphicon-remove").click(function(){
            $(this).parent().remove();
        });
    });
     $(".yuyiYdy .glyphicon-remove").click(function(){
        $(this).parent().remove();
    });
    $(".yuyiZdy .yuyiText").focus(function(){
        if($(this).val()=="请输入语义"){
            $(this).val("");
        }
    }).blur(function(){
        if($(this).val()==""){
            $(this).val("请输入语义");
        }
    });

    //新建广告组页面音乐定向js效果
    $(".musicZdy .bianji").click(function(){
        if($(".musicZdy .bianji").text()=="编辑"){
             $(".musicZdy .glyphicon-remove").show();
             $(".musicZdy .bianji").text("保存");
        }else{
           $(".musicZdy .glyphicon-remove").hide(); 
           $(".musicZdy .bianji").text("编辑");
            if($("#music_checkbox_box .musicYdy span.mr15").length==0){
                $("#music_checkbox_box .musicYdy").hide();
            }
        }
    });
    $(".musicZdy .glyphicon-plus-sign").click(function(){
        if($(".musicZdy .musicText").val()=="请输入音乐"){
            alert("请输入后再提交");
        }else{
            var str='<span class="mr15">'+$(".musicZdy .musicText").val()+'<a href="javascript:;" class="glyphicon glyphicon-remove gray rThis"></a></span>'
            $(".musicYdy .bianji").before(str);
            $("#music_checkbox_box .musicYdy").show();
            $(".musicZdy .musicText").val("请输入音乐");
        }
        $(".musicYdy .glyphicon-remove").click(function(){
            $(this).parent().remove();
        });
    });

     $(".musicYdy .glyphicon-remove").click(function(){
        $(this).parent().remove();
    });
    $(".musicZdy .musicText").focus(function(){
        if($(this).val()=="请输入音乐"){
            $(this).val("");
        }
    }).blur(function(){
        if($(this).val()==""){
            $(this).val("请输入音乐");
        }
    });

});

function clickBox(obj){
	if(obj.checked==false){
		$("#check_all").attr("checked",false);
	}
	var inputs = document.getElementsByTagName("input");
	var flag = true;
	for(var i=0; i< inputs.length; i++){
		if(inputs[i].type == "checkbox"&&inputs[i].id!="check_all"){
			if(inputs[i].checked==false){
				flag = false;
			}
		}
	}
	if(flag){
		//$("#check_all").attr("checked",true);
		document.getElementById("check_all").checked=true;
	};
}

/*window.onload=function(){
			//左侧导航栏点击与内容部分交互效果开始
			var aA=document.getElementById("main-left").getElementsByTagName("a");
			var aDiv=document.getElementById("main-left-box").getElementsByTagName("div");
			var oReset=document.getElementById("reset");
			//var arr=["那年青春我们正好","影视","音乐","天安门广场","古力挪扎","鹿晗"]
			var aDiv1=document.getElementById("mian-center").getElementsByTagName("div");
			var oSub=document.getElementById("sub");
			var onOff=false;
			for(var i=0; i<aA.length; i++){
				aA[i].index=i;
				aA[i].onclick=function(){
					if(onOff==false){
						aDiv[this.index].style.display="block";
						onOff=true;
					}	
				}
			}
			for(var i=0; i<aDiv1.length; i++){
				aDiv1[i].innerHTML=arr[i];
			}
			oSub.onclick=function(){
				for(var i=0; i<aDiv.length; i++){
					var aInput=aDiv[i].getElementsByTagName("input");
					var aLabel=aDiv[i].getElementsByTagName("label");
					for(var j=0; j<aInput.length; j++){
						if(aInput[j].checked==true){
						arr[i]=aLabel[j].innerHTML;
						aDiv1[i].innerHTML=arr[i];
						}
					}
				}
			}
			oReset.onclick=function(){
				arr=["那年青春我们正好","影视","音乐","天安门广场","古力挪扎","鹿晗"];
				for(var i=0; i<aDiv.length; i++){
					aDiv1[i].innerHTML=arr[i];
				}
			}
			//左侧导航栏点击与内容部分交互效果结束
			$(document).ready(function(){
				//点击左侧导航栏弹出框里的确定和取消按钮
				$(".btn1").click(function(){
					$(this).parent().css("display","none");
					onOff=false;
				})
				$(".btn2").click(function(){
					$(this).parent().find('input').attr("checked",false);
					$(this).parent().css("display","none");
					onOff=false;
				})
				//右侧input元素获得焦点时取消蓝色边框
				$(".main-right input").focus(function(){
					$(this).css("outline","none");
				})
				$("a").focus(function(){
					$(this).blur();
				})
			})
		}
		*/