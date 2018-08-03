<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link rel="stylesheet" type="text/css" href="${base}/res/css/main.css" />
<script>
var contextpath="${contextpath}";
	function changepic(obj, img) {
		obj.src = img;
	}
</script>
<script type="text/javascript">
	function settab_xbingjs(name, num, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "xbingjs" + i);
			menu.className = i == num ? "on_xbingjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}

	function settab_xbingjs1(name, num, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "xbingjs1" + i);
			menu.className = i == num ? "on_xbingjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}

	function settab_xbingjs2(name, num, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById(name + "_" + "xbingjs2" + i);
			menu.className = i == num ? "on_xbingjs" : "";
			con.style.display = i == num ? "block" : "none";
		}
	}
</script>
</head>
<body>
<#include "wwwroot/${sitePath}/template/logoAndSearch.html"> 
<#include "wwwroot/${sitePath}/template/nav.html">
<div id="maincontent">
	<div id="leftcontent">
		<#include "menu.ftl">
	</div>
	<div id="rightcontent">
		
	</div>
	<div class="clear"></div>
</div>
<#include "inc/footer.html">
</body>
</html>
<link href="${base}/res/css/global.css" rel="stylesheet" type="text/css" />
<link href="${base}/res/css/reginfo.css" rel="stylesheet" type="text/css" />
<link href="${base}/res/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextpath}/js/form-validation.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<link href="${contextpath}/plug-in/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${base}/res/js/lmJs.js"></script>
<!-- 表单校验 -->
<script type="text/javascript" src="${base}/res/js/reg.js"></script>
<script type="text/javascript" src="${contextpath}/media/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${contextpath}/media/js/messages_cn.js"></script>
<script type="text/javascript" src="${contextpath}/media/js/additional-methods.min.js"></script>
<script type="text/javascript" src="${contextpath}/media/js/select2.min.js"></script>
<script type="text/javascript" src="${contextpath}/media/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="${contextpath}/media/js/app.js"></script>
<script type="text/javascript" src="${base}/res/js/member.js"></script>
