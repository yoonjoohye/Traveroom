<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function send(idx){
		if(idx==1){
			var x=confirm("정말 숙소를 삭제하시겠습니까?");
			if(x==true){
				roomForm.action="delroom.jsp";
			}
			else{
				return;
			}
		}
		else if(idx==2){
			var x=confirm("정말 예약을 취소하시겠습니까?");
			if(x==true){
				roomForm.action="delbook.jsp";
			}
			else{
				return;
			}
		}
		roomForm.submit();
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
table#room{
	width:50%;
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
table#book{
	border:0px;
	text-align:center;	
	font-family: 'Gothic A1', sans-serif;
	border-left:1px solid #eeeeee;
	border-right:1px solid #eeeeee;
}
table#book tr th{
	border:0px;
	border-top:1px solid #eeeeee;
	font-family: 'Gothic A1', sans-serif;
}
table#book tr td{
	font-family: 'Gothic A1', sans-serif;
	border-top:1px solid #eeeeee;
	border-bottom:1px solid #eeeeee;

}
table#book input{
	width:30px;
	height:30px;
	background-color:#FF8000;
	color:white;
}
</style>
<div id="form1">

<div id="label">나의 숙소</div>
<p id="label">트래비룸 호스트 회원이 등록한 숙소 목록입니다.</p>

<div id="form2">
<form name="roomForm" method="post">
<%
String possible="";
int i=0;
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
		int code=rs.getInt("id");
%>
	<center>
	<table id="room" border=1px cellspacing=0>
		<tr>
			<td colspan=2><input type="checkbox" name="check" value=<%=rs.getString("id")%>></td>
		</tr>
	   	<tr>
	   		<td align="center" colspan=2><a href="roominfo.jsp?re=<%=rs.getString("id")%>"><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="500px" height="300px"></a></td>
	   	</tr>
	   	<tr>
			<td>
				<a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>">
					<span style="color:#666666;"><%=rs.getString("city") %>의 <%=rs.getString("type") %></span>
				</a>
			</td>
			<td align="right">
				<a style="padding-right:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#FF8000; font-weight:bold;"><%=possible %></span></a>
	   		</td>
		</tr>
		<tr>
	   		<td colspan=2><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><b style="color:#666666; font-size:15pt;"><%=rs.getString("name") %></b></a></td>
	   	</tr>
		<tr>
			<td colspan=2><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span style="color:#666666;"><%=rs.getString("price") %>원/추가요금</span></a></td>
		</tr>
	   	 <tr>
	   		<td colspan=2><a style="padding-left:50px;" href="roominfo.jsp?re=<%=rs.getString("id") %>"><span>평점 <%=rs.getString("grade") %>점</span></a></td>
	   	</tr>
	   	<tr>
	   		<td colspan=2 align="center">
	   		<% 
	   		PreparedStatement pstmt1=null;
			pstmt1=con.prepareStatement("select * from book where id=?");
			pstmt1.setInt(1,code);
			ResultSet rs1 = pstmt1.executeQuery();
			while(rs1.next()){
			i++;%>
			<table id="book" border cellspacing=0 width="500px">
				<tr>
					<th>예약자</th>
					<th>숙박날짜</th>
					<th>인원</th>
					<th>가격</th>
				</tr>
				<tr>
					<td><%=rs1.getString("name") %><br>(<%=rs1.getString("user_id") %>)</td>
					<td><%=rs1.getString("checkin") %>~<%=rs1.getString("checkout") %></td>
					<td><%=rs1.getInt("member") %>명</td>
					<td><%=rs1.getInt("price") %>원</td>
				</tr>
			</table>
		<%}
		rs1.close();
		pstmt1.close();%>
	   		</td>
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
	<input type="button" onclick="send(1)" value="숙소 삭제">
</center>
</form>
</div>
</div>
