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
	function selected(){
		$.ajax({
				url:"AdminMessage_selected",
			    
				success:function(responseText){
		    	/* this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0] */
		    	alert("操作成功！");
		    	if(document.getElementById("select").value=="精选")
		    	document.getElementById("select").value="退出精选"
		    	else
		    		document.getElementById("select").value="精选"
		    }});
	}
	</script>
</head>
<%
List<Message> messages=(List<Message>)session.getAttribute("messages");
Integer i=(Integer)session.getAttribute("i");
Manager manager=(Manager)session.getAttribute("manager");
User user=(User)session.getAttribute("user");
%>
<body background="resources/img/bodybackground16.jpg" style="padding: 50px">
<div align="center">
	<div class="easyui-panel" title="留言" style="width:500px;">
		<div style="padding:10px 60px 20px 60px;background:url('resources/img/bodybackground9.jpg');" align="center">
	    <form id="ff" method="post" action="Register_save">
	    	<table  cellpadding="5" border="2px">
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言主题:</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="<%=messages.get(i).getMess_theme() %>"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言者：</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="<%=messages.get(i).getMess_user_name() %>"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言时间：</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="<%=messages.get(i).getMess_time() %>"></input></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言内容:</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" readonly="readonly"><%=messages.get(i).getMess_content() %></textarea></td>
	    		</tr>
	    		<%
                             if(messages.get(i).getMess_reply_time()!=null){ %>
						 <tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复时间：</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="<%=messages.get(i).getMess_reply_time() %>"></input></td>
	    		</tr>                                   
                         <%}
                         else{ 
                         %>
						<tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复时间：</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="无"></input></td>
	    		</tr>        
                         <%} %>
                         <%if(messages.get(i).getMess_reply_name()!=null){ %>
                         <tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复人：</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="<%=messages.get(i).getMess_reply_name() %>"></input></td>
	    		</tr>                                              
                          <%}
                        else{ 
                        %>
                        <tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复人：</td>
	    			<td><input style="width: 200px"  class="easyui-validatebox" type="text" readonly="readonly" value="无"></input></td>
	    		</tr>               
                        <%} %>
                        <%if(messages.get(i).getMess_reply_content()!=null){ %>
                   
                         <tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复内容：</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" readonly="readonly"><%=messages.get(i).getMess_reply_content() %></textarea></td>
	    		</tr>                                   
                        <%}
                        else{ 
                        %>
                      
						 <tr>
	    			<td style="font-weight:bold;font-size:15px;">留言回复内容：</td>
	    			<td><textarea style="width: 200px;height: 150px" class="easyui-validatebox" readonly="readonly">无</textarea></td>
	    		</tr>        
                        <%} %>
					</table>
	    		
	    		
	    		
	    	<%
if(manager!=null){
%>

<input type="button" onclick="window.history.back()" value="返回"/>
<input type="button" onclick="window.location.href='reply'" value="回复留言"/>
<input type="button" onclick="window.location.href='AdminMessage_deleteMessage'" value="删除留言"/>
<%if(messages.get(i).getMess_isselected()==0){
%>
<input id="select" type="button" onclick="selected()" value="精选"/>	
<%}else{ %>
<input id="select" type="button" onclick="selected()" value="退出精选"/>
<%} %>
<%}
else{
%>

<input type="button" onclick="window.history.back()" value="返回"/>

	<%} %>
				</form>
	    </div>
	</div>
	</div>
</body>
</html>