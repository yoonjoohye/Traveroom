<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div#info{
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
	margin-left:50px;
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
div>b{
	color:#221acc;
	font-size:12pt;
}
div>small{
	font-size:10pt;
}
table{
	font-family: 'Nanum Gothic Coding', monospace;
	margin-left:25%;
	margin-right:25%;
	background-color:white;
}
table a{
	text-decoration:none;
	font-weight:bold;
	color:#2B0698;
	font-size:10pt;
}
input{
	width:300px;
	height:50px;
	border:1px solid #aaaaaa;
}
input[type=button]{
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
<script>
function login(){ 
	var id=loginForm.id.value;
	var pw=loginForm.pw.value;
	if(id==""||pw==""){
		alert("아이디와 비밀번호를 확인해주세요.");	
	}
	else{
		loginForm.submit();
	}
}
</script>
</head>
<body>
<div id="form1">
<div id="label">로그인</div>
<p id="label">트래비룸과 함께 즐겁고 행복한 여행되시길 바랍니다.</p>
<div id="form2">
<form id="loginForm" action="loginAction.jsp" method="post">
<center>
<table>
	<tr align="center">
		<td rowspan=5 width=350px><img src="img/login.jpg" width=100% height=400px></td>
		<td><input type="text" name="id" placeholder="이메일주소"/></td>
	</tr>
	<tr align="center"><td><input type="password" name="pw" placeholder="비밀번호"></td></tr>
	<tr align="center"><td><input type="button" onclick="login()" value="로그인"></td></tr>
	<tr align="center">
		<td align="center">
			<a href="join.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#">아이디 찾기 /</a>
			<a href="#">비밀번호 찾기</a>
		</td>
	</tr>
	<tr>
		<td width=400px>
		<div id="info">
			<b>TraveRoom 트래비룸 </b><br>
			<small>국내 최고의 숙박 사이트로 쉽고 간편한 예약 사이트<br>
			간단한 동의 절차만 거치면 하나의 ID/Password로<br>
			쉽고 간편하게 사이트를 이용하실 수 있습니다.<br></small>
		</div>
		<br><br>
		<div id="info">
			<b>고객센터</b><br>
			<small>운영시간월~금 09:00~17:30 토/일요일 휴무<br>
			Tel.010-9977-3841(수신자부담)<br></small>
		</div>
		</td>
	</tr>
</table>
</center>
</form>
</div>
</div>
</body>
</html>