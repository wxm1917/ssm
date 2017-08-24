$(document).ready(function() {

	var ImgObj=new Image();

//0.上传图片  
$("#imageUpload").on("change",function(){

	if(!this.value||!/\.(jpg|png|gif)$/gi.test(this.value.toLowerCase())){//gif
        return false;
    }
	$("#wait_bg").css("height",$(document).height());
	$("#wait_bg").show();
	$.ajaxFileUpload({
		url: '../../img/composite/up.html',
		type: 'post',
		secureuri: false, //一般设置为false
		fileElementId: 'imageUpload', // 上传文件的id、name属性名
		dataType: 'text', //返回值类型，一般设置为json、application/json
		success: function(data, status){
			$("#wait_bg").hide();
			//$('#imgSrc').attr('src',data);
			var root=getRootPath();
			$('#imgSrc').attr('src',root+'/'+data);


			//li loop
			var markurl
			var i = 0;
			$("#imgCompositeModal").append('<span class="text_adver_word">以下是为您推荐的'+$("li").size()+'个图片</span>');
			$("li").each(function(){
				markurl = $(this).find("img").attr("src");
				buildImgTab(i)
				mark_init($('#imgSrc'),markurl,i);

				i++;
			});

			$('#imgSrc').hide();
		},
		error: function(data, status, e){
			$("#wait_bg").hide();
			alert('图片上传失败');
		}
	});

    // var formData = new FormData(this.form);
    // formData.append("imageFile",this.files);  //this.files  this.value
    // $.ajax({
    //     url: '../../img/composite/up.html' ,
    //     type: 'POST',
    //     data: formData,
    //     async: false,
    //     cache: false,
    //     contentType: false,
    //     processData: false,
		// beforeSend:function () {
		// 	$("#wait_bg").css("height",$(document).height());
		// 	$("#wait_bg").show();
		// },
    //     success: function (data) {
		//
    //
    //     },
    //     error: function (data) {
		//
    //     }
    // });

});

	function buildImgTab(i) {
		var cpm = Math.round(Math.random()*5 + 1);
		var tab = $('<div class="show_tab" meta-data="'+i+'"><div><lable>图'+(i+1)+':</lable></div></div>');
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
					'<div class="actions'+i+'" style="margin-top: 10px;float:left;width: 150px;text-align: center">' +
					'	<div class="ui approve teal button" style="margin-bottom:5px;">合成</div>' +
					'</div>')
		tab.append('<div style="float:left;width: 100%;text-align: center;padding-top: 5px;font-size: 16px;"><p>展示价格:0.'+cpm+'元/cpm</p></div>')
		$("#imgCompositeModal").append(tab)
	}


	var btn_obj ;
	function mark_init(t,markurl,imgIndex){
		var $this = t;
		var watermark;
		if($this.attr('src')==null){
			alert('请上传图片');return false;
		}
		//绑定提交事件
		$(".actions"+imgIndex+" .approve").click(function(){
			btn_obj = $(this);
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
						$(btn_obj).parent().append('<a class="ui teal button" style="margin-bottom:5px;cursor: pointer" href="'+data+'" download="pic">点击下载</a>');
						$(btn_obj).parent().append('<a class="ui teal button copy_btn" style="margin-bottom:5px;cursor: pointer" data-clipboard-text="'+data+'" >复制链接</a>');
						new Clipboard('.copy_btn');
					},
					error: function (data) {
						alert('图片组合失败');
					}
				});
			}
		});
	}
//复制到剪切板js代码
	function copyToClipBoard(s) {
		//alert(s);
		if (window.clipboardData) {
			window.clipboardData.setData("Text", s);
			alert("已经复制到剪切板！"+ "\n" + s);
		} else if (navigator.userAgent.indexOf("Opera") != -1) {
			window.location = s;
		} else if (window.netscape) {
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			} catch (e) {
				alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
			}
			var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
			if (!clip)
				return;
			var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
			if (!trans)
				return;
			trans.addDataFlavor('text/unicode');
			var str = new Object();
			var len = new Object();
			var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
			var copytext = s;
			str.data = copytext;
			trans.setTransferData("text/unicode", str, copytext.length * 2);
			var clipid = Components.interfaces.nsIClipboard;
			if (!clip)
				return false;
			clip.setData(trans, null, clipid.kGlobalClipboard);
			alert("已经复制到剪切板！" + "\n" + s)
		}
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

	$("body").on('click','.copy_btn',function(){
		var data = $(this).attr("meta-data");
		copyToClipBoard(data);
	});
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




});