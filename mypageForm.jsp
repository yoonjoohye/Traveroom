<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
input{
	margin-top:10px;
	margin-bottom:10px;
	font-size:12pt;
}
input[type=text],input[type=password],input[type=date]{
	width:500px;
	height:30px;
}
input[type=button],input[type=reset]{
	margin-left:20px;
	margin-right:20px;
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
input[type=button]:hover,input[type=reset]:hover{
	background-color:#dddddd;
}
</style>
<%
String id=null;
String pw=null;
String name=null;
String birth=null;

if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
	pw=(String)session.getAttribute("userPw");
	name=(String)session.getAttribute("userName");
	birth=(String)session.getAttribute("userBirth");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='index.jsp';");
	out.println("</script>");
}
int point=0;
try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from point where user_id=?");
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    	point+=rs.getInt("point");
   	}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
 }
%>
<script>
function send(index){
	if(index==1){
		var pw=mypageForm.edit_pw.value;
		var name=mypageForm.edit_name.value;
		var birth=mypageForm.edit_birth.value;
		if(pw==""||name==""||birth==""){
			alert("정보를 모두 입력해주세요!");
			return;
		}
		else{
			mypageForm.action="mypageAction.jsp"
		}
	}
	if(index==2){
		var pw=mypageForm.edit_pw.value;
		if(pw!=<%=pw%>){
			alert("비밀번호가 틀립니다.");
		}
		else{
			var check=confirm("정말 탈퇴하시겠습니까?");
			if(check==true){
				mypageForm.action="delmember.jsp";
			}else{
				return false;
			}
		}
	}
	mypageForm.submit();
}


</script>
<div id="form1">

<div id="label">마이페이지</div>
<p id="label">트래비룸 회원정보를 수정하는 목록입니다.</p>

<div id="form2">
<form name="mypageForm" method="post">
<center>
<table>
	<tr>
		<td width=120px>이메일</td>
		<td><input type="text" name="edit_id" value="<%=id%>" disabled/></td>
	</tr>
	<tr>
		<td width=120px>비밀번호</td>
		<td><input type="password" name="edit_pw"/></td>
	</tr>
	<tr>
		<td width=120px>성명</td>
		<td><input type="text" name="edit_name" value="<%=name%>"/></td>
	</tr>
	<tr>
		<td width=120px>생년월일</td>
		<td><input type="date" name="edit_birth" value="<%=birth%>"/></td>
	</tr>
	<tr>
		<td height=50px>포인트</td>
		<td><%=point%>P</td>
	</tr>
	<tr>
		<td colspan=2 align="center">
			<input type="button" onclick="send(1)" value="수정"/>
			<input type="reset" value="취소"/>
			<input type="button" onclick="send(2)" value="회원탈퇴"/>
		</td>
	</tr>
</table>
</center>
</form>
</div>
</div>
