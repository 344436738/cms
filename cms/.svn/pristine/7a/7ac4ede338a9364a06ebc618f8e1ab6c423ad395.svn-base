/*
 * 2017/03/24 wy  微信推送
 */

/**
 * 获取标签
 * @param url
 */
function wechatEnterprise(url){
    var configid = $('#enterpriseConfig option:selected') .val();//选中的值
    $.ajax({
        type:'post',
        url:url,
        data:{'config':configid},
        dataType:'text',
        success:function(msg){
            $('#wechatEnterpriseModel').empty();
            $('#wechatEnterpriseModel').append(msg);
            $('#wechatEnterpriseModel').modal('show');
        },
        error:function(){
            lmAlert("load page error, page url is " + url);
        },
    });
}


/**
 * 同步标签
 * @param id
 */
function synchronization(id){
    var url = "wechatEnterpriseTagController.do?synchronization";
    $.ajax({
        type:'post',
        url:url,
        data:{'enterpriseConfigId':id},
        dataType:'text',
        success:function(msg){
            var obj = JSON.parse(eval(msg));
            if(obj.isSuccess){
                refreshTagList('wechatEnterpriseTagController.do?wechatEnterpriseTag');
            }else{
                lmAlert(obj.msg);
            }
        },
        error:function(){
            lmAlert("load page error, page url is " + url);
        },
    });
}

function refreshTagList(url){
    var configid = $('#enterpriseConfig option:selected') .val();//选中的值
    $.ajax({
        type:'post',
        url:url,
        data:{'config':configid},
        dataType:'text',
        success:function(msg){
            $('#wechatEnterpriseModel').empty();
            $('#wechatEnterpriseModel').append(msg);
        },
        error:function(){
            lmAlert("load page error, page url is " + url);
        },
    });
}


///**
// * 推送消息记录
// */
//function enterprisePushList(id){
//   var url = "wechatenterprisePushController.do?wechatenterprisePush";
//    $.ajax({
//        type:'post',
//        url:url,
//        data: {'id':id},
//        dataType:'text',
//        success:function(msg){
//            $('#enterprisePushList').empty();
//            $('#enterprisePushList').append(msg);
//            $('#enterprisePushList').modal('show');
//        },
//        error:function(){
//            lmAlert("load page error, page url is " + url);
//        },
//    });
//}

/**
 * 发布后填写推送微信数据
 * @param id
 */
function enterprisePushMessage(url,contentId){
    $.ajax({
        type:'post',
        url:url,
        data: 'contentId='+contentId,
        dataType:'text',
        success:function(msg){
            $('#pushMessageModel').empty();
            $('#pushMessageModel').append(msg);
            $('#pushMessageModel').modal('show');
        },
        error:function(){
            lmAlert("load page error, page url is " + url);
        },
    });
}
/**
 * 消息推送
 * @param url
 * @param pushId
 */
function wechatPush(url,pushId){
    $.ajax({
        type:'post',
        url:url,
        data: {'id':pushId},
        dataType:'text',
        success:function(msg){
            var obj = JSON.parse(eval(msg));
            if(obj.isSuccess){
                lmAlert(obj.msg);
            }else{
                lmAlert(obj.msg);

            }
        },
        error:function(){
            lmAlert("load page error, page url is " + url);
        },
    });
}
/**
 * 消息推送添加配置项
 * @param url
 * @param pushId
 */
function wechatPushPreview(url,pushId){
    var id = $("#enterpriseConfigId").val();
    $.ajax({
        type:'post',
        url:url,
        data:{'enterpriseConfigId':id,'pushId':pushId},
        dataType:'text',
        success:function(msg){
            $('#pushPreview').empty();
            $('#pushPreview').append(msg);
            $('#pushPreview').modal('show');
        },
        error:function(){
            lmAlert("load page error, page url is " + url);
        },
    });
}

/**
 * 选择标签提交
 */
function formSubmitModelTag(){
    var tags = "";
    $('input[name="tagCheck"]:checked').each(function(){
        tags = tags+$(this).val()+',';
    });
    if(tags==""){
       tags="@all";
    };
    $("#tagList").val(tags);
    $('#wechatEnterpriseModel').empty();
    $('#wechatEnterpriseModel').modal('hide');
}

/**
 * 提交推送配置项
 */
function formSubmitModelPreview(urlStr,formName){
    if(!$('#' + formName).valid()){
        return false;
    }
    var tags = $('#tagList').val();
    if(tags==null || tags == ""){
            $('#tagList').val("@all");
    }
    var option = $("#enterpriseConfig").val();
     $("#enterpriseConfigId").val(option);

    $.ajax({
        type:'post',
        url:urlStr,
        data:$('#' + formName).serialize(),
        success:function(msg){
            var obj = JSON.parse(eval(msg));
            if(obj.isSuccess){
                wechatPush('wechatenterprisePushController.do?weChatPush',obj.pushId);
            }else{
                lmAlert(obj.msg);
            }
        },
        error:function(){
            lmAlert("提交通讯失败!");
        }
    });
}


