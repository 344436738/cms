<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>${contentF.title!''}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" href="${domain}/${contextpath}/media/image/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${domain}/css/main.css" />

<link href="${domain}/css/top.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${domain}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${domain}/static/js/front.js"></script>
<style type="text/css">
.newsTex/*内容标题*/{ width:97%; margin:auto;padding:10px 0 20px 0;}
.newsTex li{width: 100%;}
.newsTex h1{ font-size:28px; padding:20px 0; font-family:"微软雅黑","黑体"; text-align:center; line-height:30px;}
.newsTex a{ text-decoration:none; color:#122e67; font-size:14px; cursor:pointer;}
.newsTex a:hover{color:#c50b0e;}
.newsTex vote_name{margin-top:10px;font-size: 20px;float: left;}
.newsTex vote_result{float:right;}
.progress{width:100%;background-color: #eee;float:left;margin-bottom: 0px;height: 18px;margin-top: 6px;margin-right: 7px;}
.per{background-color: #3C6CAC;height: 18px;}
 #keyword2{height:22px;background:url(../images/img/bg-search.png) no-repeat;
width:214px;border:1px solid #0A89B1;
        }
</style>
</head>
<script>
	var contextpath='${contextpath}';
	function changepic(obj, img) {
		obj.src = img;
	}
</script>
	
<body>
<#include "/pc/section/menu.html">

	<div class="div_mid" >
		<div class="div_main">
			<div class="div_midleft">
				<div class="newsTex" style="padding-left:0px; width:1000px">
					<ul>
						<#list surveyOptionList as so>
							<li>
								<div class="vote_name" style="color: #1c77ba;">
									<h3>${so.optionname} </h3>
								</div>
								<#list so.optionextList as ol>
									<#list mapList as map>
										<#if ol.id==map.ids>
											<div class="vote_name">
												<h4 style="margin: 0px;">${ol_index+1}、${ol.extOptionname} </h4>
											</div>
											<div class="vote_result">
												<div class="progress" title="${map.poll}票">
													<div style="width:${map.count ! 0 * 100}px;" class="per" id="w1"></div>
												</div>
												<p id="p1" style="margin: 0px;">${map.count ! 0 * 100}%</p>
											</div>
										</#if>
									</#list>
								</#list>
							<#if so.dataType=='text'>
								<#list mapList as map>
									<#list map.surveyLogExtList as surveyLogExt>
										<#if surveyLogExt.optionid==so.id>
											有效数据 <span style="color: #1c77ba;">${map.extCount}</span> 条
											<#break>
										</#if>
									</#list>
								</#list>
							</#if>
							<#if so.dataType=='textarea'>
								<#list mapList as map>
									<#list map.surveyLogExtList as surveyLogExt>
										<#if surveyLogExt.optionid==so.id>
											有效数据 <span style="color: #1c77ba;">${map.extCount}</span> 条
											<#break>
										</#if>
									</#list>
								</#list>
							</#if>
							</li>
						</#list>
					</ul>
				</div>
	   </div>

     </div>
  </div>

  <div class="footer">
		      <#include "/pc/section/footer.html">
</div>

</body>
</html>
