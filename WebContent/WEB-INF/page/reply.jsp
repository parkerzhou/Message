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
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#ff').form({
				url:'AdminMessage_addReply',
				onSubmit:function(){
					return $(this).form('validate');
				},
				success:function(responseText){
					alert("回复成功！");
					location.href=responseText;
				} 
			});
		});
	</script>
</head>
<%
List<Message> messages=(List<Message>)session.getAttribute("messages");
Integer i=(Integer)session.getAttribute("i");
%>
<body background="resources/img/bodybackground18.jpg" style="padding: 100px">
<div align="center">
	<div class="easyui-panel" title="回复留言" style="width:500px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground8.jpg');" align="center">
	    <form id="ff" method="post" action="Register_save">
	    	<table cellpadding="5" border="1px">
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言主题:</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="<%=messages.get(i).getMess_theme()%>" name="message.mess_theme"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言内容:</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" readonly="readonly" name="message.mess_content"><%=messages.get(i).getMess_content() %></textarea></td>
	    		</tr>
	    		<%if(messages.get(i).getMess_reply_content()==null){ %>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复:</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" missingMessage="留言回复必须填写" name="message.mess_reply_content" required="true" ></textarea></td>
	    		</tr>
	    		<%} else{%>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复:</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" missingMessage="留言回复必须填写" name="message.mess_reply_content" required="true" ><%=messages.get(i).getMess_reply_content() %></textarea></td>
	    		</tr>
	    		<%} %>
	    	</table>
	    	<input type="submit" value="提交" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="reset" value="重置" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="button" value="返回" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;" onclick="window.history.back()"/>
	    </form>
	    </div>
	</div>
	</div>
</body>
</html>