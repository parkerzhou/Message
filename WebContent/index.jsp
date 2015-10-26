<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script>
  window.location.href=" <c:url value="/Browse_load"/>";
</script> -->
<%
response.sendRedirect(request.getContextPath()+"/Browse_load"); 
%>
