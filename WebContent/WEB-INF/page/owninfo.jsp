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
</head>
<body background="resources/img/bodybackground14.jpg">
<div align="center" style="padding: 100px">
	<div class="easyui-panel" title="你的个人信息" style="width:500px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground3.jpg');" align="center">
	    <form id="ff" method="post" action="Register_save">
	    	<table cellpadding="5">
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">用户名:</td>
	    			<td><input class="easyui-validatebox" type="text" readonly="readonly" value="${user.user_name }"></input></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">邮箱:</td>
	    			<td><input class="easyui-validatebox" type="text" readonly="readonly" value="${user.user_mail }"> </input></td>
	    		</tr>
	    	</table>
	        <input type="button" value="修改" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;" onclick="window.location.href='alterowninfo'"/>
	    	<input type="button" value="返回" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;" onclick="window.location.href='browse'"/>
	    </form>
	    </div>
	</div>
	</div>
</body>
<%
session.removeAttribute("exist");
%>
</html>