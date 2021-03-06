<div id="alipay_content">
	<div class="title"><b>评论列表</b></div>
<div class="body">
 <p class="p">您申请过的职位，国家人才网自动帮您保存60天的申请职位信息，方便您对职位进行跟踪。</p>
 <p class="p"> 评论记录查询：</p>
    <form id="memberSearchForm">
        起始时间：
        <input name="begintime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${begintime!''}" type="text" />
        &nbsp;结束时间：
        <input name="endtime"  type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${endtime!''}" />
        <button type="button" onclick="memberSearch('${searchUrl}','memberSearchForm')" class="btn searchbtn">查询</button>
        <input type="button"  value="重置" class="btn"  onclick="resetForm('memberSearchForm')" />
    </form>
 <div class="tablediv">
  <#--   <button type="button" onclick="add();" class="btn">新增</button> -->
   <table class="table" cellpadding="0" cellspacing="0">
     <thead>
       <tr>
       	 <th style="width:30px;">序号</th>
         <th style="width:30px;">评论人</th>
         <th style="width:50px;">文章标题</th>
         <th >评论内容</th>
         <th style="width:35px;">操作</th>
       </tr>
     </thead>
     <tbody>
     	<#list commentarylist as commentary>
	        <tr>
	           <td style="text-align: center;">${commentary_index + 1}</td>
	          <td ><div style=" width:80px; height:20px;overflow: hidden;">${commentary.commentaryperson}</div></td>
	          <td ><div style=" width:80px; height:20px;overflow: hidden;">${commentary.title}</div></td>
	          <td ><div style=" width:80px; height:20px;overflow: hidden;">${commentary.content}</div></td>
	          <td style="text-align: center;">
	          <#--<a href="javascript:;" onclick="modify(${commentary.id})">修改</a>-->
	          <a href="javascript:;" onclick="delCommentary(${commentary.id})">删除</a>
	          </td>
	        </tr>
        </#list>
     </tbody>
   </table>
   <#include "page.ftl">
 </div>
</div>
</div>
<script>
	function add(){
		$.ajax({
			type:'post',
			url:'commentaryFrontController.do?add',
			data:'t='+new Date().getTime(),
			dataType:'text',
			success:function(msg){
				$('#rightcontent').empty();
				$('#rightcontent').append(msg);
			},
			error:function(){
				alert("load page error, page url is " + urlStr);
			}
		});
	}
	
	function modify(id){
		$.ajax({
			type:'post',
			url:'commentaryFrontController.do?modify',
			data:'id='+id,
			dataType:'text',
			success:function(msg){
				$('#rightcontent').empty();
				$('#rightcontent').append(msg);
			},
			error:function(){
				alert("load page error, page url is " + urlStr);
			}
		});
	}
	
	function delCommentary(id){
		if (!confirm("是否删除该记录？")) {
			return;
		}
		$.ajax({
			type:'post',
			url:'del?id='+id,
			dataType:'text',
			success:function(data){
				var obj = JSON.parse(data);
				alert(obj.msg);
				if(obj.isSuccess){
					document.location.reload()
				}
			},
			error:function(){
				alert("load page error, page url is " + urlStr);
			}
		});
	}
	
	<#--
	function nextpage(pageIndex,count){
	if(pageIndex<1){
		alert("已经到首页");
		return;
	}
	if(pageIndex>count){
		alert("已经是最后一页");
		return;
	}
		$.ajax({
			type:'post',
			url:'commentaryFrontController.do?commentary',
			data:'pageIndex='+pageIndex,
			dataType:'text',
			success:function(msg){
				$('#rightcontent').empty();
				$('#rightcontent').append(msg);
			},
			error:function(){
				alert("load page error, page url is " + urlStr);
			}
		});
	}-->
</script>
<style>
.btn {
    border: 1px solid #F28427;
    cursor: pointer;
    padding: 0px 15px;
    height: 27px;
    background:#ff8b00;
    color: #FFF;
    font-size: 14px;
}

</style>
