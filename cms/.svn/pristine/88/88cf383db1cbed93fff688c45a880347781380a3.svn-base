Cms = {};

/**
 * 投票列表
 * 
 * @param base
 * @param vote
 *            列表展示位置
 * @param contentid
 *            文章id
 */
Cms.voteList = function(vote, contentid,siteId,domain) {
	vote = vote || "votecontent";
	alert('${domain}');
	$("#" + vote).load(domain/contextpath+"/front/voteTagAct.do?getVote&siteId="+siteId, {
		contentid : contentid
	});
};

/**
 * 提交评论
 * 
 * @param callback
 *            成功回调函数
 * @param form
 *            表单
 */
Cms.comment = function(callback,form) {
	form = form || "commentForm";
	$.ajax({
		type : 'post',
		url : ${domain}/contextpath+"/front/commentaryTagAct.do?addCommentary&contentId="+contentId,
		data : $('#' + form).serialize(),
		dataType: "text",
		success : callback,
		error : function() {
			alert("提交通讯失败!");
		}
	});
};

/**
 * 获取总评论数
 * 
 * @param id
 *            用于显示数量的标签id
 */
Cms.commentSize = function(id) {
	id = id || "s_commentsize";
	$.ajax({
		type : 'post',
		url : ${domain}/contextpath+"/front/commentaryTagAct.do?getCommentSize&t="+new Date().getTime(),
		data : {"contentId": contentId},
		success : function(size) {
			$("#" + id).text(size);
		}
	});
};

/**
 * 获取评论列表
 * 
 * @param id
 *            展示评论列表的容器id
 */
Cms.commentList = function(id, option) {
	id = id || "commentListContainer";
	$("#" + id).load(${domain}/contextpath+"/front/commentaryTagAct.do?getCommentList&t="+new Date().getTime(), option);
};

/**
 * 提交调查
 * 
 * @param callback
 *            成功回调函数
 * @param form
 *            表单
 */
Cms.survey = function(callback,form) {
	form = form || "surveyForm";
	$.ajax({
		type : 'post',
		url : ${domain}/contextpath+"/front/surveyTagAct.do?saveSurvey",
		data : $('#' + form).serialize(),
		dataType: "text",
		success : callback,
		error : function() {
			alert("提交通讯失败!");
		}
	});
};

/**
 * 加载视频播放器
 * @param div
 * @param videourl
 */
Cms.loadPlayer = function(div,videourl){
	$("#" + div).load(${domain}/contextpath+"/front/videoTagData.do?getVideo", {
		videourl:videourl
	});
};

/**
 * 获取评论表单及列表
 * 
 * @param id
 *            展示评论表单及列表的容器id
 */
Cms.commentForm = function(id) {
	id = id || "commentContainer";
	$("#" + id).load(${domain}/contextpath+"/front/commentaryTagAct.do?getCommentForm&contentId="+contentId+"&t="+new Date().getTime());
};

Cms.stats = function(){
	var param;
	//当前url
	var url = window.location.href;

	//操作系统
	var platform = window.navigator.platform;


	//浏览器语言
	var  language = window.navigator.language;


	//浏览器名称
	var browserName = getBrowserInfo();
	//分辨率
	var h = window.screen.height;
	var w = window.screen.width;
	var screen = h+"*"+w;
	// 来检测当前浏览器是否支持 Java小程序
	var javaEnabled = window.navigator.javaEnabled();

	//获取上一页域名


	//引用页
	var refeUrl= getReferer();
	//获取颜色深度
	var colorDepth = window.screen.colorDepth;
	//获取cookie是否启动
	var ckeTrue = window.navigator.cookieEnabled;
	var fls = flashChecker();
	var flashTrue = fls.f;
	var flashVersions = fls.v;
	param = "&url="+url+"&language="+language+"&platform="+platform
		+"&browserName="+browserName+"&screen="+screen+"&javaEnabled="+javaEnabled+"&refeUrl="+refeUrl+"&colorDepth="+colorDepth
		+"&ckeTrue="+ckeTrue+"&flashTrue="+flashTrue+"&flashVersions="+flashVersions;
	return param;
} ;
function getReferer(){
	if(document.referrer){
		return document.referrer;
	}else{
		return '0';
	}
}

function flashChecker() {
	var hasFlash = 0;         //是否安装了flash
	var flashVersion = 0; //flash版本
	var isIE = /*@cc_on!@*/0;      //是否IE浏览器

	if (isIE) {
		var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
		if (swf) {
			hasFlash = 1;
			VSwf = swf.GetVariable("$version");
			flashVersion = parseInt(VSwf.split(" ")[1].split(",")[0]);
		}
	} else {
		if (navigator.plugins && navigator.plugins.length > 0) {
			var swf = navigator.plugins["Shockwave Flash"];
			if (swf) {
				hasFlash = 1;
				var words = swf.description.split(" ");
				for (var i = 0; i < words.length; ++i) {
					if (isNaN(parseInt(words[i]))) continue;
					flashVersion = parseInt(words[i]);
				}
			}
		}
	}
	return { f: hasFlash, v: flashVersion };
}

function getBrowserInfo()
{
	var agent = navigator.userAgent.toLowerCase() ;
//IE
	if(agent.indexOf("msie") > 0)
	{
		return "ie浏览器" ;
	}

//firefox
	if(agent.indexOf("firefox") > 0)
	{
		return "火狐浏览器" ;
	}

//Chrome
	if(agent.indexOf("chrome") > 0)
	{
		return "谷歌浏览器" ;
	}

//Safari
	if(agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0)
	{
		return "safari浏览器" ;
	}

}