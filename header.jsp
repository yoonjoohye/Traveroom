<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet"><style>
	div#logo{
		margin-top:3px;
		margin-left:15%;
		display:inline-block;
		float:left;
	}
	div#list{
		line-height:120px;
		margin-right:15%;
		display:inline-block;
		float:right;
		font-family: 'Gothic A1', sans-serif;
		text-align:right;
		font-size:13pt;
	}
	div#list span{
		font-weight:bold;
		color:#555555;
	}
	div#list a {
		z-index:9999999;
		margin-right:20px;
		text-decoration:none;
		font-weight:bold;
		color: #221acc; 
		text-transform: uppercase;
		position: relative;
	}
	div#list a::after {
		content: "";
		position: absolute;
		left: 0;
		width: 100%;
		top: 150%;
		height: 3px;
		transition: all 0.5s;
		transform: scale(0,1);
		background-color: #221acc; 
	}
	div#list a:hover {
		color: #221acc;
	}
	div#list a:hover::after {
		transform: scale(1);
	}
	
</style>
<div id="logo">
<a href="index.jsp"><img src="img/logo.png"/></a>
</div>

<%
request.setCharacterEncoding("UTF-8");

String id=null;
String name=null;
String type=null;

Boolean check=false;
if(session.getAttribute("userId")!=null){
	check=true;
}
else{
	check=false;
}

if(check==true){
	id=(String)session.getAttribute("userId");
	name=(String)session.getAttribute("userName");
	type=(String)session.getAttribute("userType");
	
	if(type.equals("관리자")){ %>
		<div id="list">
		<span> 관리자님 </span>
		<a href="logout.jsp">로그아웃</a>
		<a href="member.jsp">회원관리</a>
		<a href="notice.jsp">공지사항</a>
		</div>
	<%}else if(type.equals("호스트")){ %>
		<div id="list">  
		<span><%=name%> 호스트님</span>
		<a href="logout.jsp">로그아웃</a>
		<a href="mypage.jsp">마이페이지</a>
		<a href="room.jsp">숙소호스팅</a>
		<a href="notice.jsp">공지사항</a>
		</div>
	<%} else if(type.equals("게스트")){ %>
		<div id="list">
		<span> <%=name%> 게스트님 </span>
		<a href="logout.jsp">로그아웃</a>
		<a href="mypage.jsp">마이페이지</a>
		<a href="myroom.jsp">예약한 숙소</a>
		<a href="notice.jsp">공지사항</a>
		</div>
	<%}
	
}else{%>
	<div id="list">
	<a href="login.jsp">로그인</a>
	<a href="join.jsp">회원가입</a>
	<a href="notice.jsp">공지사항</a>
	</div>
<%}%>
