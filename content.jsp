<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet"> 
<style>
div#images{
	position: relative;
	z-index:1;
}
table#search{
	position: relative;
	z-index:2;
	top:-500px;
	margin-left:35%;
	margin-right:35%;
	width:30%;
	background-color:white;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight:bold;
	color:#999999;
	border:0px;
}
table#search tr:nth-child(1){
	background-color:#221acc;
	color:white;
	font-size:15pt;
	height:50px;
}
table#search select,input[type=number]{
	width:300px;
	height:30px;
	border:1px solid #dddddd;
	border-radius:10px;
	color:#999999;	
}
table#search input[type=submit]{
	width:95%;
	height:50px;
	margin-bottom:20px;
	font-weight:bold;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size:15pt;
	color:white;
}
.button-one {
 	cursor: pointer;
 	outline: none;
 	background-color:#cccccc;
  	border: none;
  	border-radius:5px;
  	box-shadow: 0 9px #aaaaaa;
}
.button-one:hover{
  	background-color: #dddddd;
  	box-shadow: 0 9px #aaaaaa;
}

.button-one:active {
  	background-color: #dddddd;
  	box-shadow: 0 5px #aaaaaa;
  	transform: translateY(4px);
}

.mySlides {
	display:none;
	width:100%;
	height:600px;
	background-color:black;
	opacity: 0.65;
}
div#part{
	position:relative;
	top:-350px;
}
div#part1{
	clear:both;
	position:relative;
	top:-300px;
}
</style>

<div id="images">
  <img class="mySlides" src="img/banner1.jpg">
  <img class="mySlides" src="img/banner2.jpg">
  <img class="mySlides" src="img/banner3.jpg">
  <img class="mySlides" src="img/banner4.jpg">
</div>

<form name="searchForm" method="post" action="result.jsp">
<table id="search" cellspacing=0>
	<tr>
		<td align=center>트래비룸 숙소 검색</td>
	</tr>
	<tr>
		<td style="padding-left:70px;">
			<br>여행도시<br>
			<select name="city">
				<option value="전체" selected>전체</option>
				<option value="서울">서울</option>
				<option value="부산">부산</option>
				<option value="인천">인천</option>
				<option value="광주">광주</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="울산">울산</option>
			</select>
		</td>
	</tr>
	<tr>	
		<td style="padding-left:70px;">
			<br>인원<br>
			<input type="number" name="member" placeholder="인원을 입력해 주세요"/>명 
		</td>
	</tr>
	<tr>
		<td style="padding-left:70px;">
			<br>가격<br>
			<input type="number" name="price"  placeholder="가격을 입력해 주세요"/>원
		</td>
	</tr>
	<tr>
		<td style="padding-left:70px;">
			<br>숙소종류<br>
			<input type="checkbox" name="type" id="집전체" value="all" checked/><label for="집전체">집전체</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="type" id="개인실" value="solo" checked/><label for="개인실">개인실</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="type" id="다인실" value="both" checked/><label for="다인실">다인실</label>
		</td>
	</tr>
	<tr>
		<td align="center"><br><input type="submit" class="button-one" value="검색"/></td>
	</tr>
</table>
</form>

<div id="part">
	<jsp:include page="content1.jsp"/>
</div>

<div id="part1">
	<jsp:include page="content2.jsp"/>
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); // Change image every 2 seconds
}
</script>

