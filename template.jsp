<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/template.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Traveroom</title>
<link rel="icon" type="image/png" href="img/favicon.png" />
</head>
<body>
<%
	String content=request.getParameter("content");
%>
<div id="nav">
	<jsp:include page="nav.jsp" flush="false"/>
</div>
<div id="header">
	<jsp:include page="header.jsp" flush="false"/>
</div>
<div id="content">
	<jsp:include page="<%=content %>" flush="false"/>
</div>
<div id="footer">
	<jsp:include page="footer.jsp" flush="false"/>
</div>
</body>
</html>