<#include "head.ftl">
<div id="center">
	<div class="center_right" style="margin-left:350px; margin-top:20px;">
		<form id="form_sample_1">
			<div class="control-group">
				<div class="controls" style="text-align: center;">
				<#if mailurl?exists>
					<span>用户你好，邮件已经发送至您的邮箱。<br />请点击<a href="${mailurl}" target="_blank">登录</a>修改密码。</span>
				<#else>
					<span>用户你好，邮件已经发送至您的邮箱。请登录邮箱修改密码。</span>				
				</#if>
				</div>
			</div>
			
		</form>
	</div>
</div>
<#include "foot.ftl">
