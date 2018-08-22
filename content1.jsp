<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">

<style>
div#label{
	margin-left:20%;
	margin-right:20%;
	margin-bottom:20px;
	font-size:20pt;
	font-weight:bold;
	font-family: 'Nanum Gothic Coding', monospace;
	color:#555555;
}
div#form1{
	margin-left:20%;
	margin-right:20%;
	text-align:center;
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
}
table#room{
	display:inline-block;
	margin-right:30px;
	float:left;
	padding:10px;
	border:1px solid #eeeeee;
	box-shadow: 0px 5px 10px #eeeeee;
}
table#room tr td{
	border:0px;
}
a{
 	text-decoration:none;
}
table#room a>span{
	font-size:10pt;
	font-family: 'Gothic A1', sans-serif;
	color:#888888;
}
table#room a>b{
	font-family: 'Nanum Gothic Coding', monospace;
}
</style>
<div id="label">트래비룸 전체 숙소</div>
<div id="form1">
<% 
String possible="";
try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from room where possible!=? LIMIT 3");
	pstmt.setString(1,"n");
    ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    	if(rs.getString("possible").equals("y")){
			possible="즉시 예약가능";
		}
		else{
			possible="예약 불가능";
		}
    %>
    	<table id="room" border=1px cellspacing=0>
	   	<tr>
	   		<td><a href="roominfo.jsp?re=<%=rs.getString("id")%>"><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="250px" height="150px"></a></td>
	   	</tr>
	   	<tr align="left">
			<td>
			<a style="padding-left:10px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#BA0202; font-weight:bold;"><%=possible %></span></a>
			<a style="padding-left:55px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span><%=rs.getString("city") %></span></a>
	   		<a style="padding-left:10px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span><%=rs.getString("type") %></span></a>
	   		</td>
		</tr>
		<tr align="left">
	   		<td><a style="padding-left:10px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><b style="color:#888888; font-size:15pt;"><%=rs.getString("name") %></b></a></td>
	   	</tr>
		<tr align="left">
			<td><a style="padding-left:10px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span><%=rs.getString("price") %>원/추가요금</span></a></td>
		</tr>
	   	 <tr align="left">
	   		<td><a style="padding-left:10px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span>평점 <%=rs.getString("grade") %>점</span></a></td>
	   	</tr>
	</table>
 <%}
    rs.close();
    pstmt.close();
    con.close();
 }
 catch(Exception e){
	 System.out.println("연동 실패");
 }
%>
</div>