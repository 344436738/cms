<script>
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}

function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        }
                        catch (e) {
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}
</script>
<div class="toolbar">
<div id="site_nav">
<div id="site_nav_left" style="width:145px">
<p class="site_p1"><a href="/" >网 站 首 页</a></p>
</div>
<div id="site_nav_left" style="width:555px;">
<p class="site_p1" style="padding-left:50px"><a href="http://www.leimingtech.com/apk/lmcms_android.apk" target="_blank">雷铭cms安卓本地下载</a></p>
<p class="site_p1" style="padding-left:50px"><a href="https://itunes.apple.com/us/app/lei-mingcms/id923950258?mt=8" target="_blank">雷铭CMS苹果版本地下载</a></p>
<p class="site_p1" style="padding-left:50px"><a href="http://www.leimingtech.com/cms.html" target="_blank">北京雷铭智信科技官网</a></p>
</div>
<div id="div1"></div>

<div id="site_nav_right" style="width:200px; margin-top:-30px;">
|<a href="/">网站首页</a>
</div>
<div class="div_login" id="divLogin" style="padding-top:13px;"></div>
</div>
</div>

<div class="so">
<form action="/e/search/index.php" method="post" id="unify_search">
<input type="hidden" name="show" value="title" />
<input type="hidden" name="tempid" value="1" />

<div class="div_search">
        <table align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="188" height="41"><input id="keyword2" value="${keyword?if_exists}" name="keyword" autocomplete="off" style="margin-left:4px;"></td>
            <td><a href="javaScript:void(0)"  onclick="toSearch1('${contextpath}/front/frontController.do?search');"><img src="/images/newimg/search_icon.png" width="56" height="24" onmouseover="changepic(this,'/images/newimg/search_icon.png')" onmouseout="changepic(this,'/images/newimg/search_icon.png')" /></a></td>
          </tr>
        </table>
      </div>
</form>
</div>
</div>

<script src="${domain}/${base}/js/jquery.min.js" type="text/javascript"></script>
<script>
	$(function() {
		var urlStr = "${domain}${base}/front/surveyLogController.do?isLogin";
		$.ajax({
			type : 'post',
			url : urlStr,
			data : 'data=0',
			dataType : 'text',
			success : function(msg) {
				$('#divLogin').empty();
				$('#divLogin').append(msg);
			}
		});
	});

function toSearch1(urlStr) {
		var keyword=document.getElementById("keyword2").value;
		var key=keyword.replace(/\s+/g,"")
		var keyWord2 = encodeURI(key);
		keyWord2 = encodeURI(keyWord2);
		window.location = urlStr + "&keyword=" + keyWord2+"&siteid="+${site.id};
	}

</script>
