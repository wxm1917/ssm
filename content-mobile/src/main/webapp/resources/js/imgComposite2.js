$(document).ready(function() {

	var bg_img ,markurl;
	$(".aaa").click(function () {
		var root=getRootPath();
		if($(this).attr("tmp")=="bbb"){
			$('#imgSrc').attr('src',root+'/'+$(this).attr("src"));
			bg_img = root+'/'+$(this).attr("src");
		}else{
			markurl = $(this).attr("src");
		}

		buildImgTab(0)
		mark_init($('#imgSrc'),markurl,0);

		$('#imgSrc').hide();
	})

	function init(){
		var root=getRootPath();
		bg_img = root+'/'+$(".table li:first").find("img").attr("src");

		bg_img = root + '/images/d1.png';

		$('#imgSrc').attr('src',bg_img);

		//markurl = $(".adver-img ul li:first img").attr("src");

		markurl = root + '/images/a1.png';

		buildImgTab(0)
		mark_init($('#imgSrc'),markurl,0);

		$('#imgSrc').hide();
	}
	function buildImgTab(i) {
		$(".show_tab").remove();
		var tab = $('<div class="show_tab" meta-data="'+i+'"></div>');
		var workTab = $('<div class="work_tab" id="setImgComposite'+i+'"></div>')
		tab.append(workTab);
		tab.append('<div class="param">' +
					'	<table class="param_tb" style="margin:auto;">' +
					'		<tr>' +
					'			<td>X坐标:</td>' +
					'			<td><input type="text" id="px'+i+'" class="position_x" value="0"></td>' +
					'		</tr>' +
					'		<tr>' +
					'			<td>Y坐标:</td>' +
					'			<td><input type="text" id="py'+i+'" class="position_y" value="0"/></td>' +
					'		</tr>' +
					'		<tr>' +
					'			<td>宽度:</td>' +
					'			<td>' +
					'				<input type="text" id="ww'+i+'" class="wm_width"/>' +
					'			</td>' +
					'		</tr>' +
					'		<tr>' +
					'			<td>高度:</td>' +
					'			<td><input type="text" id="wh'+i+'" class="wm_height" readonly="readonly"/></td>' +
					'		</tr>' +
					'		<tr>' +
					'			<td>透明度:</td>' +
					'			<td><input type="text" id="wo'+i+'" class="wm_opacity" value="0.5"/></td>' +
					'		</tr>' +
					'	</table>' +
					'</div>' +
					'<div class="actions'+i+'" style="margin-top: 10px;">' +
					'	<div class="ui approve teal button">下载</div>' +
					'</div>')
		$("#imgCompositeModal").append(tab)
	}



	function mark_init(t,markurl,imgIndex){
		var $this = t;
		var watermark;
		if($this.attr('src')==null){
			alert('请上传图片');return false;
		}
		//绑定提交事件
		$(".actions"+imgIndex+" .approve").click(function(){
			watermark.mark();
		})
		$("#setImgComposite"+imgIndex).show();
		watermark = $('#setImgComposite'+imgIndex).html('<img>').watermark({
			imgUrl: $this.attr('src'),
			markUrl: markurl,//'../../resources/images/logo.png'
			opacity: 100,
			minWidth: 36,
			maxWidth: 144,
			imgIndex:imgIndex,
			onMark: function (e) {
				var res = e.watermark;
				//res.imgKey = $this.data('key');
				res.imgUrl = $this.attr('src');
				res.imgWidth = $this.prop('naturalWidth');
				res.imgHeight = $this.prop('naturalHeight');
				//alert(JSON.stringify(res));
				res.imgUrl=remoteRootPath(res.imgUrl);

				markurl=remoteRootPath(markurl);


				var formData = new FormData();
				formData.append("imgUrl",res.imgUrl);
				formData.append("markUrl",markurl);
				formData.append("x",res.x);
				formData.append("y",res.y);
				formData.append("width",res.imgWidth);
				formData.append("height",res.imgHeight);
				formData.append("wmWith",res.width);
				formData.append("wmHeight",res.height);
				formData.append("wmOpacity",res.opacity);
				$.ajax({
					url: '../../img/composite/do.html' ,
					type: 'POST',
					data: formData,
					async: false,
					cache: false,
					contentType: false,
					processData: false,
					success: function (data) {
						//$('#imgSrc').attr('src',data);

						var root=getRootPath();
						data = root+'/'+data;
						window.open(data);
					},
					error: function (data) {
						alert('图片组合失败');
					}
				});
			}
		});
	}


	//js获取项目根路径，如： http://localhost:8083/uimcardprj
	function getRootPathAndProjectName(){
		//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath=window.document.location.href;
		//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName=window.document.location.pathname;
		var pos=curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8083
		var localhostPaht=curWwwPath.substring(0,pos);
		//获取带"/"的项目名，如：/uimcardprj
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		return(localhostPaht+projectName);
	}

	//获得根目录带斜杠
	function getRootPath(){
		//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath=window.document.location.href;
		//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName=window.document.location.pathname;
		var pos=curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8083
		var localhostPaht=curWwwPath.substring(0,pos);
		return localhostPaht;
	}
	//去掉根目录
	function remoteRootPath(url){
		//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath=window.document.location.href;
		//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName=window.document.location.pathname;
		var pos=curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8083
		var localhostPaht=curWwwPath.substring(0,pos);

		return url.replace(localhostPaht,"");
	}
	var reg =/^\d+(\.\d+)?$/;
	$("body").on('keyup','.position_x',function(){
		if(reg.test($(this).val())){
			var metaData = $(this).parent().parent().parent().parent().parent().parent().attr("meta-data");
			var positionY = $(this).parent().parent().parent().find(".position_y").val();
			$("#wm_img").css({left:Number($(this).val()),top: Number(positionY)});
		}
	});
	$("body").on('keyup','.position_y',function(){
		if(reg.test($(this).val())) {
			var metaData = $(this).parent().parent().parent().parent().parent().parent().attr("meta-data");
			var positionX = $(this).parent().parent().parent().find(".position_x").val();
			$("#wm_img"+metaData).css({left:Number(positionX),top: Number($(this).val())});
		}
	});
	$("body").on('keyup','.wm_width',function(){
		if(reg.test($(this).val())) {
			var metaData = $(this).parent().parent().parent().parent().parent().parent().attr("meta-data");
			$("#wm_img"+metaData).width($(this).val());
			$(this).parent().parent().parent().find(".wm_height").val($("#wm_img"+metaData).height());
		}
	})
	$("body").on('keyup','.wm_opacity',function(){
		if(reg.test($(this).val())) {
			var metaData = $(this).parent().parent().parent().parent().parent().parent().attr("meta-data");
			console.log(metaData);
			if(Number($(this).val())>1){
				$("#wm_img"+metaData).css({opacity:1});
			}else if(Number($(this).val())<=0){
				$("#wm_img"+metaData).css({opacity:0.1})
			}else{
				$("#wm_img"+metaData).css({opacity:Number($(this).val())})
			}
		}
	});

	init();


});