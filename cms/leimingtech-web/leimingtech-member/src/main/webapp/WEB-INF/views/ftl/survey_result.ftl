<!DOCTYPE html>
<!-- saved from url=(0048)http://data.ahciq.gov.cn/vote/votecount_46.shtml -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>${site.siteName}-${catalogF.name}</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE">
<link href="${domain}/css/base.css" rel="stylesheet">
<link href="${domain}/css/style.css" rel="stylesheet">
<link href="${domain}/css/main.css" rel="stylesheet">
<script src="${domain}/js/jquery.js"></script>
<script src="${domain}/js/base.js" type="text/javascript"></script>

<base href="." target="_blank">
</head>
<body>
	
	 <#include "/head.ftl">
	<div class="cl"></div>
	<div class="container">
		<div class="tag">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td width="36" class="center"><img
							src="${domain}/images/tl.gif">
						</td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td>当前位置：<a href="${domain}">首页</a> &gt; 
											<#assign navTag =newTag("navTag")>
											<#assign navTagList =navTag("{'name':'${catalogF.id}'}")> 
											<#if navTagList?exists> 
												<#list navTagList as navTag> 
													<a href="${domain}/${navTag.url!'javascript:void(0);'}">${navTag.name}&gt;</a>
												</#list> 
											</#if>
										</td>
									</tr>
								</tbody>
							</table></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="content-block">
			<div class="block gzly">
				<div class="bt">
					<h3>${catalogF.name}</h3>
				</div>
				<div class="gzly-block">
					<style>
BODY {
	SCROLLBAR-FACE-COLOR: #f7f7f7;
	SCROLLBAR-HIGHLIGHT-COLOR: #6989CB;
	SCROLLBAR-SHADOW-COLOR: #6989CB;
	SCROLLBAR-3DLIGHT-COLOR: #ffffff;
	SCROLLBAR-ARROW-COLOR: #6989CB;
	SCROLLBAR-TRACK-COLOR: #f7f7f7;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #ffffff
}
</style>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td>&nbsp;</td>
								<td colspan="2" align="center" class="blue"><b>${contentF.title}</b>
								</td>
							</tr>
							<tr>
								<td width="30"><img
									src="${domain}/images/myzj-4.gif" width="30" height="17">
								</td>
								<td background="${domain}/images/myzj-5.gif">&nbsp;</td>
								<td background="${domain}/images/myzj-4.gif">&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center">

						<tbody>
							<tr>
								<td>
								<#list surveyOptionList as so>
									<table align="center" border="0" bgcolor="#d6d7d6" width="100%"
										height="35" cellspacing="1" cellpadding="1"
										style="margin-top:4px;">
										<tbody>
											<tr align="center">
												<td colspan="2" bgcolor="#f7f7f7" height="22">${so.optionname}</td>

											</tr>
											<#list so.optionextList as ol>
											<#list mapList as map>
											<#if ol.id==map.ids>
											<tr>
												<td width="50%" bgcolor="#f7f7f7" height="22">
													<div align="right">
														<b>${ol.extOptionname}</b>&nbsp;
													</div></td>
												<td width="50%" bgcolor="#FFFFFF" height="22">&nbsp;票数：<font
													color="#FF0000">${map.poll}</font>票</td>
											</tr>
											</#if>
											</#list>
											</#list>
											
								<#if so.dataType=='text'>
								<#list mapList as map>
									<#list map.surveyLogExtList as surveyLogExt>
										<#if surveyLogExt.optionid==so.id>
											<tr>
												<td width="50%" bgcolor="#f7f7f7" height="22">
													<div align="right">
														<b>有效数据:</b>&nbsp;
													</div></td>
												<td width="50%" bgcolor="#FFFFFF" height="22">&nbsp;<font
													color="#FF0000">${map.extCount}</font>条</td>
											</tr>
												<#break>
										</#if>
									</#list>
								</#list>
								</#if>
							<#if so.dataType=='textarea'>
								<#list mapList as map>
									<#list map.surveyLogExtList as surveyLogExt>
										<#if surveyLogExt.optionid==so.id>
											<tr>
												<td width="50%" bgcolor="#f7f7f7" height="22">
													<div align="right">
														<b>有效数据:</b>&nbsp;
													</div></td>
												<td width="50%" bgcolor="#FFFFFF" height="22">&nbsp;<font
													color="#FF0000">${map.extCount}</font>条</td>
											</tr>
												<#break>
										</#if>
									</#list>
								</#list>
							</#if>
											
										</tbody>
									</table>
								</#list>
									</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
				<div style="width: 230px;
	height: 696px;
	padding: 10px;
	text-align: left;
	display: inline-block;
	position: absolute;
	right: 0;
	top: 0;
	border: 1px solid #d6e9f8;
	">
				
							<#include "/common/benJuTongZhi.html">
				</div>
		</div>
	</div>
	<div class="cl"></div>
	<#include "/foot.ftl">

</body>
</html>