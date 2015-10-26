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
		$(function(){
			$('#ff').form({
				url:'Browse_addMessage',
				onSubmit:function(){
					return $(this).form('validate');
				},
				success:function(responseText){
					alert("添加成功！");
					location.href=responseText;
				} 
			});
		});
	</script>
</head>
<body background="resources/img/bodybackground15.jpg" style="padding: 100px">
<div align="center">
	<div class="easyui-panel" title="添加留言" style="width:500px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground2.jpg');" align="center">
	    <form id="ff" method="post" action="Register_save">
	    	<table cellpadding="5" border="1px">
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言分类：</td>
	    			<td><select id="message.mess_sort_id" class="easyui-validatebox" missingMessage="留言分类必须填写" name="message.mess_sort_id" required="true">
	    			<option value="1">祝福留言</option>
	    			<option value="2">爱情留言</option>
	    			<option value="3">友情留言</option>
	    			<option value="4">搞笑留言</option>
	    			<option value="5">伤感留言</option>
	    			<option value="6">其他留言</option>
	    			</select></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言主题:</td>
	    			<td><input style="width: 200px" id="message.mess_theme" class="easyui-validatebox" missingMessage="留言主题必须填写" type="text" name="message.mess_theme" required="true"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言内容:</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" missingMessage="留言内容必须填写" name="message.mess_content" required="true"></textarea></td>
	    		</tr>
	    	</table>
	    	<input type="submit" value="添加" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="reset" value="重置" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;"/>
	    	<input type="button" value="返回" class="easyui-linkbutton" style="font-weight:bold;font-size:15px;" onclick="window.history.back()"/>
	    </form>
	    </div>
	</div>
	</div>
</body>
</html>