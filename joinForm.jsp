<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet"> 
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
div#agree{
	text-align:left;
	color:#666666;
	font-size:20px;
	font-weight:bold;
	width:750px;
	padding-top:20px;
}
table#agree tr:nth-child(1){
	color:#666666;
	font-size:20px;
	font-weight:bold;
}
iframe{
	border-top:3px solid #666666;
	border-bottom:1px solid gray;
}
input[type=text],input[type=password],input[type=date]{
	width:600px;
	height:30px;
}
select{
	width:160px;
	height:30px;
}
input#email1, input#email2{
	width:200px;
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
<script>
function email_chk(){
	if(joinForm.email.value!=""){
		joinForm.email2.value=joinForm.email.value;
	}
}
function join(){
	var email1=joinForm.email1.value;
	var email2=joinForm.email2.value;
	var pw=joinForm.user_pw.value;
	var name=joinForm.user_name.value;
	var birth=joinForm.user_birth.value;
	if(pw!="" &&name!=""&&email1!=""&&email2!=""&&birth!=""&&document.getElementById("check1").checked && document.getElementById("check2").checked){
		joinForm.submit();
	}
	else{
		alert("정보를 모두 입력해주세요");
		return;
	}
}
</script>
</head>
<body>
<div id="form1">

<div id="label">회원가입</div>
<p id="label">트래비룸과 함께 즐겁고 행복한 여행되시길 바랍니다.</p>

<div id="form2">
<form name="joinForm" method="post" action="joinAction.jsp">
<center>
<div id="agree">개인정보</div>
<table id="info">
	<tr height=50px>
		<td width=100px>이메일</td>
		<td>
			<input type="text" name="email1" id="email1" placeholder="이메일 주소" /> @
			<input type="text" name="email2" id="email2" placeholder="직접 입력"/>
			<select name="email" id="email" onchange="email_chk()">
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
			</select>
		</td>
	</tr>
	<tr height=50px>
		<td>비밀번호</td>
		<td><input type="password" name="user_pw" placeholder="비밀번호"/></td>
	</tr>
	<tr height=50px>
		<td>성명</td>
		<td><input type="text" name="user_name" placeholder="성명"/></td>
	</tr>
	<tr height=50px>
		<td>생년월일</td>
		<td><input type="date" name="user_birth"/></td>
	</tr>
	<tr height=50px>
		<td>사용자구분</td>
		<td align="center">
			<input type="radio" id="guest" name="type" value="게스트" checked/><label for="guest">게스트</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id="host" name="type" value="호스트"/><label for="host">호스트</label>
		</td>
	</tr>
</table><br>

<table id="agree">
	<tr><td align="left">이용약관</td></tr>
	<tr>
		<td><iframe src="agree1.jsp" id="iframe1" width="750px" height="250px" frameborder=0></iframe></td>
	</tr>
	<tr>
		<td align="left">
			약관에 동의하십니까?
			<input type="checkbox" id="check1" value="agree"><label for="check1">동의함</label>
		</td>
	</tr>
</table><br>

<table id="agree">
	<tr><td align="left">개인정보취급방침</td></tr>
	<tr>
		<td><iframe src="agree2.jsp" id="iframe2" width="750px" height="250px" frameborder=0></iframe></td>
	</tr>
	
	<tr>
		<td align="left">
			약관에 동의하십니까?
			<input type="checkbox" id="check2"value="agree"><label for="check2">동의함</label>
		</td>
	</tr>
</table><br>

<table>
	<tr>
		<td align="center">
			<input type="button" class="button-one" onclick="join()" value="가입">
			<input type="reset" class="button-one" value="취소">
		</td>
	</tr>
</table>
</center>
</form>
</div>

</div>
</body>
</html>