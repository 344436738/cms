<#include "head.ftl">
<script type="text/javascript" src="${domain}/${base}/res/js/login.js"></script>
<div id="center">
	<div class="center_left"></div>
	<div class="center_right">
         <div class="title-style-1">
           <h2></h2>
         </div>
         <form id="form_sample_1" >
         	<input type="hidden" name="loginerrornum" value="0" />
         	<div class="control-group">
				<label class="control-label">用户名</label>
                <div class="controls">
                    <input id="username" name="username" class="txt succeed" type="text error" value="${frontusername!''}" onchange="$('#login_password').hide().removeClass('help-inline ok').closest('.control-group').removeClass('error');" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"/>
                    <span id="login_username" style="display:none;"></span>
                </div>
			</div>
			<div class="control-group" style="height:20px;"></div>
			<div class="control-group">
				<label class="control-label">密码</label>
                <div class="controls">
                    <input name="password" id="password" class="txt error" type="password" onchange="$('#login_password').hide().removeClass('help-inline ok').closest('.control-group').removeClass('error');" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"/>
                    <span id="login_password" style="display:none;"></span>
                </div>
			</div>
			<div class="control-group" style="height:20px;"></div>
			<div class="control-group" style="font-size: 12px;">
                <label class="f_l" style="background: none repeat scroll 0% 0% #FFF;">
					<input class="f_l" type="checkbox" name="rememberpassword" value="1"/>&nbsp;记住用户名&nbsp;&nbsp;
				</label> 
				<label class="f_l_right">
					<a href="${domain}/${base}/MemberAct/findpassword?siteId=${siteId}" style="background: none repeat scroll 0% 0% #FFF;">忘记密码?</a>
				</label>
				<label class="register_right" style="float:right;">
					<a href="${domain}/${base}/member/registerAct/register?siteId=${siteId}" style="background: none repeat scroll 0% 0% #FFF;">免费注册</a>
				</label>
			</div>
			<div class="control-group" style="height:20px;"></div>
                <div class="control-group">
				<input type="button" name="" value="登  录" class="input-submit-style-3" 
                            onclick="formSubmitModel11('${domain}/${base}/loginAct/checkLogin?addr=${addr}&siteId=${siteId}', 'form_sample_1','${base}','${domain}');"/>
			</div>
			<div class="control-group" style="height:20px;"></div>
			<#--<div class="control-group">
				<label class="control-label">合作账户登录</label>&nbsp;&nbsp;
				<a href="${qqpath}" title="QQ登录"><img src="${base}/res/images/qq.png" /></a>&nbsp;&nbsp;
				<a href="${sinapath}" title="微博登录"><img src="${base}/res/images/weibo.png" /></a>

			</div>-->
         	
		</form>
    </div>
</div>
<script>
    function formSubmitModel11(urlStr, formName,frontUrl,domain) {
        var username=$("#username").val();
        var password=$("#password").val();
        if(/\s/.test(username)){
            alert('用户名不正确');
            return false;
        }
        if($('#' + formName).valid()){
            $.ajax({
                type : 'post',
                url : urlStr,
                data : $('#' + formName).serialize(),
                success : function(msg) {
                    var obj = JSON.parse(msg);
                    var toUrl = obj.toUrl;
                    if (!toUrl && typeof (toUrl) != "undefined" && toUrl != 0
                            && toUrl != '') {
                        toUrl = arguments[2] + '';
                    }
                    if (!obj.isSuccess) {
                        var errortype = obj.errortype;
                        $("#login_" + errortype).css("display", "block");
                        $("#login_" + errortype).addClass("help-inline ok");
                        $("#login_" + errortype).html(obj.msg);
                        $("#login_" + errortype).attr("htmlfor", errortype);
                        $("#login_" + errortype).closest('.control-group').removeClass('success').addClass('error');

                    }else{
                        location.href =domain+frontUrl + "/" +toUrl;
                    }
                },
                error : function() {
                    alert("提交通讯失败!");
                }
            });
        }
    }
</script>
<#include "foot.ftl">