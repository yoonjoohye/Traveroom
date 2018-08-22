<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Traveroom</title>
<link rel="icon" type="image/png" href="img/favicon.png" />
<style>
	*{
		margin:0px;
		padding:0px;
	}
	div#content{
		clear:both;
	}
	div#footer{
		clear:both;
		margin-top:50px;
		border-top:1px solid #eeeeee;
		height:100px;
	}
</style>
</head>
<body>
<%
	String content=request.getParameter("content");
%>

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