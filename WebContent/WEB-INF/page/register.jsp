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
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript">
	function check(){
		var username=document.getElementById('name').value;
		var response="";
		$.post("Register_checkUser",
			    {
		      user_name:username
		    },
		    function(responseText, textStatus, XMLHttpRequest){
		    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
		    	document.getElementById("divdis").innerHTML=responseText;
		    });
	};
	</script>
	<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: { validator: function (value, param) { return $(param[0]).val() == value; }, message: '字段不匹配' }
       });
	</script>
	<script type="text/javascript">
		$(function(){
			$('#ff').form({
				url:'Register_save',
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
<body background="resources/img/bodybackground13.jpg" style="padding-top: 100px">

<div align="center">
	<div class="easyui-panel" title="注册" style="width:500px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground3.jpg');" align="center">
	    <form id="ff" method="post" action="Register_save">
	    	<table cellpadding="5">
	    		<tr>
	    		<div id="divdis" style="color:#FF0000" name="a">${exist }</div>
	    			<td style="font-weight:bold;font-size:15px;">用户名:</td>
	    			<td><input id="name" class="easyui-validatebox" missingMessage="用户名必须填写" type="text" name="user.user_name" required="true" onblur="check()"></input></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">密码:</td>
	    			<td><input id="PWD" class="easyui-validatebox" missingMessage="密码必须填写" type="password" name="user.user_password" 
	    			required="true" validType="length[6,12]" invalidMessage="密码需填写6到12位字符" ></input></td>
	    		    <td><font style="color:#0080FF">*请填写6到12位字符</font></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">确认密码:</td>
	    			<td><input id="compassword" class="easyui-validatebox" missingMessage="确认密码必须填写" type="password" name="compassword" 
	    			required="true" validType="equalTo['#PWD']" invalidMessage="两次输入密码不匹配"></input></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">邮箱:</td>
	    			<td><input class="easyui-validatebox" missingMessage="邮箱必须填写" type="text" name="user.user_mail" required="true" validType="email"></input></td>
	    			<td><font style="color:#0080FF">*请填写正确的邮箱格式</font></td>
	    		</tr>
	    	</table>
	    	<input type="submit" value="注册" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="reset" value="重置" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="button" value="返回" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;" onclick="window.history.back()"/>
	    </form>
	    </div>
	</div>
	</div>
</body>
<%
session.removeAttribute("exist");
%>
</html>