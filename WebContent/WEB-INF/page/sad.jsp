<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ page import="po.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body style="padding: 100px">
    <div style="border: thin;;">
       <table cellpadding="10px">
       <%
              DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
              List<Message> SadMess=(List<Message>)session.getAttribute("SadMess");
		      String selected="";
              if(SadMess.size()!=0){
              for(int i=0;i<SadMess.size();i++){
            	  if(i==SadMess.size()-1){selected="selected";}
         %>
         <tr>
            <td style="font-size: 20px;color:#00F"><%=date.format(SadMess.get(i).getMess_time()) %></td>
            <td style="font-size: 20px;color:#00F"><a href="Browse_getContent?i=<%=i%>&type=5"><%=SadMess.get(i).getMess_theme() %></a></td>
            <td style="font-size: 20px;color:#00F"><%=SadMess.get(i).getMess_user_name() %></td>
         </tr>
          <%}}%>
       </table>
    </div>
</body>
</html>