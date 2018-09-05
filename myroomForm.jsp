<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function cancel(){
		var check=confirm("예약을 취소하시겠습니까?");
		if(check){
			myroomForm.submit();
		}
		else{
			return;
		}
	}
</script>
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
table#room{
	padding:10px;
	border:1px solid #eeeeee;
	box-shadow: 0px 5px 10px #eeeeee;
}
table#room input[type=button]{
	width:150px;
	height:50px;
	border:0px;
	background-color:#221acc;
	color:white;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size:12pt;
	font-weight:bold;
}
table#room input[type=button]:hover{
	background-color:#0404B4;
}
table#room tr td{
	border:0px;
}
a{
 	text-decoration:none;
}
table#room a>span{
	font-family: 'Gothic A1', sans-serif;
	font-size:14pt;
	color:#888888;
}
table#room a>b{
	font-family: 'Gothic A1', sans-serif;
}
</style>
<div id="form1">

<div id="label">예약한 숙소</div>
<p id="label">트래비룸 게스트 회원이 예약한 숙소 목록입니다.</p>

<div id="form2">
<form name="myroomForm" method="post" action="myroomAction.jsp">

<%
String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");
}
SimpleDateFormat fm1 = new SimpleDateFormat("yyyy-MM-dd"); 
String date = fm1.format(new Date()); 


try {
    String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt1=null;
   	pstmt1=con.prepareStatement("update room, book set possible=? where room.id=book.id AND book.checkout=?");
   	pstmt1.setString(1,"y");
   	pstmt1.setString(2,date);
   	
   	pstmt1.executeUpdate();

   	pstmt1=null;
	pstmt1=con.prepareStatement("delete from book where checkout=?");
	pstmt1.setString(1,date);
	pstmt1.executeUpdate();
	pstmt1.close();
	
	
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from book, room where book.id=room.id AND book.user_id=?");
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
	
	%>
	<input type="hidden" value="<%= rs.getInt("id")%>" name="id">
	<center>
	<table id="room" border=1px cellspacing=0>
	   	<tr>
	   		<td colspan=2><a href="roominfo.jsp?re=<%=rs.getString("id")%>"><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="500px" height="300px"></a></td>
	   	</tr>
	   	<tr>
			<td>
			<a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>">
			<span style="color:#666666; font-size:11pt;">
			<%=rs.getString("city") %>의 <%=rs.getString("type") %>
	   		</span></a>
	   		</td>
	   		<td rowspan=4 align=right style="padding-right:30px;"><input type="button" onclick="cancel()" value="예약취소"></td>
		</tr>
		<tr>
	   		<td><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><b style="color:#666666; font-size:20pt;"><%=rs.getString("name") %></b></a></td>
	   	</tr>
		<tr>
			<td><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#666666;"><%=rs.getString("price") %>원</span></a></td>
		</tr>
	   	 <tr>
	   		<td><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span>평점 <%=rs.getString("grade") %>점</span></a></td>
	   	</tr>
	</table><br><br>
	</center>
<%}
		rs.close();
		pstmt.close();
	   	con.close();
   	
	} catch (Exception e) { 
		out.println("아직 예약한 숙소가 없습니다.");
	    System.out.println("DB 연동 실패 " + e.getMessage());
	}
%> 
</form>
</div>
</div>