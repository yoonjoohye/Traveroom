<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
table#board{
	border:0px;
	width:100%;
}
table#board tr td{
	font-family: 'Gothic A1', sans-serif;
	font-size:12pt;
	border:0px;
	border-bottom:1px solid #dddddd;
}
table#board tr:nth-child(1){
	font-weight:bold;
	font-size:20pt;
	border:0px;
}
table#notice tr:nth-child(1) td{
	border-bottom:3px solid gray;
}
</style>
<div id="form1">

<div id="form2">
<%
request. setCharacterEncoding("utf-8");
String id=request.getParameter("re");
%>
 <%
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement p=null;
	p = con.prepareStatement("update notice set visit=visit+1 where id=?");
	p.setString(1,id);
	p.executeUpdate();
	p.close();
	
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from notice where id=?");
	pstmt.setString(1,id);
	
	ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {%>
	<table id="board" border cellspacing=0>
    	<tr>
			<td colspan=2 height=80px style="border-bottom:3px solid #999999"><span style="font-size:30px;"><%=rs.getString("title")%></span></td>
		</tr>
		<tr height=50px>
			<td align="left"><%=rs.getString("date")%></td>
			<td align="right">조회수 <%=rs.getString("visit")%></td>
		</tr> 
		<tr>
			<td colspan=2 height=350px><%=rs.getString("content")%></td>
		</tr>  
	</table>
 	<%}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
	 System.out.println(e);
 }
%>
<a href="notice.jsp"><input type="button" value="목록"></a>
</div>
</div>
