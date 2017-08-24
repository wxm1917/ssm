		$(document).ready(function(){
			//var onOff=true;
			var oSpan;
			var str;
		/*	$('.dime_con .panel-heading .open').click(function(){
				if(onOff){
					$(this).parent().siblings('.pane1_content').css('display','block');
					$(this).siblings('a').css('display','block');
					onOff=false;
				}else{
					$(this).parent().siblings('.pane1_content').css('display','none');
					$(this).siblings('a').css('display','none');
					onOff=true;
				}
				
			});
		*/
			$('.dime_con .panel-heading .operation').click(function(){
				if($(this).html()=="编辑"){
					$(this).parent().siblings('.edit').find('span').find('a').show();
					$(this).parent().parent().find('.add_btn').show();
					$(this).html("取消编辑");
					$(this).parent().parent().find(".sub").show();
				}else{
					$(this).parent().siblings('.edit').find('span').find('a').hide();
					$(this).parent().siblings('.edit').find('span').show();
					$(this).parent().parent().find('.add_btn').hide();
					$('.dime_con .edit form.add').hide();
					$(this).html("编辑");
					$(this).parent().parent().find(".sub").hide();
					$(this).parent().siblings('.edit').find('span.append').remove();
				}
			});
			$('.dime_con .edit form.add .preservation').click(function(){
				if($(this).siblings('.txt').val()!="请输入"&&$(this).siblings('.txt').val()!=""){
					 oSpan=$('<span class="append">'+$(this).siblings('.txt').val()+'<a href="javascript:;" class="glyphicon glyphicon-remove"></a></span>')
				
					$(oSpan).find('a').show();
					$(this).parent().siblings('div').append(oSpan);
					$(this).parent().hide();
					$(oSpan).find('a').click(function(){
						$(this).parent().hide();
					});
					$(this).siblings('.txt').val("请输入");

				}else{
					alert("您还没有输入，请输入后再点击");
				}

			});

			$(".dime_con .edit .add_btn").click(function(){

				$(this).parent().find('form.add').show();
				$(this).siblings('form.add').find(".txt").val("请输入");
			});

			$('.dime_con .edit form.add .glyphicon-remove').click(function(){
			
				$(this).parent().hide();
			});

			$('.dime_con .edit span a').click(function(){
				$(this).parent().hide();
			});
			$('.dime_con .edit form.add .txt').focus(function(){
					$(this).css('outline','none').css('color','#333333');
					$(this).val("");
			}).blur(function(){
					if($(this).val()==""){
						$(this).val("请输入");
					}
			});

			$('.dime_con .edit .sub').click(function(){
				$(this).parent().siblings('.panel-heading').find('.operation').html("编辑");
				$(this).siblings('div').find('span').find('a').css('display','none');
				var aSpan=$(this).siblings('div').find('span');
					aSpan.each(function(index,element){
						if($(this).is(":hidden")){
							$(this).remove();
						}
					})
				$(this).siblings('.add_btn').hide();
				$(this).siblings('form.add').hide();
				$(this).siblings('div').find('span').removeClass('append');
			});
			$(".line-title .editWd .delete").click(function(){
				$(".dime_con .panel-heading .operation").hide();
				$(".dime_con .panel-heading .delete").show();
				$(".preservationAll").show();
			});
			$(".dime_con .panel-heading .delete").click(function(){
				$(this).parents(".pane").hide();
			});
			$(".preservationAll").click(function(){
				$(".dime_con .pane").each(function(index,element){
					if($(this).is(":hidden")){
						$(this).remove();
					}
				});
				$(".dime_con .panel-heading .operation").show();
				$(".dime_con .panel-heading .delete").hide();
				$(this).hide();
			});


		function creat(){
			var $string=$('<div class= "pane" style="display:block;"><div class="panel-heading" style="background:#f5f5f5; border:solid 1px #dddddd; border-radius:5px"><span class="weiduName1"></span><input class="weiduName" type="text" value="请输入维度名" style="border:0;background:#f5f5f5;color:#767676;padding-left:10px;"><a href="javascript:;" class="operation">取消</a><a href="javascript:;" class="delete">删除</a></div><div class="pane1_content edit"><div class="sec_name"></div><button class="add_btn" style="display:block;">+新增</button><form action="" class="add"><input type="text" value="请输入" class="txt"><input type="button" value="确定" class="preservation"><a href="javascript:;" class="glyphicon glyphicon-remove"></a></form><button class="sub" style="display:block;">保存</button></div></div>');
				$(".dime_con").prepend($string);
			$string.find(".edit").find(".add_btn").click(function(){
				$(this).parent().find('form.add').show();
				$(this).siblings('form.add').find(".txt").val("请输入");
			});
			$string.find("form.add").find(".preservation").click(function(){
				if($(this).siblings('.txt').val()!="请输入"&&$(this).siblings('.txt').val()!=""){
					 oSpan=$('<span class="append">'+$(this).siblings('.txt').val()+'<a href="javascript:;" class="glyphicon glyphicon-remove"></a></span>')
				
					$(oSpan).find('a').show();
					$(this).parent().siblings('div').append(oSpan);
					$(this).parent().hide();
					$(oSpan).find('a').click(function(){
						$(this).parent().hide();
					});
					$(this).siblings('.txt').val("请输入");

				}else{
					alert("您还没有输入，请输入后再点击");
				}

			});
			$string.find("form.add").find(".glyphicon-remove").click(function(){
				$(this).parent().hide();
			});
			$string.find(".edit").find(".sub").click(function(){
				$(this).hide();
				$(this).parent().parent().find(".panel-heading").find(".weiduName1").html($(this).parent().parent().find(".panel-heading .weiduName").val());
				$(this).parent().parent().find(".panel-heading .weiduName").remove();
				$(this).parent().parent().insertBefore($(".preservationAll"))
				$(this).parent().siblings('.panel-heading').find('.operation').html("编辑");
				$(this).siblings('div').find('span').find('a').css('display','none');
				var aSpan=$(this).siblings('div').find('span');
					aSpan.each(function(index,element){
						if($(this).is(":hidden")){
							$(this).remove();
						}
					})
				$(this).siblings('.add_btn').hide();
				$(this).siblings('form.add').hide();
				$(this).siblings('div').find('span').removeClass('append');
			});
			$string.find(".panel-heading .operation").click(function(){
				if($(this).html()=="取消"){
					$(this).parent().parent().remove();
				}
				if($(this).html()=="编辑"){
					$(this).parent().siblings('.edit').find('span').find('a').show();
					$(this).parent().parent().find('.add_btn').show();
					$(this).html("取消编辑");
					$(this).parent().parent().find(".sub").show();
				}else{
					$(this).parent().siblings('.edit').find('span').find('a').hide();
					$(this).parent().siblings('.edit').find('span').show();
					$(this).parent().parent().find('.add_btn').hide();
					$('.dime_con .edit form.add').hide();
					$(this).html("编辑");
					$(this).parent().parent().find(".sub").hide();
					$(this).parent().siblings('.edit').find('span.append').remove();
				}
			});
			$string.find(".panel-heading .delete").click(function(){
				$(this).parents(".pane").hide();
			});
			$string.find(".edit form.add .txt").focus(function(){
					$(this).css('outline','none').css('color','#333333');
					$(this).val("");
			}).blur(function(){
					if($(this).val()==""){
						$(this).val("请输入");
					}
			});
			$string.find(".panel-heading .weiduName").focus(function(){
				$(this).css("outline","none");
				if($(this).val()=="请输入维度名"){
					$(this).val("");
				}
			}).blur(function(){
				if($(this).val()==""){
					$(this).val("请输入维度名");
				}
			});

		}
			$(".line-title .editWd .add").click(function(){
				creat()
			});
			$(".dime_con .edit b span a").click(function(){
				$(this).parent().parent().parent().hide();
			});

		})
