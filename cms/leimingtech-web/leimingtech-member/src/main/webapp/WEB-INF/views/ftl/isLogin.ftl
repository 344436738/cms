<#if member?exists&&flag=="1">
<ul style="list-style-type:none;float:right">
    <li style="float:left;margin-left: 10px"><span><a href="${domain}/${frontpath}/MemberAct/personal">${member.username}, 你好!</a></span></li>
    <li style="float:left;margin-left: 10px"><span><a href="javaScript:;" class="r" onclick="exit('${domain}/${frontpath}/front/surveyLogController.do?exitVip')" >退出登录</a></span></li>
</ul>
</#if>
<#if flag=="0">
<a id="a1234" href="javascript:void(0);" onclick="login()" class="r" style="margin-left: 15px;float:right">登录</a>
<a href="${domain}/${frontpath}/member/registerAct/register?siteId=${siteId}" class="l" style="margin-left: 15px;float:right" >注册</a>
</#if>
<div id="div1"></div>
<script>
    var islogin = ${flag};
    function login(){
        document.getElementById("a1234").href = "${domain}/${frontpath}/loginAct/login?siteId=${siteId}&addr="+window.location.href;
    }
    function exit(urlStr){
        $.ajax({
            type:'post',
            url:urlStr,
            data:'data=0',
            dataType:'text',
            success:function(msg){
                var obj = JSON.parse(eval(msg));
                if(obj.isSuccess){
                    var toUrl = obj.toUrl;
                    if (!toUrl && typeof(toUrl)!="undefined" && toUrl!=0 && toUrl != '')
                    {
                        toUrl = arguments[2] + '';
                    }
                    alert(obj.msg);
                    /*if(window.location.pathname.split("/")[2]!="member"){
                        window.location.reload(true);
                    }else{
                        window.location.href="${domain}+url";
                    }*/location.href = domain+toUrl;
                }else{
                    alert("退出登录失败!");
                }
            },error:function(){
                alert("退出登录失败!");
            }
        });
    }
</script>