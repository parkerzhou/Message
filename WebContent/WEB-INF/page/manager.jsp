<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ page import="po.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>留言板系统</title>
	<link rel="stylesheet" type="text/css" href="resources/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="resources/css/icon.css">
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css">
	<link rel="stylesheet" type="text/css" href="resources/css/link.css">
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	function getAllMess(){
		$.post("Browse_getAllMess",
			    {},
		     function(responseText, textStatus, XMLHttpRequest){
		    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
		    	document.getElementById("all").innerHTML=responseText;
		    });
		} 
		function getChoiceMess(){
			$.post("Browse_getChoiceMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("choice").innerHTML=responseText;
			    });
		}
		function getWishMess(){
			$.post("Browse_getWishMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("wish").innerHTML=responseText;
			    });
		}
		function getLoveMess(){
			$.post("Browse_getLoveMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("love").innerHTML=responseText;
			    });
		}
		function getFriendMess(){
			$.post("Browse_getFriendMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("friend").innerHTML=responseText;
			    });
		}
		function getFunnyMess(){
			$.post("Browse_getFunnyMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("funny").innerHTML=responseText;
			    });
		}
		function getSadMess(){
			$.post("Browse_getSadMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("sad").innerHTML=responseText;
			    });
		}
		function getOtherMess(){
			$.post("Browse_getOtherMess",
				    {},
			     function(responseText, textStatus, XMLHttpRequest){
			    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
			    	/* $('#choice').hide(); */
			    	document.getElementById("other").innerHTML=responseText;
			    });
		}
		window.setInterval(getChoiceMess,1000);
		window.setInterval(getAllMess,1000);
		window.setInterval(getWishMess,1000);
		window.setInterval(getLoveMess(),1000);
		window.setInterval(getFriendMess,1000);
		window.setInterval(getFunnyMess,1000);
		window.setInterval(getSadMess,1000);
		window.setInterval(getOtherMess,1000);
		window.onload=function(){
			getChoiceMess();
			getAllMess();
			getWishMess();
			getLoveMess();
			getFriendMess();
			getFunnyMess();
			getSadMess();
			getOtherMess(); 
		};
	</script>
</head>
<body>
 <div class="easyui-layout" style="width:100%;height:595px;">
   <div region="north" style="height:150px;background:url('resources/img/bodybackground4.jpg');" >
    <div align="left" style="font-size: 20px; padding-right: 20px">后台管理员：${manager.man_name }</div>
    <p align="center" style="font-size: 30px;font-weight:bolder ;">留言板系统后台管理</p>
  </div>
  <div region="west" title="功能" style="width:272px;background:url('resources/img/bodybackground5.jpg');">
	   <div align="center" style="padding-top: 10px"><a href="AdminMessage_exit">退出</a></div><hr noshade color="#8E8E8E" width="150px" align="center">
	   <div align="center" style="padding-top: 10px"><a href="AdminUser_checkUserMess">查看用户信息</a></div><hr noshade color="#8E8E8E" width="150px" align="center">
  </div>
  <div id="content" region="center" >
  <div class="easyui-tabs" style="width:px;height:443px;">
	<div id="all" title="全部留言" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="choice" title="精选留言" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="wish" title="祝福留言" iconCls="icon-reload" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="love" title="爱情留言" iconCls="icon-reload" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="friend" title="友情留言" iconCls="icon-reload" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="funny" title="搞笑留言" iconCls="icon-reload" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="sad" title="伤感留言" iconCls="icon-reload" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
	<div id="other" title="其他留言" iconCls="icon-reload" closable="true" style="padding:10px;background:url('resources/img/bodybackground6.jpg')">
	</div>
</div>
  </div>
 </div>
</body>
</html>