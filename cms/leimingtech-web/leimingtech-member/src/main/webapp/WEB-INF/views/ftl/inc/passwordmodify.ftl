﻿<div id="reg_info">
	<dl>
		<dt>
			修改密码<span>(<label>*</label>为必填项)</span>
		</dt>
		<dd>
			<form id="form">
				<ul>
					<li><label>原密码：</label><input type="password" name="keyword"
						class="xiangying" type="text" onFocus="this.value=''"
						onBlur="if(!value){value=defaultValue;}"><span class="s2"></span>
					</li>
					<li><label>新密码：</label><input type="password" name="password"
						class="xiangying" type="text" onFocus="this.value=''"
						onBlur="if(!value){value=defaultValue;}"><span class="s2">密码可由大小写英文字母、数字组成,长度6-20个字符</span>
					</li>
					<li><label>确认密码：</label><input type="password"
						name="repassword" class="xiangying" type="text"
						onFocus="this.value=''" onBlur="if(!value){value=defaultValue;}"><span
							class="s2">请再输入一次密码</span>
					</li>
					<button type="button"
						onclick="formSubmitModel('savePassword', 'form');"
						class="btn">保存</button>
				</ul>
			</form>
		</dd>
	</dl>
</div>