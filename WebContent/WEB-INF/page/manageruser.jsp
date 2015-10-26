<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ page import="po.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>留言板系统</title>
	<link rel="stylesheet" type="text/css" href="resources/css/link.css">
	<%
	List<User> users=(List<User>)session.getAttribute("users");
	%>
</head>
<body style="padding: 100px" background="resources/img/bodybackground17.jpg">
<div id="apDiv1" style="width:570px; margin:0% auto; background:url('resources/img/bodybackground3.jpg'); border:0px solid #00CC00">
  <table border="0px" cellspacing="0" cellpadding="0" style="word-spacing: break-word; border-collapse: collapse; font-size: 12" width="100%">
    <tr>
    	<td height="27" bgcolor="#E0E0E0">用户信息</a>
    </tr>
    <tr>
    <td>
      <table border="0" cellspacing="0" cellpadding="0" style="word-spacing: break-word; border-collapse: collapse; font-size: 12" width="100%">
       <tr>
         <td align="center">用户编号</td>
         <td align="center">用户名</td>
         <td align="center">邮箱</td>
         <td align="center">操作</td>
       </tr>
       <%
       int i=0;
       for(User user:users){
       %>
       <tr>
         <td align="center"><%=user.getUser_id() %></td>
         <td align="center"><%=user.getUser_name() %></td>
         <td align="center"><%=user.getUser_mail() %></td>
         <td align="center"><a href="AdminUser_deleteUser?j=<%=i%>">删除</a></td>
       </tr>
      <%
      i++;
      }%>
       </table>
    </tr> 
  </table>
  <div align="center">
  <form>
  <input type="button" onclick="window.location.href='manager'" value="返回" />
  </form>
  </div>
</div>
</body>
</html>