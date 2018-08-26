<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
<style>
*{
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
}
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
table{
	width:100%;
	border:0px;
}
table tr td{
	border:0px;
	border-bottom:1px solid #eeeeee; 
}
table tr:nth-child(1) td{
	font-weight:bold;
	font-size:13pt;
	background-color:gray;
	color:white;
	height:30px;
}
input[type=submit]{
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
input[type=submit]:hover{
	background-color:#dddddd;
}
</style>
<div id="form1">

<div id="label">회원관리</div>
<p id="label">트래비룸 회원목록입니다.</p>

<div id="form2">
<form method="post" action="memberAction.jsp">
<table border cellspacing=0>
	<tr align="center" height=50px>
		<td width=50px>X</td>
		<td width=250px>이메일</td>		
		<td width=250px>비밀번호</td>
		<td width=150px>이름</td>
		<td width=250px>생년일일</td>
		<td width=150px>사용자구분</td>
	</tr>
 <%
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from member");
    ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {%>
    	<tr align="center" height=40px>
			<td><input type="checkbox" name="check" value=<%=rs.getString("user_id")%>></td>
			<td><%=rs.getString("user_id")%></td>
			<td> <%=rs.getString("user_pw")%></td>
			<td><%=rs.getString("user_name")%></td>
			<td><%=rs.getString("user_birth")%></td>
			<td><%=rs.getString("user_type")%></td>
		</tr>    
 	<%}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
	 
 }
%>
</table><br>
<input type="submit" value="회원삭제">
</form>
</div>
</div>
