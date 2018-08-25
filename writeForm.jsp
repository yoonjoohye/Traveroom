<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
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
table#write input[type=text]{
	font-family: 'Gothic A1', sans-serif;
	font-size:12pt;
	font-weight:bold;
	width:100%;
	height:50px;
	margin-top:20px;
	margin-bottom:20px;
	border:1px solid #cccccc;
}
textarea{
	font-family: 'Gothic A1', sans-serif;
	font-size:12pt;
	border:1px solid #cccccc;
}
input[type=submit]{
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
input[type=submit]:hover{
	background-color:#dddddd;
}
</style>

<div id="form1">

<div id="label">공지사항</div>
<p id="label">트래비룸 숙소 안내, 다양한 소식을 알려드립니다!</p>

<div id="form2">
<form method="post" action="writeAction.jsp">
<center>
<table id="write">
	<tr>
		<td><input type="text" name="title" placeholder="제목을 입력해주세요."/></td>
	</tr>
	<tr>
		<td><textarea name="content" cols=100 rows=25 placeholder="내용을 입력해주세요."></textarea></td>
	</tr>
	<tr align="center">
		<td><input type="submit" value="등록하기"></td>
	</tr>
</table>
</center>
</form>
</div>
</div>
