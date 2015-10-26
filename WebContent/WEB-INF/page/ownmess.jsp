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
</head>
<body style="padding: 100px" background="resources/img/bodybackground20.jpg">
<div id="apDiv1" style="width:570px; margin:0% auto; background:url('resources/img/bodybackground7.jpg'); border:0px solid #00CC00">
  <table border="0px" cellspacing="0" cellpadding="0" style="word-spacing: break-word; border-collapse: collapse; font-size: 12" width="100%">
    <tr>
    	<td height="27" bgcolor="#E0E0E0">个人留言</a>
    </tr>
    <tr>
    <td>
      <table border="0" cellspacing="0" cellpadding="0" style="word-spacing: break-word; border-collapse: collapse; font-size: 12" width="100%">
       <tr>
         <td align="center" style="font-size: 20px;border: thick;">留言时间</td>
         <td align="center" style="font-size: 20px;border: thick;">留言主题</td>
         <td align="center" style="font-size: 20px;border: thick;">留言者</td>
       </tr>
         <%
              DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
              List<Message> OwnMess=(List<Message>)session.getAttribute("OwnMess");
              if(OwnMess.size()!=0){
              for(int i=0;i<OwnMess.size();i++){
         %>
         <tr>
            <td align="center" style="font-size: 20px;color:#00F"><%=date.format(OwnMess.get(i).getMess_time()) %></td>
            <td align="center" style="font-size: 20px;color:#00F"><a href="Browse_getContent?i=<%=i%>&type=8"><%=OwnMess.get(i).getMess_theme() %></a></td>
            <td align="center" style="font-size: 20px;color:#00F"><%=OwnMess.get(i).getMess_user_name() %></td>
         </tr>
          <%}}%>
       </table>
    </tr> 
  </table>
  <div align="center">
  <form>
  <input type="button" onclick="window.history.back()" value="返回" />
  </form>
  </div>
</div>
</body>
</html>