<script type="text/javascript">
        var i=0;
        var replyTimeList = new Array();

        //前台会员 删除 自己的 评论
        function delSelfReply(urlStr,replyId){
        var frontpath = '${frontpath}';
        var domain = '${domain}';
        debugger;
            layer.confirm("您确定要删除吗？", function () {
                layer.closeAll('dialog');
                $.ajax({
                    type: "POST",
                    url:domain+"/"+frontpath+"/front/replyFrontController/del",
                    data:{'replyId':replyId},
                    success: function(str) {
                    debugger;
                        var obj = JSON.parse(str);
                        layer.msg(obj.msg,{time:1000},function(){
                            showAllReply(urlStr);

                            var arr=urlStr.split("?");
                            var str1 = arr[1];
                            var commentId=str1.split("=")[1];
                            if(obj.replyTotalCount == 0){
                                $("#deleteByUser_" + commentId).remove();
                            }else {
                                $("#flushReplyTotalCount_"+commentId).html(obj.replyTotalCount);
                            }

                        });

                    }
                });

            });
        }
</script>
<#if replyVoEntityList?exists && replyVoEntityList?size gt 0>
    <input type="hidden" id="replyVoEntityCount_${replyPageNo}" value="${replyVoEntityCount?if_exists}">
    <#list replyVoEntityList as reply>

        <input type="hidden" id="replyTime_${replyPageNo}_${reply_index+1}" value="${reply.replyTime?string('yyyy-MM-dd HH:mm:ss')}">

        <li class="np-post">
            <script type="text/javascript">
                replyTimeList[i] = '${reply.replyTime?string("yyyy-MM-dd HH:mm:ss")}';
                i++;//记录 跟帖条数
                    var t;
                    var nowTime = new Date().getTime();
                    var replyTime  = '${reply.replyTime?string("yyyy-MM-dd HH:mm:ss")}';
                    var date1 = new Date(replyTime).getTime();
                    var secend = Math.floor((nowTime-date1)/(1000));
                    var min = Math.floor((nowTime-date1)/(1000*60));
                    var hour = Math.floor((nowTime-date1)/(1000*60*60));
                    var day = Math.floor((nowTime-date1)/(1000*60*60*60));

                    if(secend<60){
                        document.getElementById('time_'+replyTime).innerHTML =secend+" 秒前";
                    }else if(min<60){
                        document.getElementById('time_'+replyTime).innerHTML =min+" 分钟前";
                    }else if(hour<24){
                        document.getElementById('time_'+replyTime).innerHTML =hour+" 小时前";
                    }else {
                        document.getElementById('time_'+replyTime).innerHTML =day+" 天前";
                    }

                $(document).ready(function(){
                    $("#delSelfReply_${reply.replyId}").mouseover(function(){
                        if('${reply.memberid}' == '${memberId}'){
                            $('#delHidden_${reply.replyId}').css("display","block");
                        }

                    });
                    $("#delSelfReply_${reply.replyId}").mouseout(function(){
                        if('${reply.memberid}' == '${memberId}'){
                            $('#delHidden_${reply.replyId}').css("display","none");
                        }
                    });
                });
            </script>
            <div class="np-tip-newpost"> </div>
            <#if reply.memberPic?if_exists>
                <img class="np-avatar popClick" src="${contextpath}/${reply.memberPic}">
                <#else>
                    <img class="np-avatar popClick" src="${contextpath}/member/pic/face.jpg">
            </#if>
            <div class="np-post-body" id="delSelfReply_${reply.replyId}">

                <a href="javascript:void(0)" onclick="delSelfReply('${domain}/${frontpath}/front/replyFrontController/showList?commentid=${commentId}','${reply.replyId}')"  class="np-btn np-btn-report report" id="delHidden_${reply.replyId}" style="display: none;">删除</a>

                <div class="np-post-header">
                                            <span class="">
                                                <a href="javascript:void(0)" class="np-user popClick" post_uid="47835539">${reply.memberName}</a>
                                             </span>

                    <span class="np-time reply-time" data="1491469338" time="${reply.replyTime?string('yyyy-MM-dd HH:mm:ss')}"
                    id="time_${reply.replyTime?string('yyyy-MM-dd HH:mm:ss')}">${reply.replyTime?string('yyyy-MM-dd HH:mm:ss')}</span>
                </div>
                <div class="np-post-content" data-height="5">

                    <div  class="content" style="border:1px solid #ccc;background:rgba(253, 250, 235, 0.41);font-size:12px;padding:0;height:100%;color:#2b2b2b;">
                        <a href="javascript:void(0)"  class="replywho np-icon-reply-weak np-user popClick " >${reply.commentName}</a>
                        <p>${reply.replyContent}</p><br/>
                    </div>
                    <p>${reply.returnContent}</p>

                </div>
                <div class="np-post-footer">
                    <a href="javascript:void(0)" style="text-decoration: none" ><img src="/pcstyle/images/content-ups.png" style="align-content: center" title="赞同" onclick="addReplySupport('${reply.replyId}')" />
                        (<em id="zantong_replycount_${reply.replyId}">${reply.supportCount}</em>)</a>&nbsp;
                    <a href="javascript:void(0)" style="text-decoration: none" ><img src="/pcstyle/images/content-downs.png" style="align-content: center" title="不赞同" onclick="deleteReplySupport('${reply.replyId}')"/>
                        (<em id="fandui_replycount_${reply.replyId}">${reply.opposeCount}</em>)</a>&nbsp;
                    <a href="javascript:void(0)" class="np-btn np-btn-reply reply" onclick="showsmallreply('${reply.replyId}')">回复(<em id="returncount_${reply.id}">${reply.returnCount}</em>)</a>

                    <!--回复框-->
                    <form class="reply_smallform_${reply.replyId} forHidden" style="display: none" id="addreturn_${reply.replyId}">
                        <input type="hidden" name="replyid" value="${reply.replyId}" />
                        <textarea tabindex="1" id="returncontent_${reply.replyId}" name="content" class="small-comment-text" onkeyup="javascript:chkmaxsms(this,'80')" placeholder="(请勿超过80字)"></textarea>
                        <div class="commtSub np-reply-box-footer small-comment-div">
                            <div class="submitBtn">
                                <a href="javascript:void(0)" class="np-btn np-btn-submit" onclick="addreturn('${reply.replyId}')" >发表回复1</a>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </li>
    </#list>
</#if>
<script type="text/javascript">
    setInterval("clock()",5000);
    function clock(){
        for (i=0;i<replyTimeList.length;i++) {
            var nowTime = new Date().getTime();
            var replyTime = replyTimeList[i];
            var date1 = new Date(replyTime).getTime();
            var second = Math.floor((nowTime - date1) / (1000));
            var min = Math.floor((nowTime - date1) / (1000 * 60));
            var hour = Math.floor((nowTime - date1) / (1000 * 60 * 60));
            var day = Math.floor((nowTime - date1) / (1000 * 60 * 60 * 60));
            if (second < 60) {
                document.getElementById('time_' + replyTime).innerHTML = second + " 秒前";
            } else if (min < 60) {
                document.getElementById('time_' + replyTime).innerHTML = min + " 分钟前";
            } else if (hour < 24) {
                document.getElementById('time_' + replyTime).innerHTML = hour + " 小时前";
            } else {
                document.getElementById('time_' + replyTime).innerHTML = day + " 天前";
            }
        }
    }
</script>