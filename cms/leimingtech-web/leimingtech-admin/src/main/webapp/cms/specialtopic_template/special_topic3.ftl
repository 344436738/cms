<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>专题模板</title>
		<link href="/layoutitghpages4leimingtech/css/bootstrap-combined.min.css" rel="stylesheet">
		<script src="/layoutitghpages4leimingtech/js/jquery-1.8.3.min.js"></script>
	</head>
	<body>
	<br /><br />
	<!--start-leimingtech-limengbo-template-->
	<div class="container" id="leimingtech">
		<div class="row">
		<div class="span12">
		</div>
		</div>
		<div class="row">
		<!--start1-->
			<div class="span4">
				<div leimingtech-limenbo-content-model-number="number-1398404922910-0.6231385360006243-1">
			<div leimingtech-limengbo-edit-style="标题">标题1</div>
			<div>
			  <ul leimingtech-limengbo-edit-style="列表">
			    <#assign flashTag =newTag("flashTag")>
				<#assign flashList =flashTag("{'token':'tazthk1396344971'}")>
				<#if flashList?exists>
				  <#list flashList as flash>
				    <li leimingtech-limengbo-edit-style="item">${flash_index?if_exists+1},${flash.info?if_exists},${flash.url?if_exists}</li>
				  </#list> 
				</#if>
			  </ul>
			</div>
		</div>
			</div>
			<!--end1-->
			<!--start2-->
			<div class="span4">
				<div leimingtech-limenbo-content-model-number="number-1398404922910-0.6231385360006243-2">
				<div leimingtech-limengbo-edit-style="标题">标题2</div>
				<div>
				  <ul leimingtech-limengbo-edit-style="列表">
				    <#assign flashTag =newTag("flashTag")>
					<#assign flashList =flashTag("{'token':'tazthk1396344971'}")>
					<#if flashList?exists>
					  <#list flashList as flash>
					    <li leimingtech-limengbo-edit-style="item">${flash_index?if_exists+1},${flash.info?if_exists},${flash.url?if_exists}</li>
					  </#list> 
					</#if>
				  </ul>
				</div>
			</div>
			</div>
			<!--end2-->
			<!--start3-->
			<div class="span4">
				<div leimingtech-limenbo-content-model-number="number-1398404922910-0.6231385360006243-3">
				<div leimingtech-limengbo-edit-style="标题">标题3</div>
				<div>
				  <ul leimingtech-limengbo-edit-style="列表">
				    <#assign flashTag =newTag("flashTag")>
					<#assign flashList =flashTag("{'token':'tazthk1396344971'}")>
					<#if flashList?exists>
					  <#list flashList as flash>
					    <li leimingtech-limengbo-edit-style="item">${flash_index?if_exists+1},${flash.info?if_exists},${flash.url?if_exists}</li>
					  </#list> 
					</#if>
				  </ul>
				</div>
			</div>
			</div>
			<!--end3-->
		</div>
	</div>
	</body>
	<script>
	$(function(){
		$('body').attr({"ready":"ok"});
	});
	</script>
</html>