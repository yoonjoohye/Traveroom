<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function send(){
	var member=hostForm.roomMember.value;
	var city=hostForm.roomCity.value;
	var price=hostForm.roomPrice.value;
	var name=hostForm.roomName.value;
	var explain=hostForm.roomExplain.value;
	var number=hostForm.roomNumber.value;
	var img=hostForm.roomImage.value;
	
	if(member!=""&&city!=""&&price!=""&&name!=""&&explain!=""&&number!=""&&img!=""){
		hostForm.submit();
	}
	else{
		alert("정보를 모두 입력해주세요.");
	}
}
</script>
<style>
*{
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
	font-weight:bold;
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
	margin-left:20%;
	margin-right:20%;
	background-color:white;
}
label#title{
	font-weight:bold;
	font-size:15pt;
}
input[type=text],select{
	width:350px;
	height:30px;
	border:1px solid #eeeeee;
}
textarea{
	border:1px solid #eeeeee;
}
input[type=number]{
	width:330px;
	height:30px;
	border:1px solid #eeeeee;
}
input[type=file]{
	width:350px;
	border:2px solid #eeeeee;
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
<div id="form1">

<div id="label">숙소 호스팅</div>
<p id="label">트래비룸 호스트 회원은 숙소를 등록할 수 있습니다.</p>

<div id="form2">
<form name="hostForm" action="hostAction.jsp" enctype="multipart/form-data" method="post" >
	<label id="title">숙소유형</label><br>
	<input type="radio" name="roomType" id="집전체" value="집전체" checked/><label for="집전체">집전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="roomType" id="개인실" value="개인실"/><label for="개인실">개인실</label>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="roomType" id="다인실" value="다인실"/><label for="다인실">다인실</label><br><br>
	
	<label id="title">숙소명</label><br>
	<input type="text" name="roomName"/><br><br>
	
	<label id="title">숙소설명</label><br>
	<textarea name="roomExplain" cols=45 rows=20></textarea><br><br>
	
	<label id="title">최대인원</label><br>
	<input type="number" name="roomMember"/>명<br><br>
	
	<label id="title">가격</label><br>
	<input type="number" name="roomPrice"/>원<br><br>
	
	<label id="title">도시</label><br>
	<select name="roomCity">
			<option value="서울" selected>서울</option>
			<option value="부산">부산</option>
			<option value="인천">인천</option>
			<option value="광주">광주</option>
			<option value="대전">대전</option>
			<option value="대구">대구</option>
			<option value="울산">울산</option>
	</select><br><br>
	
	<label id="title">연락처</label><br>
	<input type="text" name="roomNumber"><br><br>
	
	<label id="title">파일첨부</label><br>
	<input type="file" name="roomImage"/><br><br>
	
	<input type="button" onclick="send()" value="등록"/>
	<input type="reset"  value="취소"/>
</form>
</div>
</div>
