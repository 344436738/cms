function supportstorage() {
	if (typeof window.localStorage=='object')
		return true;
	else
		return false;
}

var layouthistory;

function undoLayout() {
	var data = layouthistory;
	if (data) {
		if (data.count<2) return false;
		window.demoHtml = data.list[data.count-2];
		data.count--;
		$('.demo').html(window.demoHtml);
		if (supportstorage()) {
			localStorage.setItem("layoutdata",JSON.stringify(data));
		}
		return true;
	}
	return false;
}

function redoLayout() {
	var data = layouthistory;
	if (data) {
		if (data.list[data.count]) {
			window.demoHtml = data.list[data.count];
			data.count++;
			$('.demo').html(window.demoHtml);
			if (supportstorage()) {
				localStorage.setItem("layoutdata",JSON.stringify(data));
			}
			return true;
		}
	}
	return false;
}

function handleJsIds() {
	handleModalIds();
	handleAccordionIds();
	handleCarouselIds();
	handleTabsIds()
}
function handleAccordionIds() {
	var e = $(".demo #myAccordion");
	var t = randomNumber();
	var n = "accordion-" + t;
	var r;
	e.attr("id", n);
	e.find(".accordion-group").each(function(e, t) {
		r = "accordion-element-" + randomNumber();
		$(t).find(".accordion-toggle").each(function(e, t) {
			$(t).attr("data-parent", "#" + n);
			$(t).attr("href", "#" + r)
		});
		$(t).find(".accordion-body").each(function(e, t) {
			$(t).attr("id", r)
		})
	})
}
function handleCarouselIds() {
	var e = $(".demo #myCarousel");
	var t = randomNumber();
	var n = "carousel-" + t;
	e.attr("id", n);
	e.find(".carousel-indicators li").each(function(e, t) {
		$(t).attr("data-target", "#" + n)
	});
	e.find(".left").attr("href", "#" + n);
	e.find(".right").attr("href", "#" + n)
}
function handleModalIds() {
	var e = $(".demo #myModalLink");
	var t = randomNumber();
	var n = "modal-container-" + t;
	var r = "modal-" + t;
	e.attr("id", r);
	e.attr("href", "#" + n);
	e.next().attr("id", n)
}
function handleTabsIds() {
	var e = $(".demo #myTabs");
	var t = randomNumber();
	var n = "tabs-" + t;
	e.attr("id", n);
	e.find(".tab-pane").each(function(e, t) {
		var n = $(t).attr("id");
		var r = "panel-" + randomNumber();
		$(t).attr("id", r);
		$(t).parent().parent().find("a[href=#" + n + "]").attr("href", "#" + r)
	})
}
function randomNumber() {
	return randomFromInterval(1, 1e6)
}
function randomFromInterval(e, t) {
	return Math.floor(Math.random() * (t - e + 1) + e)
}
function gridSystemGenerator() {
	$(".lyrow .preview input").bind("keyup", function() {
		var e = 0;
		var t = "";
		var n = $(this).val().split(" ", 12);
		$.each(n, function(n, r) {
			e = e + parseInt(r);
			t += '<div class="span' + r + ' column"></div>'
		});
		if (e == 12) {
			$(this).parent().next().children().html(t);
			$(this).parent().prev().show()
		} else {
			$(this).parent().prev().hide()
		}
	})
}
function configurationElm(e, t) {
	$(".demo").delegate(".configuration > a", "click", function(e) {
		e.preventDefault();
		var t = $(this).parent().next().next().children();
		$(this).toggleClass("active");
		t.toggleClass($(this).attr("rel"))
	});
	$(".demo").delegate(".configuration .dropdown-menu a", "click", function(e) {
		e.preventDefault();
		$(this).parent().parent().parent().removeClass("open");
		$(this).attr("rel");
	})
}
function removeElm() {
	$(".demo").delegate(".remove", "click", function(e) {
		e.preventDefault();
		if($(this).parent().hasClass("lyrow")){

			var boxElements=$(this).parent().find(".box-element");
			if(boxElements.length>0){
				lmAlert("删除布局前请先将布局内的组件删除！");
				return ;
			}
			$(this).parent().remove();
			if (!$(".demo .lyrow").length > 0) {
				clearDemo()
			}

			return;
		}else if($(this).parent().hasClass("box-element")){
			$(this).parent().remove();
		}else{
			lmAlert("无法删除");
		}

	})
}

function clearDemo() {
	$(".demo").empty();
}
function removeMenuClasses() {
	$("#menu-layoutit li button").removeClass("active")
}
function changeStructure(e, t) {
	$("#download-layout ." + e).removeClass(e).addClass(t)
}
function cleanHtml(e) {
	if($(e).attr("id")){
		$(e).parent().append("${module_"+$(e).attr("id")+"}");
	}else{
		$(e).parent().append($(e).children().html());
	}
}
function downloadLayoutSrc(token) {
	$("#download-layout").children().html($(".demo").html());
	$("#download-layout .box-element").each(function (){
		var id=$(this).attr("id");
		if(id){
			$(this).find(".preview").empty();
			$(this).find(".configuration").empty();
			$(this).find(".view").html("${module_"+id+"}");
		}

	});

	var t = $("#download-layout").children();
	t.find(".preview, .configuration, .drag, .remove").remove();
	t.find(".lyrow").addClass("removeClean");
	t.find(".box-element").addClass("removeClean");
	t.find(".lyrow .lyrow .lyrow .lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .lyrow .lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".removeClean").remove();
	$("#download-layout .column").removeClass("ui-sortable");
	$("#download-layout .row-fluid").removeClass("clearfix").children().removeClass("column");
	$("#download-layout .container-fluid").removeClass("container-fluid").addClass("container");
	changeStructure("row-fluid", "row");
	formatSrc= $("#download-layout").html();
	$("#downloadModal textarea").empty();

	$.ajax({
		type:'get',
		async:false,
		url:contextpath+"/visibleModuleController/getAllModuleFinallyTempalte.do?templateId="+template_id,
		data:{'token':token},
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			$.each(obj, function(key, val) {
				formatSrc=formatSrc.replace("${"+key+"}",val);
			});
			$("#downloadModal textarea").val(formatSrc);
			$(".diy_textarea").setTextareaCount({
				width: "30px",
				bgColor: "#eee",
				color: "#777",
				display: "inline-block"
			});
		}
	});


}

/**
 * 下载带有可视化操作的模板，方便二次编辑
 */
function downloadVisibleTemplate(){
	$("#download-layout .container").removeClass("container").addClass("container-fluid");

	$("#download-layout").children().html($(".demo").html());
	$("#download-layout .box-element").each(function (){
		var id=$(this).attr("id");
		if(id){
			$(this).find(".preview").empty();
			$(this).find(".configuration").empty();
			$(this).find(".view").html("${module_"+id+"}");
		}

	});

	if ($("#download-layout .container").length > 0) {
		changeStructure("row-fluid", "row")
	}else if($("#download-layout .container-fluid").length > 0){
		changeStructure("row", "row-fluid")
	}

	formatSrc=$("#download-layout").html();
	$("#downloadModal textarea").empty();

	$.ajax({
		type:'get',
		url:contextpath+"/visibleModuleController/getAllModuleFinallyTempalte.do?templateId="+template_id,
		dataType:'text',
		data:{'token':"0"},
		async:false,
		success:function(data){
			var obj = JSON.parse(eval(data));
			$.each(obj, function(key, val) {
				formatSrc=formatSrc.replace("${"+key+"}",val);
			});

			$("#downloadModal textarea").val(formatSrc);
			$(".diy_textarea").setTextareaCount({
				width: "30px",
				bgColor: "#eee",
				color: "#777",
				display: "inline-block"
			});
		}
	});
}

var stopsave = 0;
var startdrag = 0;
var demoHtml = $(".demo").html();
var currenteditor = null;
$(window).resize(function() {
	$("body").css("min-height", $(window).height() - 90);
	$(".demo").css("min-height", $(window).height() - 160)
});

function initContainer(){
	$(".demo, .demo .column").sortable({
		connectWith: ".column",
		opacity: .35,
		handle: ".drag",
		start: function(e,t) {
			if (!startdrag) stopsave++;
			startdrag = 1;
		},
		stop: function(e,t) {
			if(stopsave>0) stopsave--;
			startdrag = 0;
		}
	});
	configurationElm();
}

var moduleList=["lmcms_module_nav"];

function handleModule(){
	var $module=$(".demo .lmcms_module_new");
	if($module.length > 0){
		var moduleKey=$module.attr("modulekey");
		for (var i = moduleList.length - 1; i >= 0; i--) {
			if(moduleList[i]===moduleKey){
				$.ajax({
					type:'get',
					url:contextpath+"/visibleModuleController/saveModule.do?moduleKey="+moduleKey+"&templateId="+template_id,
					dataType:'text',
					success:function(data){
						var obj = JSON.parse(eval(data));
						if(obj.isSuccess){
							$module.attr("id",obj.id);
							$("#navModuleId").val(obj.id);
							$module.find(".configuration").html(obj.controllerCode);
							//$module.find(".view").html(obj.demo);
							$module.removeClass("lmcms_module_new");
							showNavParams(1,1);
							$("#nav_param_modal").modal("show");
						}else{
							lmAlert(obj.msg);
						}
					}
				});
				return;
			}
		}
	}

    paginationModule();//分页组件
	embedContentModule('');//单篇文章组件
	listModule();
	imageNewsListModule();
	htmlModule();
	diyCodeModule();
	imageModule();
	imagesListModule();
	showContentListModule();
}

/**列表页组件*/
function showContentListModule(){
	var $module=$(".demo .lmcms_module_new.lmcms_module_content_list");

	if($module.length==0){
		return;
	}

	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: function (e) { onCheck(e,"contentListCatTree","contentListCatId","contentListCatName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/contentCatController/treeData.do",
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#contentList_param_modal #contentListCatName").val("");
				$("#contentList_param_modal #contentListCatId").val("");
				$("#contentList_param_modal #contentListParamsId").val("");
				$("#contentList_param_modal #contentListModuleId").val("");
				$("#contentList_param_modal #contentListModuleKey").val("lmcms_module_content_list");
				$("#contentList_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#contentListCatTree"), setting, zNodes);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("栏目加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_content_list").remove()
		}
	});
}


/**
 * 单篇文章组件
 */
function embedContentModule(id){
		if(id==''){
			var $module=$(".demo .lmcms_module_new.lmcms_module_singleContent");
			if($module.length==0){
				return;
			}
		}

	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/getEmbedContent.do",
		data:'moduleId='+id,
		success:function(msg){
				$("#embedContent_param_modal").modal("show");
				$("#embedContent_param_modal").empty();
				$("#embedContent_param_modal").append(msg);
				$("#embedContentModuleId").val("");
				$("#embedContentModuleContentId").val("");
				$("#embedContentModuleKey").val("lmcms_module_singleContent");
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}

/**
 * 编辑单篇文章组件
 */
function shoeEembedContentModule(id){
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/getEmbedContentParam.do",
		data:'moduleId='+id,
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			$("#embedContentModuleId").val(obj.moduleId);
			$("#embedContentModuleContentId").val(obj.contentId);
			$("#embedContentModuleKey").val(obj.moduleKey);
			$("#embedContentModuleParamId").val(obj.paramId);
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}

function embedContentSubmit(id){

	/*选择内容id*/
	$("#embedContentModuleContentId").val(id);


	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/saveEmbedContentTemplate.do?templateId="+template_id,
		data:$("#embedContentForm").serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if(obj.isSuccess){
				if($("#embedContentForm #embedContentModuleId").val()){
					var $module=$("#"+$("#embedContentForm #embedContentModuleId").val());
					$module.find(".view").html(obj.template);
				}else{
					var $listModule=$(".demo .lmcms_module_new."+$("#embedContentForm #embedContentModuleKey").val());
					$listModule.attr("id",obj.id);
					$listModule.find(".configuration").html(obj.controllerCode);
					$listModule.find(".view").html(obj.template);
					$listModule.removeClass("lmcms_module_new");
				}

				$("#embedContent_param_modal").modal("hide");
			}else{
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
	$("#embedContent_param_modal").modal("hide");
}

/**
 * 分页组件
 */
function paginationModule(){
    var $module=$(".demo .lmcms_module_new.lmcms_module_pagination");

    if($module.length==0){
        return;
    }

    var setting = {
        check: {
            enable: true,
            chkStyle: "radio",
            radioType: "all"
        },
        view: {
            dblClickExpand: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onCheck: function (e) { onCheck(e,"paginationCatTree","paginationCatId","paginationCatName"); }
        }
    };

    $.ajax({
        type:'get',
        url:contextpath+"/contentCatController/treeData.do",
        dataType:'text',
        success:function(data){
            var obj = JSON.parse(eval(data));
            if(obj.isSuccess){
                var zNodes=obj.ztreeData;
                $("#pagination_param_modal #paginationCatName").val("");
                $("#pagination_param_modal #paginationCatId").val("");
                $("#pagination_param_modal #paginationParamsId").val("");
                $("#pagination_param_modal #paginationModuleId").val("");
                $("#pagination_param_modal #paginationModuleKey").val("lmcms_module_pagination");
                $("#pagination_param_modal").modal("show");
                setTimeout(function (){
                    $.fn.zTree.init($("#paginationCatTree"), setting, zNodes);
                },500);
            }else{
                lmAlert(obj.msg);
            }
        },error:function(){
            lmAlert("栏目加载失败，暂时无法使用此组件");
            $(".demo .lmcms_module_new.lmcms_module_pagination").remove()
        }
    });
}

function imageModule(){
	var $module=$(".demo .lmcms_module_new.lmcms_module_image");

	if($module.length==0){
		return;
	}

	$("#image_param_modal #imageParamsId").val("");
	$("#image_param_modal #imageUrl").val("");
	$("#image_param_modal #imageModuleId").val("");
	$("#image_param_modal #imageWidth").val("");
	$("#image_param_modal #imageHeight").val("");
	$("#image_param_modal #imageDescription").val("");
	$("#image_param_modal #linkUrl").val("");
	$("#blank").removeAttr("checked");

	$("#image_param_modal").modal("show");

	setTimeout(function (){initUploadImage();},500);

}

function diyCodeModule(){
	var $module=$(".demo .lmcms_module_new.lmcms_module_diy_code");

	if($module.length==0){
		return;
	}
	$("#editTemplate #id").val("");
	$("#editTemplate .diy_textarea").val("");
	$("#editTemplate input[name='moduleKey']").val("lmcms_module_diy_code");
	$("#editTemplate").modal("show");
}

function htmlModule(){
	var $listModule=$(".demo .lmcms_module_new.lmcms_module_html");

	if($listModule.length==0){
		return;
	}
	ueditor.setContent("");
	htmlModuleView=null;
	$("#editorModal").modal("show");

}

function onClick(e,treeId, catId, catName) {
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	var nodes = zTree.getCheckedNodes(true);
	var v = "";
	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
	}
	if (v.length > 0) {
		v = v.substring(0, v.length - 1);
	}
	$("#"+catName).val(v);

}
function onCheck(e,treeId, catId, catName) {
	var zTree = $.fn.zTree.getZTreeObj(treeId),
		nodes = zTree.getCheckedNodes(true),
		catNames = "",catIds="";
	for (var i=0, l=nodes.length; i<l; i++) {
		catNames += nodes[i].name + ",";
		catIds+=nodes[i].id+",";
	}
	if (catNames.length > 0 ){
		catNames = catNames.substring(0, catNames.length-1);
		catIds=catIds.substring(0,catIds.length-1);
	}
	$("#"+catName).val(catNames);
	$("#"+catId).val(catIds);

}
function showMenu(menuContent,catNmae) {
	var catName = $("#"+catNmae);
	$("#"+menuContent).css({left:"0px", top:catName.outerHeight() + "px"}).slideDown("fast");
	$("body").bind("mousedown", function (e){onBodyDown(e,menuContent);});
}
function hideMenu(menuContent) {
	$("#"+menuContent).fadeOut("fast");
	$("body").unbind("mousedown", function (e){onBodyDown(e,menuContent);});
}
function onBodyDown(event,menuContent) {
	if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#"+menuContent).length>0)) {
		hideMenu(menuContent);
	}
}

function listModule(){
	var $listModule=$(".demo .lmcms_module_new.lmcms_module_list");

	if($listModule.length==0){
		return;
	}

	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: function (e) { onCheck(e,"treeDemo","catId","catName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/contentCatController/treeData.do",
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#content_param_modal #catName").val("");
				$("#content_param_modal #catId").val("");
				$("#content_param_modal #paramsId").val("");
				$("#content_param_modal #moduleId").val("");
				$("#content_param_modal #imageFalse").click();
				$("#content_param_modal #moduleKey").val("lmcms_module_list");
				$("#content_param_modal #count").val("10");
				$("#content_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("栏目加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_list").remove()
		}
	});
}
/*图文*/
function imageNewsListModule(){
	var $listModule=$(".demo .lmcms_module_new.lmcms_module_image_news_list");

	if($listModule.length==0){
		return;
	}
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
            onCheck: function (e) { onCheck(e,"treeDemo","catId","catName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/contentCatController/treeData.do",
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#content_param_modal #catName").val("");
				$("#content_param_modal #catId").val("");
				$("#content_param_modal #paramsId").val("");
				$("#content_param_modal #moduleId").val("");
				$("#content_param_modal #imageTrue").click();
				$("#content_param_modal #moduleKey").val("lmcms_module_image_news_list");
				$("#content_param_modal #count").val("10");
				$("#content_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("栏目加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_image_news_list").remove()
		}
	});
}

/**
 * 关闭导航参数窗口
 */
function closeNavParamModal(){
	var navTitleId = $("#navTitleId").val();
	var token = "token";
	if(navTitleId==token){
		$(".demo .lmcms_module_nav").remove();
	}

}

/**
 * 关闭单篇文章参数窗口
 */
function closeEmbedContentParamModal(){
	var contentId = $("#embedContentModuleContentId").val();
	if(!contentId){
		$(".demo .lmcms_module_singleContent").remove();
	}

}

/*图片列表*/
function imagesListModule(){
	var $listModule=$(".demo .lmcms_module_new.lmcms_module_imags_list ");

	if($listModule.length==0){
		return;
	}
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: function (e) { onCheck(e,"treeDemo","catId","catName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/contentCatController/treeData.do",
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#content_param_modal #catName").val("");
				$("#content_param_modal #catId").val("");
				$("#content_param_modal #paramsId").val("");
				$("#content_param_modal #moduleId").val("");
				$("#content_param_modal #imageTrue").click();
				$("#content_param_modal #moduleKey").val("lmcms_module_imags_list");
				$("#content_param_modal #count").val("4");
				$("#content_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("栏目加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_imags_list").remove()
		}
	});
}

/**
 * 保存导航参数数据
 */
var saveNavParam = function (){
	var navTitleArray=$("#navParamForm input[name='navTitle']");
	var flag=true;
	navTitleArray.each(function (){
		if(!$(this).val()){
			lmAlert("标题不能为空，请完善！");
			flag=false;
			return false;
		}
	})
	if(!flag){
		return;
	}
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/saveNavModuleParams.do?templateId="+template_id,
		data:$("#navParamForm").serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if(obj.isSuccess){
				if($("#navParamForm #navModuleId").val()){
					var $module=$("#"+$("#navParamForm #navModuleId").val());
					$module.find(".view").html(obj.template);
				}else{
					var $module=$(".lmcms_module_nav");
					$module.attr("id",obj.id);
					$("#navModuleId").val(obj.id);
					$module.find(".configuration").html(obj.controllerCode);
					$module.find(".view").html(obj.template);
					$module.removeClass("lmcms_module_new");
				}

				$("#nav_param_modal").modal("hide");
			}else{
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}


/**
 * 重新计算每一个导航数据位置编号
 */
var changeNavNum=function (){
	$('#navParamForm .navNum').each(function(index){
		$(this).text(index+1);
	});

}

/**
 * 显示导航参数数据
 * @param list 导航参数数据
 */
var showNavParams = function (toKen,list){
	$("#navParamForm .row-fluid").remove();
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: function (e) { onCheck(e,"navTreeDemo","navCatId","navCatName"); }
		}
	};
	$.ajax({
		type:'get',
		url:contextpath+"/contentCatController/treeData.do",
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				setTimeout(function (){
					$.fn.zTree.init($("#navTreeDemo"), setting, zNodes);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("栏目加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_nav").remove()
		}
	});
	if (toKen==1) {
		$("#navTitleId").val("token");
		var listLength = 1;
		$("#listCount").val(listLength);
		for (var i = 0; i < 2; i++) {
			var view=$("#nav_param_modal .navDemo").clone().removeClass("navDemo");
			var param=list[i];
			view.find("input[name='blank']").attr("name","blank_"+i+"");
			if(param){
				var title=param.title;
				var linkUrl=param.linkUrl;
				var blank=param.blank;
				var paramId=param.paramsId;
				view.find("input[name='navTitle']").val(title);
				view.find("input[name='navParamsId']").val(paramId);
				view.find("input[name='linkUrl']").val(linkUrl);
				if(blank==1){
					view.find("input[name='blank_"+i+"']").attr("checked","checked");
					view.find("input[name='blank_"+i+"']").val(1);
				}
			}
			view.show();
			$("#navParamForm").append(view);
		}
	}else{
		var listLength = list.length;
		debugger;
		$("#listCount").val(listLength-1);
		for (var i = 0; i < list.length; i++) {
			var view=$("#nav_param_modal .navDemo").clone().removeClass("navDemo");
			var param=list[i];
			view.find("input[name='blank']").attr("name","blank_"+i+"");
			if(param){
				var title=param.title;
				var linkUrl=param.linkUrl;
				var blank=param.blank;
				var paramId=param.paramsId;
				$("#navTitleId").val(paramId);
				view.find("input[name='navTitle']").val(title);
				view.find("input[name='navParamsId']").val(paramId);
				view.find("input[name='linkUrl']").val(linkUrl);

				if(blank==1){
					view.find("input[name='blank_"+i+"']").attr("checked","checked");
					view.find("input[name='blank_"+i+"']").val(1);
				}
			}
			view.show();
			$("#navParamForm").append(view);
		}
	}

	changeNavNum();
}

/**
 *显示导航参数编辑界面
 */
var showNav = function (){

	<!--清除隐藏域-->
	$("#navCatId").val('');
	$("#navCatName").val('-----选择栏目-----');
	var id = $(this).parent().parent().attr("id");//获取当前导航组件的id
	$.ajax({
		type:'get',
		url:contextpath+"/visibleModuleController/navModuleParams.do?moduleId="+id,
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				$("#nav_param_modal #navModuleId").val(obj.moduleId);
				showNavParams(0,obj.navList);
				$("#nav_param_modal").modal("show");
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("导航加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_nav").remove()
		}
	});

}

/**
 * 添加导航参数
 */
function addNavParam(){
	var catId = $("#navCatId").val();
	var catName = $("#navCatName").val();
	var listCount = $("#listCount").val();
	var count = parseInt(listCount);
	if(!catId){
		lmAlert("请选择栏目");
		return;
	}
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/getNavCatParam.do",
		data:{'catId':catId,"templateId":template_id},
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var catUrl = obj.catUrl;
				var domain = obj.domain;
				count = count+1;
				var view=$("#nav_param_modal .navDemo").clone().removeClass("navDemo");
				view.find("input[name='navTitle']").val(catName);
				view.find("input[name='linkUrl']").val(domain+catUrl);
				view.find("input[name='blank']").attr("name","blank_"+count+"");
				view.find("input[name='navParamsId']").val(obj.paramId);
				view.show();
				$("#navParamForm").append(view);
				$("#listCount").val(count);
				changeNavNum();

			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("栏目加载失败，暂时无法使用此组件");
			$(".demo .lmcms_module_new.lmcms_module_nav").remove()
		}
	});
}

var ueditor;
var htmlModuleView;
$(document).ready(function() {
	$(".demo").html($("#download-layout").children().html());
	ueditor = UE.getEditor('contenteditor',{initialFrameHeight:250,topOffset:0});
	initModuleControllerMap();

	if(moduleControllerMap){
		$.each(moduleControllerMap,function(name,value) {
			$(".demo ."+name).find(".configuration").html(value);
		});
	}
	$("body").css("min-height", $(window).height() - 90);
	$(".demo").css("min-height", $(window).height() - 160);
	$(".sidebar-nav .lyrow").draggable({
		connectToSortable: ".demo",
		helper: "clone",
		handle: ".drag",
		start: function(e,t) {
			if (!startdrag) stopsave++;
			startdrag = 1;
		},
		drag: function(e, t) {
			t.helper.width(400)
		},
		stop: function(e, t) {
			$(".demo .column").sortable({
				opacity: .35,
				connectWith: ".column",
				start: function(e,t) {
					if (!startdrag) stopsave++;
					startdrag = 1;
				},
				stop: function(e,t) {
					if(stopsave>0) stopsave--;
					startdrag = 0;
				}
			});
			if(stopsave>0) stopsave--;
			startdrag = 0;
		}
	});
	$(".sidebar-nav .box").draggable({
		connectToSortable: ".column",
		helper: "clone",
		handle: ".drag",
		start: function(e,t) {
			if (!startdrag) stopsave++;
			startdrag = 1;
		},
		drag: function(e, t) {
			t.helper.width(400)
		},
		stop: function() {
			handleJsIds();
			handleModule();//处理拖拽的组件
			if(stopsave>0) stopsave--;
			startdrag = 0;
		}
	});
	initContainer();
	$('body.edit .demo').on("click","[data-target=#editorModal]",function(e) {
		e.preventDefault();
		htmlModuleView=$(this).parent().parent();
		currenteditor = htmlModuleView.find('.view');
		var eText = currenteditor.html();
		ueditor.setContent(eText);
	});
	$("#savecontent").click(function(e) {
		e.preventDefault();

		if(htmlModuleView){
			htmlModuleView.find(".view").html(ueditor.getContent());
			return;
		}

		$.ajax({
			type: "post",
			url: contextpath + "/visibleModuleController/saveHtmlModule.do",
			data: {html: ueditor.getContent()},
			dataType: "text",
			success: function (data) {
				var obj = JSON.parse(eval(data));
				if (obj.isSuccess) {
					var	module = $(".demo .lmcms_module_new.lmcms_module_html").removeClass("lmcms_module_new");
					module.find(".configuration").html(obj.controllerCode);
					module.find(".view").html(obj.template);
				} else {
					lmAlert(obj.msg);
				}
			}
		})
	});
	$(".closeCKEditor").click(function(e) {
		e.preventDefault();
		if(!htmlModuleView || !htmlModuleView.attr(id)){
			$(".demo .lmcms_module_new.lmcms_module_html").remove();
		}
	});
	$(".downloadModal").click(function(e) {
		e.preventDefault();
		downloadLayoutSrc();
	});
	$(".downloadVisibleTemplateModal").click(function (e){
		e.preventDefault();
		downloadVisibleTemplate();
	});

	//导航处理相关 开始
	$("body.edit .demo").on("click","[data-target=#editNav]",showNav)
	$("#nav_param_modal").on("click",".addNav",function (){
		var view=$(this).parent().parent().clone();
		view.find(":input").val('').removeAttr('checked').removeAttr('selected');
		view.hide();
		$(this).parent().parent().after(view);
		view.slideDown(200,function (){
			changeNavNum();
		});
	})
	$("#nav_param_modal").on("click",".upNav",function (){
		var prev=$(this).parent().parent().prev(".row-fluid");
		if(prev){
			$(this).parent().parent().insertBefore(prev);
			changeNavNum();
		}
	})
	$("#nav_param_modal").on("click",".downNav",function (){
		var next=$(this).parent().parent().next(".row-fluid");
		if(next){
			$(this).parent().parent().insertAfter(next);
			changeNavNum();
		}
	})
	$("#nav_param_modal").on("click",".removeNav",function (){
		if($("#navParamForm .row-fluid").length==2){
			lmAlert("导航数据最少要保留两个！");
			return ;
		}
		$(this).parent().parent().slideUp(160,function (){
			$(this).remove();
			changeNavNum();
		});
	})
	/**编辑单篇文章*/
	function toEditEmbedContent(id){

		embedContentModule(id);

		setTimeout(function (){
			shoeEembedContentModule(id);
		},50);
	}

	//导航处理相关 结束

	$('body.edit .demo').on("click","[data-target=#editTemplate]",function(e) {
		e.preventDefault();
		var id=$(this).parent().parent().attr('id');
		if(id){
			var flag=true;
			$.ajax({
				type:'get',
				async:false,
				url:contextpath+"/visibleModuleController/moduleInfo.do?id="+id,
				dataType:'text',
				success:function(data){
					var obj = JSON.parse(eval(data));
					if(obj.isSuccess){
						$("#moduleForm #id").val(obj.id);
						$("#moduleForm textarea").val(obj.templateTemp);
					}else{
						flag=false;
						lmAlert(obj.msg);
					}
				}
			});
			return flag;
		}
	});
	$('body.edit .demo').on("click","[data-target=#editParams]",function(e) {
		e.preventDefault();
		var id=$(this).parent().parent().attr('id');
		if(id){
			showModuleParams(id);
		}
	});
	$('body.edit .demo').on("click","[data-target=#editpagination]",function(e) {
		e.preventDefault();
		var id=$(this).parent().parent().attr('id');
		if(id){
			showPaginationParams(id);
		}
	});
	<!--显示分页列表数据-->
	$('body.edit .demo').on("click","[data-target=#editContentListParams]",function(e) {
		e.preventDefault();
		var id=$(this).parent().parent().attr('id');
		if(id){
			showContentlistParams(id);
		}
	});
	<!--图片组件参数编辑-->
	$('body.edit .demo').on("click","[data-target=#editImageParams]",function(e) {
		e.preventDefault();
		var id=$(this).parent().parent().attr('id');
		if(id){
			showImageModuleParams(id);
		}
	});
	<!--单篇文章组件参数编辑-->
	$('body.edit .demo').on("click","[data-target=#editEmbedContentParams]",function(e) {
		e.preventDefault();
		var id=$(this).parent().parent().attr('id');
		if(id){
			toEditEmbedContent(id);
		}
	});

	$("#edit").click(function() {
		$("body").removeClass("devpreview sourcepreview");
		$("body").addClass("edit");
		removeMenuClasses();
		$(this).addClass("active");
		return false
	});
	$("#clear").click(function(e) {
		e.preventDefault();
		clearDemo()
	});
	$("#devpreview").click(function() {
		$("body").removeClass("edit sourcepreview");
		$("body").addClass("devpreview");
		removeMenuClasses();
		$(this).addClass("active");
		return false
	});
	$("#sourcepreview").click(function() {

		downloadLayoutSrc();
		var template=$("#downloadModal .diy_textarea").val();

		$.ajax({
			type: "POST",
			url: contextpath+'/visibleTemplateController/preview.do',
			data: {template :template,id:template_id},
			success: function(html) {
				var obj = window.open(contextpath+'/visibleTemplateController/preview.do',"_blank");
				obj.document.write(html);
			}
		});
		return false
	});
	$("#fluidPage").click(function(e) {
		e.preventDefault();

		changeStructure("container", "container-fluid");
		$("#fixedPage").removeClass("active");
		$(this).addClass("active");
		downloadLayoutSrc()
	});
	$("#fixedPage").click(function(e) {
		e.preventDefault();

		changeStructure("container-fluid", "container");

		//$("#download-layout ." + e).removeClass(e).addClass(t)
		$("#fluidPage").removeClass("active");
		$(this).addClass("active");
		downloadLayoutSrc()
	});
	$(".nav-header").click(function() {
		$(".sidebar-nav .boxes, .sidebar-nav .rows").hide();
		$(this).next().slideDown()
	});
	$('#undo').click(function(){
		stopsave++;
		if (undoLayout()) initContainer();
		stopsave--;
	});
	$('#redo').click(function(){
		stopsave++;
		if (redoLayout()) initContainer();
		stopsave--;
	});
	removeElm();
	gridSystemGenerator();

})

var moduleControllerMap;

function initModuleControllerMap(){
	$.ajax({
		type:'get',
		async:false,
		url:contextpath+"/visibleTemplateModuleController/moduleControllerMap.do",
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				moduleControllerMap=obj;
			}else{
				lmAlert(obj.msg);
			}
		}
	});
}

/**
 * 保存模板
 */
function submitTemplate(){
	downloadLayoutSrc("1");
	var template=$("#downloadModal .diy_textarea").val();

	downloadVisibleTemplate();
	var visibleTemplate=$("#downloadModal .diy_textarea").val();

	var moduleArray=$(".demo div[modulekey]");//当前模板中现在存在的模板组件

	var moduleIds=new Array();

	for(var i=0;i<moduleArray.length;i++){
		moduleIds.push($(moduleArray[i]).attr("id"));
	}
	$.ajax({
		type:'post',
		url:contextpath+"/visibleTemplateController/saveTemplate.do?id="+template_id,
		data:{'template':template,'visibleTemplate':visibleTemplate,"moduleIds":moduleIds.toString()},
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			lmAlert(obj.msg);
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});

}

function submitTemplateModule(){
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/editDIYTemplateModule.do?templateId="+template_id,
		data:$('#moduleForm').serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if (obj.isSuccess) {
				if ($("#moduleForm #id").val()) {
					$(".box-element[id='" + obj.id + "']").children(".view").html(obj.html);
				} else {
					var $diyCode=$(".demo .lmcms_module_new.lmcms_module_diy_code");
					$diyCode.attr("id", obj.id).removeClass("lmcms_module_new").children(".view").html(obj.html);
					$diyCode.find(".configuration").html(obj.controllerCode);
				}
				$("#editTemplate").modal("hide");
			} else {
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}

function closeTemplateModule(){
	if(!$("#editTemplate #id").val()){
		$(".demo .lmcms_module_new.lmcms_module_diy_code").remove();
	}
}
/**
 * 保存分页参数
 **/
function savePaginationParam(){
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/savePaginationParam.do?templateId="+template_id,
		data:$("#paginationParamForm").serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if(obj.isSuccess){
				if($("#paginationParamForm #paginationModuleId").val()){
					var $module=$("#"+$("#paginationParamForm #paginationModuleId").val());
					$module.find(".view").html(obj.template);
				}else{
					var $listModule=$(".demo .lmcms_module_new."+$("#paginationParamForm #paginationModuleKey").val());
					$listModule.attr("id",obj.id);
					$listModule.find(".configuration").html(obj.controllerCode);
					$listModule.find(".view").html(obj.template);
					$listModule.removeClass("lmcms_module_new");
				}

				$("#pagination_param_modal").modal("hide");
			}else{
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}


/**
 * 保存内容参数
 */
function saveContentParam(){
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/saveModuleAndParam.do?templateId="+template_id,
		data:$("#paramForm").serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if(obj.isSuccess){
				if($("#paramForm #moduleId").val()){
					var $module=$("#"+$("#paramForm #moduleId").val());
					$module.find(".view").html(obj.template);
				}else{
					var $listModule=$(".demo .lmcms_module_new."+$("#paramForm #moduleKey").val());
					$listModule.attr("id",obj.id);
					$listModule.find(".configuration").html(obj.controllerCode);
					$listModule.find(".view").html(obj.template);
					$listModule.removeClass("lmcms_module_new");
				}

				$("#content_param_modal").modal("hide");
			}else{
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}

/**
 * 关闭参数窗口
 */
function closeParamModal(){

	//如果遇到新添加的组件，直接关闭则删除刚添加的组件
	var module_id=$("#content_param_modal #module_id").val();
	if(!module_id){
		$(".demo .lmcms_module_new").remove();
	}

}

/**
 * 展示组件的参数进行二次编辑
 * @param id 组件id
 */
function showModuleParams(id){
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
            onCheck: function (e) { onCheck(e,"treeDemo","catId","catName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/visibleModuleController/moduleParams.do?moduleId="+id,
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#content_param_modal #catName").val("");
				$("#content_param_modal #catId").val(obj.catId);
				$("#content_param_modal #paramsId").val(obj.paramsId);
				$("#content_param_modal #moduleId").val(obj.moduleId);
				$("#content_param_modal #moduleKey").val(obj.moduleKey);
				$("#content_param_modal #count").val(obj.count);

				if(obj.image===0){
					$("#imageFalse").click();
				}else{
					$("#imageTrue").click();
				}

				$("#content_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					var nodes = zTree.getCheckedNodes(true);
					var v = "";
					for (var i = 0, l = nodes.length; i < l; i++) {
						v += nodes[i].name + ",";
					}
					if (v.length > 0) {
						v = v.substring(0, v.length - 1);
					}
					$("#catName").val(v);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("参数获取失败！");
		}
	});
}
<!--显示分页组件参数-->
function showPaginationParams(id){
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: function (e) { onCheck(e,"paginationCatTree","paginationCatId","paginationCatName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/visibleModuleController/moduleParams.do?moduleId="+id,
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#pagination_param_modal #paginationCatName").val("");
				$("#pagination_param_modal #paginationCatId").val(obj.catId);
				$("#pagination_param_modal #paginationParamsId").val(obj.paramsId);
				$("#pagination_param_modal #paginationModuleId").val(obj.moduleId);
				$("#pagination_param_modal #paginationModuleKey").val(obj.moduleKey);
				$("#pagination_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#paginationCatTree"), setting, zNodes);
					var zTree = $.fn.zTree.getZTreeObj("paginationCatTree");
					var nodes = zTree.getCheckedNodes(true);
					var v = "";
					for (var i = 0, l = nodes.length; i < l; i++) {
						v += nodes[i].name + ",";
					}
					if (v.length > 0) {
						v = v.substring(0, v.length - 1);
					}
					$("#paginationCatName").val(v);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("参数获取失败！");
		}
	});
}
<!--显示分页列表参数-->
function showContentlistParams(id){
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: function (e) { onCheck(e,"contentListCatTree","contentListCatId","contentListCatName"); }
		}
	};

	$.ajax({
		type:'get',
		url:contextpath+"/visibleModuleController/moduleParams.do?moduleId="+id,
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				var zNodes=obj.ztreeData;
				$("#contentList_param_modal #contentListCatId").val(obj.catId);
				$("#contentList_param_modal #contentListParamsId").val(obj.paramsId);
				$("#contentList_param_modal #contentListModuleId").val(obj.moduleId);
				$("#contentList_param_modal #contentListModuleKey").val(obj.moduleKey);
				$("#contentList_param_modal #contentListCount").val(obj.count);
				$("#contentList_param_modal").modal("show");
				setTimeout(function (){
					$.fn.zTree.init($("#contentListCatTree"), setting, zNodes);
					var zTree = $.fn.zTree.getZTreeObj("contentListCatTree");
					var nodes = zTree.getCheckedNodes(true);
					var v = "";
					for (var i = 0, l = nodes.length; i < l; i++) {
						v += nodes[i].name + ",";
					}
					if (v.length > 0) {
						v = v.substring(0, v.length - 1);
					}
					$("#contentListCatName").val(v);
				},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("参数获取失败！");
		}
	});
}
/**
 * 关闭图片参数模态框
 */
function closeImageParamModal(){
	if(!$("#imageModuleId").val()){
		$(".demo .lmcms_module_new.lmcms_module_image").remove();
	}
}
/**
 * 关闭分页列表模态框
 */
function closeContentListParamModal(){
	if(!$("#contentListModuleKey").val()){
		$(".demo .lmcms_module_new.lmcms_module_content_list").remove();
	}
}
/**
 * 保存图片参数
 */
function saveImageParam(){
	var imageUrl=$("#imageUrl").val();
	if(!imageUrl){
		lmAlert("图片地址不能为空，请完善！");
		return ;
	}

	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/saveImageModuleAndParam.do?templateId="+template_id,
		data:$("#imageParamForm").serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if(obj.isSuccess){
				if($("#imageParamForm #imageModuleId").val()){
					var $module=$("#"+$("#imageParamForm #imageModuleId").val());
					$module.find(".view").html(obj.template);
				}else{
					var $module=$(".demo .lmcms_module_new.lmcms_module_image");
					$module.attr("id",obj.id);
					$module.find(".configuration").html(obj.controllerCode);
					$module.find(".view").html(obj.template);
					$module.removeClass("lmcms_module_new");
				}

				$("#image_param_modal").modal("hide");
			}else{
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});

}

/**
 * 显示图片组件参数
 * @param id
 */
function showImageModuleParams(id){
	$.ajax({
		type:'get',
		url:contextpath+"/visibleModuleController/imageModuleParams.do?moduleId="+id,
		dataType:'text',
		success:function(data){
			var obj = JSON.parse(eval(data));
			if(obj.isSuccess){
				$("#image_param_modal #imageParamsId").val(obj.paramsId);
				$("#image_param_modal #imageUrl").val(obj.imageUrl);
				$("#image_param_modal #imageModuleId").val(obj.moduleId);
				$("#image_param_modal #imageWidth").val(obj.width);
				$("#image_param_modal #imageHeight").val(obj.height);
				$("#image_param_modal #imageDescription").val(obj.title);
				$("#image_param_modal #linkUrl").val(obj.linkUrl);

				if(obj.blank===1){
					$("#blank").attr("checked","checked");
				}else{
					$("#blank").removeAttr("checked");
				}

				$("#image_param_modal").modal("show");
				setTimeout(function (){initUploadImage();},500);
			}else{
				lmAlert(obj.msg);
			}
		},error:function(){
			lmAlert("参数获取失败！");
		}
	});
}
/**
 * 保存列表分页参数
 * */
function saveContentListParam(){
	$.ajax({
		type:'post',
		url:contextpath+"/visibleModuleController/saveContentListparam.do?templateId="+template_id,
		data:$("#contentListForm").serialize(),
		success:function(msg){
			var obj = JSON.parse(eval(msg));
			if(obj.isSuccess){
				if($("#contentListForm #contentListModuleId").val()){
					var $module=$("#"+$("#contentListForm #contentListModuleId").val());
					$module.find(".view").html(obj.template);
				}else{
					var $module=$(".demo .lmcms_module_new.lmcms_module_content_list");
					$module.attr("id",obj.id);
					$module.find(".configuration").html(obj.controllerCode);
					$module.find(".view").html(obj.template);
					$module.removeClass("lmcms_module_new");
				}

				$("#contentList_param_modal").modal("hide");
			}else{
				lmAlert(obj.msg);
			}
		},
		error:function(){
			lmAlert("提交通讯失败!");
		}
	});
}