<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
<style>
div#form1{
	text-align:center;
	padding-top:20px;
	padding-bottom:50px;
	background-color:#eeeeee;
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
}
div#label{
	text-align:center;
	font-size:20pt;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight:bold;
	color:#666666;
}
p#label{
	text-align:center;
	font-size:10pt;
	font-family: 'Nanum Gothic Coding', monospace;
	color:#666666;
	margin-bottom:20px;
}
div#form2{
	text-align:center;
	margin-left:20%;
	margin-right:20%;
	background-color:white;
}
table#notice{
	border:0px;
	width:100%;
}
table#notice tr td{
	font-family: 'Gothic A1', sans-serif;
	font-size:12pt;
	border:0px;
	border-bottom:1px solid #dddddd;
}
table#notice tr:nth-child(1){
	font-weight:bold;
	font-size:20pt;
}
table#notice tr:nth-child(1) td{
	border-bottom:3px solid gray;
}
table#notice a{
	text-decoration:none;
	color:gray;
}
table#notice a:hover{
	color:#aaaaaa;	
}
input[type=button]{
	margin-left:20px;
	margin-right:20px;
	margin-top:20px;
	margin-bottom:20px;
	width:150px;
	height:50px;
	background-color:#eeeeee;
	border:0px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size:12pt;
	font-weight:bold;
	color:#555555;
}
input[type=button]:hover{
	background-color:#dddddd;
}
</style>
<div id="form1">

<div id="label">공지사항</div>
<p id="label">트래비룸 숙소 안내, 다양한 소식을 알려드립니다!</p>

<div id="form2">
<%
String type=null;
Boolean check=false;
if(session.getAttribute("userType")!=null){
	check=true;
	type=(String)session.getAttribute("userType");
}
%>

<table id="notice" border cellspacing=0>
	<tr height=50px>
		<td>번호</td>
		<td>제목</td>
		<td>날짜</td>
		<td>조회수</td>
	</tr>
 <%	
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from notice order by id desc");
    ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    %>
    <tr height=40px>
		<td width=10%><%=rs.getString("id")%></td>
		<td width=65%><a href="board.jsp?re=<%=rs.getString("id")%>"><%=rs.getString("title")%></a></td>
		<td width=15%><%=rs.getString("date")%></td>
		<td><%=rs.getString("visit")%></td>
	</tr>  
 	<%  }
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
	 System.out.println(e);
 }
%>
</table>
<%
if(check==true){
	if(type.equals("관리자")){
%>
<a href="write.jsp"><input type="button" value="글쓰기"/></a>
<%}
}%>
</div>
</div>