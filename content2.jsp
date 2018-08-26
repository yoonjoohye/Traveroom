
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
div#label{
	margin-left:20%;
	margin-right:20%;
	margin-bottom:20px;
	font-size:20pt;
	font-weight:bold;
	font-family: 'Nanum Gothic Coding', monospace;
	color:#555555;
}
div#form1{
	margin-left:20%;
	margin-right:20%;
	text-align:center;
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
}
div#city{
	display:inline-block;
	text-align:center;
	line-height:290px;
	font-weight:bold;
	color:white;
	font-family: 'Gothic A1', sans-serif;
	font-size:20pt;
    width:19.2%;
    height:300px; 
    background-size: cover;
}

div.a{
	background-image: url(img/seoul.png);
}
div.b{
	background-image: url(img/a.jpg);
}
div.c{
	background-image: url(img/choong.jpg);
}
div.d{
	background-image: url(img/jeon.jpg);
}
div.e{
	background-image: url(img/jinju.png);
}
div#city:hover{
	-webkit-filter: grayscale(100%);
	filter: gray;
}

</style>
<div id="label">가볼만한 여행장소</div>
<div id="form1">
<a href="parsing.jsp?re=수도권">
	<div id="city" class="a">수도권 추천지</div>
</a>
<a href="parsing.jsp?re=강원권">
	<div id="city" class="b">강원권 추천지</div>
</a>
<a href="parsing.jsp?re=충청권">
	<div id="city" class="c">충청권 추천지</div>
</a>
<a href="parsing.jsp?re=전라권">
	<div id="city" class="d">전라권 추천지</div>
</a>
<a href="parsing.jsp?re=경상권">
	<div id="city" class="e">경상권 추천지</div>
</a>
</div>
