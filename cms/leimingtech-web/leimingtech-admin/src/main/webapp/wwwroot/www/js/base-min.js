var GLOBAL={};GLOBAL.namespace=function(c){var a=c.split("."),b=GLOBAL;for(i=(a[0]=="GLOBAL")?1:0;i<a.length;i++){b[a[i]]=b[a[i]]||{};b=b[a[i]]}};GLOBAL.Script={queuedScripts:new Array(),load:function(f){var e=f.url;if(!e){return alert("\u8f93\u5165\u7684\u811a\u672c\u6587\u4ef6\u4e3a\u7a7a")}var h=f.onload||null,b=f.order||null;var g=this;var c=g.queuedScripts.length;if(b){var a={response:null,onload:h,done:false};g.queuedScripts[c]=a}var d=this.getXHRObj();d.onreadystatechange=function(){if(d.readyState==4){if(b){g.queuedScripts[c].response=d.responseText;g.injectScripts()}else{g.createscript(d.responseText,h)}}};d.open("GET",e,true);d.send(null)},injectScripts:function(){var d=this;var b=d.queuedScripts.length;for(var c=0;c<b;c++){var a=d.queuedScripts[c];if(!a.done){if(!a.response){break}else{d.createscript(a.response,a.onload);a.done=true}}}},createscript:function(c,b){var a=document.createElement("script");document.getElementsByTagName("head")[0].appendChild(a);a.text=c;if(b){b()}},getXHRObj:function(){var a;var b=[function(){return new XMLHttpRequest()},function(){return new ActiveXObject("Microsoft.XMLHTTP")},function(){return new ActiveXObject("Xml2.XMLHTTP")}];for(var c=0;c<b.length;c++){try{a=b[c]();this.getXHRObj=b[c];break}catch(d){a=false}}if(!a){alert("Error creating the XMLHttpRequest object.")}return a}};GLOBAL.namespace("Cookie");GLOBAL.Cookie={read:function(c){var b="; "+document.cookie+"; ";var a=b.indexOf("; "+c+"=");if(a!=-1){var d=b.substring(a+c.length+3,b.length);return unescape(d.substring(0,d.indexOf("; ")))}else{return null}},set:function(d,h,b,g){var a=b*1000;var e=new Date();e.setTime(e.getTime()+a);var f=b?"; expires="+e.toGMTString():"";var c="; path=/";if(g){c="; domain="+g+"; path=/"}document.cookie=d+"="+escape(h)+f+c},del:function(a){var c=new Date(new Date().getTime()-86400);var b=null;document.cookie=a+"="+b+";expires="+c.toGMTString()+";path=/"}};GLOBAL.namespace("Event");GLOBAL.Event.getEventTarget=function(a){a=window.event||a;return a.srcElement||a.target};GLOBAL.Event.stopPropagation=function(a){a=window.event||a;if(document.all){a.cancelBubble=true}else{a.stopPropagation()}};GLOBAL.Event.on=function(c,a,b){c=typeof c=="string"?document.getElementById(c):c;if(document.all){c.attachEvent("on"+a,b)}else{c.addEventListener(a,b,false)}};GLOBAL.namespace("Dom");GLOBAL.Dom.getNextNode=function(b){b=typeof b=="string"?document.getElementById(b):b;var a=b.nextSibling;if(!a){return null}if(!document.all){while(true){if(a.nodeType==1){break}else{if(a.nextSibling){a=a.nextSibling}else{break}}}}return a};GLOBAL.Dom.setOpacity=function(a,b){a=typeof a=="string"?document.getElementById(a):a;if(document.all){a.style.filter="alpha(opacity="+b+")"}else{a.style.opacity=b/100}};GLOBAL.Dom.get=function(a){a=typeof a=="string"?document.getElementById(a):a;return a};GLOBAL.Dom.getElementsByClassName=function(h,m,o){if(m){m=typeof m=="string"?document.getElementById(m):m}else{m=document.body}o=o||"*";var d=m.getElementsByTagName(o),g=[];for(var f=0,a=d.length;f<a;f++){for(var e=0,c=d[f].className.split(" "),b=c.length;e<b;e++){if(c[e]==h){g.push(d[f]);break}}}return g};GLOBAL.Dom.addClass=function(a,b){if(!new RegExp("(^|\\s+)"+b).test(a.className)){a.className=a.className+" "+b}};GLOBAL.Dom.removeClass=function(a,b){a.className=a.className.replace(new RegExp("(^|\\s+)"+b),"")};GLOBAL.Dom.loadScript=function(src,onload){var se=document.createElement("script");se.type="text/javascript";if(arguments[2]){se.charset=arguments[2]}if(arguments[3]){se.id=arguments[3];var node;if(node=GLOBAL.Dom.get(arguments[3])){document.getElementsByTagName("head")[0].removeChild(node)}}if(
/*@cc_on!@*/
0){se.onreadystatechange=function(){if(this.readyState=="loaded"||this.readyState=="complete"){if(typeof(onload)=="function"){onload()}}}}else{se.onload=function(){if(typeof(onload)=="function"){onload()}}}se.src=src;document.getElementsByTagName("head")[0].appendChild(se)};GLOBAL.namespace("Lang");GLOBAL.Lang.trim=function(a){return a.replace(/^\s+|\s+$/g,"")};GLOBAL.Lang.base64={decode:function(h){var d="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";var c,b,a,m,l,k,j,n,g=0,o=0,e="",f=[];if(!h){return h}h+="";do{m=d.indexOf(h.charAt(g++));l=d.indexOf(h.charAt(g++));k=d.indexOf(h.charAt(g++));j=d.indexOf(h.charAt(g++));n=m<<18|l<<12|k<<6|j;c=n>>16&255;b=n>>8&255;a=n&255;if(k==64){f[o++]=String.fromCharCode(c)}else{if(j==64){f[o++]=String.fromCharCode(c,b)}else{f[o++]=String.fromCharCode(c,b,a)}}}while(g<h.length);e=f.join("");return e},encode:function(j){var e="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";var d,c,b,n,m,l,k,o,h=0,p=0,g="",f=[];if(!j){return j}do{d=j.charCodeAt(h++);c=j.charCodeAt(h++);b=j.charCodeAt(h++);o=d<<16|c<<8|b;n=o>>18&63;m=o>>12&63;l=o>>6&63;k=o&63;f[p++]=e.charAt(n)+e.charAt(m)+e.charAt(l)+e.charAt(k)}while(h<j.length);g=f.join("");var a=j.length%3;return(a?g.slice(0,a-3):g)+"===".slice(a||3)}};GLOBAL.Lang.isNumber=function(a){return !isNaN(a)};GLOBAL.Lang.isString=function(a){return typeof a=="string"};GLOBAL.Lang.isBoolean=function(a){return typeof a=="boolean"};GLOBAL.Lang.isFunction=function(a){return typeof a=="function"};GLOBAL.Lang.isNull=function(a){return a==null};GLOBAL.Lang.isUndefined=function(a){return typeof a=="undefined"};GLOBAL.Lang.isEmpty=function(a){return/^\s*$/.test(a)};GLOBAL.Lang.isArray=function isArray(a){return a instanceof Array};GLOBAL.Lang.isObject=function(a){return typeof a=="object"};GLOBAL.Lang.geMyTime=function(d,a){d=parseInt(d)*1000;var b="";var c=new Date();c.setTime(d);add_year=c.getYear();add_year=add_year<1900?(1900+add_year):add_year;add_mon=c.getMonth()+1;if(add_mon<10){add_mon="0"+add_mon}add_daily=c.getDate();if(add_daily<10){add_daily="0"+add_daily}add_hour=c.getHours();if(add_hour<10){add_hour="0"+add_hour}add_min=c.getMinutes();if(add_min<10){add_min="0"+add_min}add_sec=c.getSeconds();if(add_sec<10){add_sec="0"+add_sec}switch(a){case 1:b=add_year+"-"+add_mon+"-"+add_daily+" "+add_hour+":"+add_min+":"+add_sec;break;case 2:b=add_mon+"-"+add_daily+" "+add_hour+":"+add_min+":"+add_sec;break;case 3:b=add_year+"-"+add_mon+"-"+add_daily;break;case 4:b=add_mon+"-"+add_daily+" "+add_hour+":"+add_min;break}return b};GLOBAL.Lang.getCacheTime=function(c){var f=new Date().getYear();f=f<1900?(1900+f):f;var e=new Date().getMonth();var d=new Date().getDate();var b=new Date().getHours();var a=new Date().getMinutes();var g=f+"_"+e+"_"+d+"_"+b+"_";if(c<=0||c>=60){return g+a}if(a%c){g+=a-a%c}else{g+=a}return g};GLOBAL.ScriptCss={queue:[],process:[],callback:null,load:function(e,h){var j=this;var f=e.length;if(!f){return}j.callback=h;for(var d=0;d<f;d++){var b=j.getExt(e[d]);if(!b){continue}var a="scriptcss_"+b+"_"+d;switch(b){case"css":j.process[a]=0;var c={name:a,tag:"link",url:e[d]};j.creatTag(c.name,c.url,c.tag,function(){j.process[c.name]=1;j.checkStat()});break;case"js":var g=/jquery[-\d\.]*\.min\.js$/;if(g.test(e[d])){if(typeof jQuery!="undefined"){continue}}j.process[a]=0;j.queue.push({name:a,tag:"script",url:e[d]});break}}j.doQueueAction()},checkStat:function(c){var b=this;for(var a in b.process){if(!b.process[a]){return}}if(typeof b.callback=="function"){b.callback()}},doQueueAction:function(){var a=this;if(a.queue.length){var b=a.queue.shift();a.creatTag(b.name,b.url,b.tag,function(){a.process[b.name]=1;a.doQueueAction()})}else{a.checkStat()}},getExt:function(b){var a=false;var c=b.lastIndexOf(".");b=b.substr(c+1);if(b=="css"||b=="js"){a=b}return a},creatTag:function(nodename,url,tag,callback){var t=this;var node;if(node=GLOBAL.Dom.get(nodename)){node.parentNode.removeChild(node)}var style=document.createElement(tag);if(
/*@cc_on!@*/
0){style.onreadystatechange=function(){if(this.readyState=="loaded"||this.readyState=="complete"){if(typeof(callback)=="function"){callback()}this.onreadystatechange=null}}}else{style.onload=function(){if(typeof(callback)=="function"){callback()}this.onload=null}}if(tag=="link"){style.href=url;style.rel="stylesheet";style.type="text/css"}else{if(tag=="script"){style.src=url;style.type="text/javascript"}}style.id=nodename;document.getElementsByTagName("head")[0].appendChild(style)}};GLOBAL.namespace("Sys");GLOBAL.Sys.getAbout=function(d,c,b){if(typeof art=="undefined"){var a="http://app3.cnwest.com/include/";GLOBAL.ScriptCss.load([a+"artDialog/skins/default.css",a+"artDialog/artDialog.min.js"],function(){GLOBAL.Sys.getAbout(d,c,b)});return}art.dialog({id:"about",title:d,content:c,okValue:"\u5173\u95ed",follow:b,ok:function(){return true}})};GLOBAL.Sys.getIndexMonitor=function(a){if(typeof GLOBAL.IndexMonitor=="undefined"){GLOBAL.ScriptCss.load([a],function(){GLOBAL.Sys.getIndexMonitor(a)});return}GLOBAL.IndexMonitor.load()};if(top!=this){var thisurl=window.location.href;if(thisurl=="http://www.cnwest.com/"||thisurl=="http://www.sxtvs.com/"||thisurl=="http://www.sxtvs.com/sxbc/"||thisurl=="http://www.snrtv.com/"){GLOBAL.Sys.getIndexMonitor("http://app3.cnwest.com/include/lib/js/indexmonitor-mod.js")}};
