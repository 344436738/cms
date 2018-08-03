﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <title>网站标题</title>
    <meta name="keywords" content="keyword ..." />
    <meta name="Description" content="description ..." />
    <!--<link href="favicon.ico" rel="shortcut icon" />-->
    <link href="${base}/res/css/global.css" rel="stylesheet" type="text/css" />
    <link href="${base}/res/css/reginfo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${base}/res/js/lmJs.js"></script>
</head>
<body>
<div id="rightcontent">
<div id="reg_info">
 <dl>
   <dt>留言修改<span>(<label>*</label>为必填项)</span></dt>
   <form id="form">
	   <dd>
	     <ul>
	     	 <input name="id" type="hidden" class="text" value="${page.id}"/>
	       <li><label><span>*</span>标题：</label><input name="title" type="text" class="text" value="${page.title}"/>
	         <p class="p1"> 请如实填写标题</p>
	       </li>
	       <li><label>内容：</label><input type="text" class="text" name="content" value="${page.content}"/>
	         <p class="p1">请如实填写内容</p>
	       </li>
	       <li><label>留言人：</label><input type="text" class="text" name="messagePerson" value="${page.messagePerson}"/>
	         <p class="p1">请如实填写留言人</p>
	       </li>
	       <li><label><span>*</span>QQ：</label><input type="text" class="text" name="qq" value="${page.qq}"/>
	         <p class="p1">请如实填写QQ</p>
	       </li>
	       <li><label><span>*</span>电话：</label><input type="text" class="text" name="telephone" value="${page.telephone}"/>
	         <p class="p1">请如实填写电话</p>
	       </li>
	       <li><label><span>*</span>手机：</label><input type="text" class="text" name="cellphone" value="${page.cellphone}"/>
	         <p class="p1">请如实填写手机号 </p>
	       </li>
	        <button type="button" onclick="formSubmitModel('guestBookFrontController.do?save', 'form');" class="btn blue">保存</button>
	     </ul>
	   </dd>
   </form>
 </dl>
</div>
<script language="javascript" type="text/javascript" src="${base}/res/js/jquery-1.4.4.min.js"></script>
<script language="javascript" type="text/javascript" src="${base}/res/js/reg.js"></script>
</body>
</html>
