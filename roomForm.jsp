<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">

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
	padding-top:20px;
	text-align:center;
	margin-left:20%;
	margin-right:20%;
	background-color:white;
}
input[type=button],input[type=submit]{
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
input[type=button]:hover,input[type=submit]:hover{
	background-color:#dddddd;
}
table#room{
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
	font-family: 'Gothic A1', sans-serif;
	font-size:11pt;
	color:#888888;
}
table#room a>b{
	font-family: 'Gothic A1', sans-serif;
}
</style>
<div id="form1">

<div id="label">나의 숙소</div>
<p id="label">트래비룸 호스트 회원이 등록한 숙소 목록입니다.</p>

<div id="form2">
<form method="post" action="delroom.jsp">
<%
String possible="";
String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}

try {
    // 드라이버 로딩
    String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from room where user_id=?");
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
		if(rs.getString("possible").equals("y")){
			possible="즉시 예약가능";
		}
		else{
			possible="예약 불가능";
		}
%>
	<center>
	<table id="room" border=1px cellspacing=0>
		<tr>
			<td><input type="checkbox" name="check" value=<%=rs.getString("id")%>></td>
		</tr>
	   	<tr>
	   		<td><a href="roominfo.jsp?re=<%=rs.getString("id")%>"><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="500px" height="300px"></a></td>
	   	</tr>
	   	<tr>
			<td>
			<a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:red; font-weight:bold;"><%=possible %></span></a>
			<a style="padding-left:200px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#666666;"><%=rs.getString("city") %></span></a>
	   		<a style="padding-left:20px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#666666;"><%=rs.getString("type") %></span></a>
	   		</td>
		</tr>
		<tr>
	   		<td><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><b style="color:#666666; font-size:15pt;"><%=rs.getString("name") %></b></a></td>
	   	</tr>
		<tr>
			<td><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#666666;">1인당 <%=rs.getString("price") %>원</span></a></td>
		</tr>
	   	 <tr>
	   		<td><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span>평점 <%=rs.getString("grade") %>점</span></a></td>
	   	</tr>
	</table><br><br>
	</center>
<% }
	rs.close();
	pstmt.close();
	con.close();
} catch (Exception e) { 
	out.println("아직 숙소를 등록하지 않았습니다.");
	System.out.println("DB 연동 실패 " + e.getMessage());
}
%>
<center>
	<a href="host.jsp"><input type="button" value="숙소 등록"></a>
	<input type="submit" value="숙소 삭제">
</center>
</form>
</div>
</div>
