<%@ page language="java" 
    pageEncoding="UTF-8"%>
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
	function check(username){
		$.post("Login_checkUser",
			    {
		      user_name:username
		    },
		    function(responseText, textStatus, XMLHttpRequest){
		    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
		    	document.getElementById("divdis").innerHTML=responseText;
		    });
	};
	function changecheckcode(){
		var name=document.getElementById("name").value;
		var password=document.getElementById("password").value;
		$.post("Login_changecheckcode",
			    {
			Name:name,
			PWD:password
		    },
		    function(responseText, textStatus, XMLHttpRequest){
		    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
		    });
	};
	</script>
	<script type="text/javascript">
		$(function(){
			$('#ff').form({
				url:'Login_loginWeb',
				onSubmit:function(){
					return $(this).form('validate');
				},
				success:function(responseText){
					location.href=responseText;
				}
			});
		});
	</script>
</head>
<body background="resources/img/bodybackground12.jpg">
<h1 align="center">留言板系统</h1>
<div align="center">
	<div class="easyui-panel" title="登陆" style="width:600px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground10.jpg'); " align="center">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    		<div id="divdis" style="color:#FF0000">${checkerror }${noexist }${codeerror }</div>
	    			<td style="font-weight:bold;font-size:15px;" align="right">用户名:</td>
	    			<td><input id="name" class="easyui-validatebox" missingMessage="用户名必须填写" type="text" name="user.user_name" required="true" onblur="check(this.value)" value="${name }"></input></td>
	    					
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;" align="right">密码:</td>
	    			<td><input id="password" class="easyui-validatebox" missingMessage="密码必须填写" type="password" name="user.user_password" required="true" value="${password}"></input></td>
	    		    
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;" align="right">验证码:</td>
	    			<td><input class="easyui-validatebox" missingMessage="验证码必须填写" type="text" name="code" required="true"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;"></td>
	    			<td align="right"><img border="0" src="Login_checkcode"></td>
	    			<td><input type="button" value="换一张" onmouseover="changecheckcode()" onclick="window.location.href='login'"/></td>
	    		</tr>
	    	</table>
	    	<input type="submit" value="登陆" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="reset" value="重置" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="button" value="返回" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;" onclick="window.history.back()"/>
	        
	    </form>
	    <!-- <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="font-weight:bold;font-size:15px;">登陆</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="font-weight:bold;font-size:15px;">重置</a>
	    </div> -->
	    </div>
	</div>
	</div>
	<!-- <script>
		function submitForm(){
			$('#ff').form('submit');
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script> -->
</body>
<%
session.removeAttribute("checkerror");
session.removeAttribute("name");
session.removeAttribute("noexist");
session.removeAttribute("codeerror");
session.removeAttribute("password");
%>
</html>