<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
}
div#form3{
	text-align:center;
	margin-left:20%;
	margin-right:20%;
}
table#search{
	font-family: 'Gothic A1', sans-serif;
	border:0px;
	background-color:white;
	width:100%;
}
table#search tr td{
	border:0px;
}
table#search tr:nth-child(1) td:nth-child(1){
	border:0px;
	border-bottom:1px solid #aaaaaa;
}
table#search select, input[type=number]{
	font-family: 'Gothic A1', sans-serif;
	width:200px;
	height:30px;
}
table#search input[type=submit]{
	margin-top:10px;
	margin-bottom:10px;
	font-family: 'Gothic A1', sans-serif;
	font-size:20pt;
	font-weight:bold;
	width:120px;
	height:100px;
	border:0px;
	background-color:#221acc;
	color:white;
}
table#search input[type=submit]:hover{
	background-color:#0404B4;
}
table#room{
	display:inline-block;
	margin-top:20px;
	margin-bottom:20px;
	width:100%;
	float:left;
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
	font-size:13pt;
	font-family: 'Gothic A1', sans-serif;
	color:#888888;
}
table#room a>b{
	font-size:15pt;
	font-family: 'Gothic A1', sans-serif;
	color:#555555;
}

</style>
<div id="form1">

<div id="label">트래비룸 숙소 검색</div>
<p id="label">트래비룸과 함께 즐겁고 행복한 여행되시길 바랍니다.</p>

<div id="form2">
<form name="searchForm" method="post" action="result.jsp">
<table id="search" border cellspacing=0>
	<tr>
		<td colspan=3 height=30px>
			<input type="checkbox" name="type" id="집전체" value="all" checked/><label for="집전체">집전체</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="type" id="개인실" value="solo" checked/><label for="개인실">개인실</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="type" id="다인실" value="both" checked/><label for="다인실">다인실</label>
		</td>
		<td rowspan=2><input type="submit" value="검색"/></td>
	</tr>
	<tr>
		<td>
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
		<td><input type="number" name="member" placeholder="인원"/>명</td>
		<td><input type="number" name="price"  placeholder="가격"/>원</td>
	</tr>
</table>
</form>
</div>
</div>

<div id="form3">
<%
request.setCharacterEncoding("utf-8");
String city=request.getParameter("city"); 
String type[]=request.getParameterValues("type");

int member;
int price;

if(request.getParameter("member")==""){
	member=1;
}else{
	member=Integer.parseInt(request.getParameter("member"));
}

if(request.getParameter("price")==""){
	price=999999999;
}else{
	price=Integer.parseInt(request.getParameter("price"));
}

for(int i=0; i<type.length; i++){
	if(type[i].equals("all")){
		type[i]="집전체";
	}
	else if(type[i].equals("solo")){
		type[i]="개인실";
	}
	else if(type[i].equals("both")){
		type[i]="다인실";
	}
}
String possible="";
try {
    String dbURL="jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID ="root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
	PreparedStatement pstmt=null;
	
	if(city.equals("전체")){
		if(type.length==1){
			pstmt=con.prepareStatement("select * from room where type in(?) AND member>=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(2,member);
			pstmt.setInt(3,price);
			pstmt.setString(4,"y");
		}
		else if(type.length==2){
			pstmt=con.prepareStatement("select * from room where type in(?,?) AND member>=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(3,member);
			pstmt.setInt(4,price);
			pstmt.setString(5,"y");
		}
		else if(type.length==3){
			pstmt=con.prepareStatement("select * from room where type in(?,?,?) AND member>=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(4,member);
			pstmt.setInt(5,price);
			pstmt.setString(6,"y");
		}
		
	}
	else{
		if(type.length==1){
			pstmt=con.prepareStatement("select * from room where type in(?) AND member>=? AND city=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(2,member);
			pstmt.setString(3,city);
			pstmt.setInt(4,price);
			pstmt.setString(5,"y");
		}
		else if(type.length==2){
			pstmt=con.prepareStatement("select * from room where type in(?,?) AND member>=? AND city=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(3,member);
			pstmt.setString(4,city);
			pstmt.setInt(5,price);
			pstmt.setString(6,"y");
		}
		else if(type.length==3){
			pstmt=con.prepareStatement("select * from room where type in(?,?,?) AND member>=? AND city=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(4,member);
			pstmt.setString(5,city);
			pstmt.setInt(6,price);
			pstmt.setString(7,"y");
		}
		
	}
	ResultSet rs = pstmt.executeQuery();
	
	 while(rs.next()){
	    	if(rs.getString("possible").equals("y")){
				possible="즉시 예약가능";
			}
			else{
				possible="예약 불가능";
			}
	    %>
	    	<table id="room" border cellspacing=0>
		   	<tr>
		   		<td rowspan=4><a href="roominfo.jsp?re=<%=rs.getString("id")%>"><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="100%" height="200px"></a></td>
		   		
		   	</tr>
		   	<tr>
				<td width=50%>
					<a href="roominfo.jsp?re=<%=rs.getString("id") %>">
					<span>
					<%=rs.getString("city") %>의 <%=rs.getString("type") %>
					</span>
					</a>
		   		</td>
		   		<td rowspan=4 width=20% style="border-left:1px solid #eeeeee;">
		   			<a href="roominfo.jsp?re=<%=rs.getString("id") %>"><b style="font-size:13pt;"><%=rs.getString("price") %>원/추가요금</b></a><br>
		   			<a href="roominfo.jsp?re=<%=rs.getString("id") %>"><span>평점 <%=rs.getString("grade") %>점</span></a><br>
		   		</td>
			
			</tr>
			<tr>
		   		<td><a href="roominfo.jsp?re=<%=rs.getString("id") %>"><b style="font-size:20pt;"><%=rs.getString("name") %></b></a></td>
		   	</tr>
		   	<tr>
				<td><a href="roominfo.jsp?re=<%=rs.getString("id") %>"><span><%=rs.getString("ex") %></span></a></td>
			</tr>
		</table>
	 <%}
		rs.close();
		pstmt.close();
	   	con.close();
   	
} catch (Exception e) {
	out.println("결과 조회가 없습니다.");
    System.out.println("DB 연동 실패 " + e.getMessage());
}
%>
</div>

