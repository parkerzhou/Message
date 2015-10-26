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
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	function check(username){
		$.post("AdminLogin_checkManager",
			    {
		      user_name:username
		    },
		    function(responseText, textStatus, XMLHttpRequest){
		    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
		    	document.getElementById("divdis").innerHTML=responseText;
		    });
	};
	function changecheckcode(){
		var name=document.getElementById("adminname").value;
		var password=document.getElementById("adminPWD").value;
		$.post("AdminLogin_changecheckcode",
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
				url:'AdminLogin_loginWeb',
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
<body background="resources/img/bodybackground.jpg">
<h1 align="center">留言板系统后台管理</h1>
<div align="center">
	<div class="easyui-panel" title="登陆" style="width:450px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground11.jpg'); " align="center">
	    <form id="ff" method="post">
	    	<table cellpadding="5" >
	    		<tr>
	    		<div id="divdis" style="color:#FF0000">${checkadminerror }${adminnoexist }${admincodeerror }</div>
	    			<td style="font-weight:bold;font-size:15px;" align="right">管理员名字:</td>
	    			<td><input id="adminname" class="easyui-validatebox" missingMessage="管理员名字必须填写" type="text" name="manager.man_name" required="true" onblur="check(this.value)" value="${adminname }"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;" align="right">密码:</td>
	    			<td><input id="adminPWD" class="easyui-validatebox" missingMessage="密码必须填写" type="password" name="manager.man_password" required="true" value="${adminPWD }"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;" align="right">验证码:</td>
	    			<td><input class="easyui-validatebox" missingMessage="验证码必须填写" type="text" name="admincode" required="true"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;"></td>
	    			<td align="right"><img border="0" src="AdminLogin_checkcode"></td>
	    			<td><input type="button" value="换一张" onmouseover="changecheckcode()" onclick="window.location.href='adminlogin'"/></td>
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
session.removeAttribute("checkadminerror");
session.removeAttribute("adminname");
session.removeAttribute("adminnoexist");
session.removeAttribute("admincodeerror");
session.removeAttribute("adminPWD");
%>
</html>