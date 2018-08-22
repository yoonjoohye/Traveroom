<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
request.setCharacterEncoding("utf-8");
String city=request.getParameter("city"); 
%>
 
<jsp:forward page="template.jsp">
	<jsp:param name="content" value="resultForm.jsp"/>
	<jsp:param name="city" value="<%=city %>"/>
</jsp:forward>