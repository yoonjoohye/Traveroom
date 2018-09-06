<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>
<style>
div#form1{
	text-align:center;
	padding-top:20px;
	padding-bottom:50px;
	background-color:#eeeeee;
	color:gray;
}
div#label{
	text-align:center;
	font-size:20pt;
	font-weight:bold;
	color:#666666;
}
p#label{
	text-align:center;
	font-size:10pt;
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
div#card{
	border-radius:10px;
	background-image:URL("img/card.png");
	background-repeat:no-repeat;
	width:900px;
	height:500px;
	background-size: 100% 100%;
	border:1px solid #cccccc;
	box-shadow: 0px 5px 10px #cccccc;
}
div#card table#temp{
	width:85%;
	height:85%;
}
div#card input[type="text"], input[type="date"],select{
	width:180px;
	height:30px;
	margin-bottom:20px;
}
div#card input[type="number"]{
	width:100px;
}
div#card input[type="radio"]{
	margin-bottom:20px;
}
input[type="button"]{
	margin-bottom:20px;
	width:300px;
	height:100px;
	background-color:#eeeeee;
	border:0px;
	font-size:20pt;
	font-weight:bold;
	color:#555555;
}
input[type="button"]:hover{
	background-color:#dddddd;
}
</style>
<script>
	function check(){
		var num1=eventForm.number1.value;
		var num2=eventForm.number2.value;
		var num3=eventForm.number3.value;
		var name=eventForm.name.value;
		var date=eventForm.date.value;
		var num=num1+num2+num3;
		var check=true;
		<%
		try{
			String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String DB_USER = "root";
			String DB_PASSWORD= "1234";
		 
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			PreparedStatement pstmt=null;
			pstmt = con.prepareStatement("select * from event");
			
			ResultSet rs = pstmt.executeQuery();
		    while(rs.next())
		    {%>
				if(<%=rs.getString("num")%>==num){
					check=false;	
				}
		 	<%}
		    rs.close();
		    pstmt.close();
		    con.close(); 
		 }
		 catch(Exception e){
			 System.out.println(e);
		 }
		 %>
		if(check==true){
			if(num1!=""&&num2!=""&&num3!=""&&name!=""&&date!=""){
				eventForm.submit();
			} 
			else{
				alert("정보를 모두 입력해주세요");
				return;
			}
		}
		else{
			alert("이미 사용된 헌혈증입니다.");
		}
	}
</script>
<div id="form1">
<div id="label">헌혈 이벤트-정보 입력</div>
<p id="label">
헌혈 후 받은 헌혈증서의 정보를 입력해주세요.<br>
포인트 슬롯을 돌릴 기회를 드립니다.
</p>
<div id="form2">
<center>
<form name="eventForm" method="post" action="eventAction.jsp">
<div id="card">
	<table id="temp">
		<tr>
			<td height=58px colspan=2 align="right">
				<input type="number" name="number1">-<input type="number" name="number2">-<input type="number" name="number3">
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type="text" name="name"><br>
				<input type="date" name="date">
			</td>
			<td align="right">
				<select name="type">
					<option value="전혈헌혈" selected>전혈헌혈</option>
					<option value="성분헌혈">성분헌혈</option>
				</select><br>
				<input type="radio" name="gender" value="남" checked>남 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="여">여
			</td>
		</tr>
	</table>
</div>
<br><br>
<input type="button" value="이벤트 참여하기" onclick="check()">
</form>
</center>
</div>
</div>