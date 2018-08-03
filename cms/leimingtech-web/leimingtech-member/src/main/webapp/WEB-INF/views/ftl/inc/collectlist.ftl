﻿<div id="alipay_content">
<div class="title"><b>收藏列表</b></div>
<div class="body">
 <p class="p">您申请过的职位，国家人才网自动帮您保存60天的申请职位信息，方便您对职位进行跟踪。</p>
 <p class="p">申请记录查询：</p>
 <form id="memberSearchForm">
 	标题：
 	<input name="title"  value="${title!''}" type="text" />
 	<button type="button" onclick="memberSearch('${searchUrl}','memberSearchForm')" class="btn searchbtn">查询</button>
 	 <input type="button"  value="重置" class="btn"  onclick="resetForm('memberSearchForm')" />
</form>
 <div class="tablediv">
   <table class="table" cellpadding="0" cellspacing="0">
     <thead>
       <tr>
        <th style="width:25px;">序号</th>
         <th >标题</th>
         <th>内容</th>
         <th >URL</th>
         <th style="width:70px;" >收藏人</th>
         <th style="width:35px;">操作</th>
       </tr>
     </thead>
     <tbody>
     	<#list collectList as collect>
	        <tr>
	          <td style="text-align: center;">${collect.id}</td>
	          <td>${collect.title}</td>
	          <td>${collect.content}</td>
	          <td><a href="${collect.url}" target="_black">${collect.url}</a></td>
	          <td>${collect.collectPerson}</td>
	          <td style="text-align: center;">
	          <#--<a href="javascript:;" onclick="modify(${collect.id})">修改</a>-->
	          <a href="javascript:;" onclick="delCollect(${collect.id})">删除</a>
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
	<#--function add(){
		$.ajax({
			type:'post',
			url:'collectFrontController.do?add',
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
			url:'collectFrontController.do?modify',
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
	}-->
	
	function delCollect(id){
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
	
	<#--function go(url){
		window.open(url);
	}
	
	
	/**
		分页
	*/
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
			url:'collectFrontController.do?collect',
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