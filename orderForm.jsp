<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function order(){
		var checkin=orderForm.checkin.value;
		var checkout=orderForm.checkout.value;
		var member=orderForm.member.value;
		var price=orderForm.price.value;
		var name=orderForm.accountname.value;
		var num=orderForm.num.value;
		
		if(checkin!=""&&checkout!=""&&member!=""&&price!=""&&name!=""&&num!=""){
			orderForm.submit();
		}
		else{
			alert("정보를 확인해주세요");
			return;
		}
	}
	function datechange(){
		var checkin=orderForm.checkin.value;
		orderForm.checkout.min=checkin;
	}
</script>

<style>
div#form{
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
div#form1{
	padding-top:20px;
	text-align:center;
	margin-left:20%;
	margin-right:20%;
	background-color:white;
	border:1px solid #eeeeee;
	box-shadow: 0px 5px 10px #aaaaaa;
}
table#roominfo{
	border:0px;
	width:50%;
	height:400px;
	font-family: 'Gothic A1', sans-serif;
}
table#roominfo tr td{
	border:0px;
}
table#roominfo tr:nth-child(1) td{
	border:0px;
	border-bottom:1px solid #cccccc;
	color:#666666;	
}
table#roominfo tr:nth-child(2) td{
	font-weight:bold;
	font-size:20pt;	
	color:#666666;
}

table#bookinfo{
	border:0px;
	width:50%;
	text-align:center;
	font-family: 'Gothic A1', sans-serif;
}
table#bookinfo tr td{
	border:0px;
}
table#bookinfo input,select{
	border:1px solid #cccccc;
	margin-top:10px;
	margin-bottom:10px;
	width:205px;
	height:30px;
}
table#bookinfo input[type="date"]::after { 
	content: attr(data-placeholder);
	font-family: 'Gothic A1', sans-serif;
	color:gray;
	font-size:7pt;
	width: 20%;
}
table#bookinfo input[type="date"]:focus::before,input[type="date"]:valid::before {
 	display: none 
}
table#bookinfo input[type=number]{
	width:400px;
}
table#bookinfo input#num{
	width:415px;
}
input[type=button],input[type=reset]{
	margin-left:20px;
	margin-right:20px;
	width:150px;
	height:50px;
	background-color:#eeeeee;
	border:0px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size:12pt;
	font-weight:bold;
	color:#555555;
	margin-top:20px;
	margin-bottom:20px;
}
input[type=button]:hover,input[type=reset]:hover{
	background-color:#dddddd;
}
</style>

<%
request.setCharacterEncoding("utf-8");

String code=request.getParameter("re");

String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");
}%>
<div id="form">
<div id="label">숙소 예약</div>
<p id="label">트래비룸 숙소로 좋은 여행 보내시길 바랍니다.</p>
<div id="form1">
<center>
<table id="roominfo" border=1 cellspacing=0>
<tr><td>NO.<%=code %></td>
<%
int member=0;
int price=0;
int point=0;
try {
    String dbURL="jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID ="root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from room where id=?");
	pstmt.setString(1,code);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){%>
	   		<td align="right"><%=rs.getString("city")%>의 <%=rs.getString("type") %></td>
	   	</tr>
	   	<tr>
		   	<td colspan=2><%=rs.getString("name") %></td>
	   	</tr>
	   	<tr>
	   		<td colspan=2><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="100%" height="300px"></td>
	   	</tr>
	<% 
	member=rs.getInt("member");
	price=rs.getInt("price");
	}
		rs.close();
		pstmt.close();
		
		PreparedStatement pstmt1=null;
		pstmt1=con.prepareStatement("select * from point where user_id=?");
		pstmt1.setString(1,id);
		ResultSet rs1 = pstmt1.executeQuery();
		
		while(rs1.next()){
			point+=rs1.getInt("point");
		}
		rs1.close();
		pstmt1.close();
		
	   	con.close();
} catch (Exception e) {
}

SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Calendar c1 = Calendar.getInstance();
String date1 = format.format(c1.getTime());

%> 
 </table>
</center>
<center>
<form name="orderForm" method="post" action="orderAction.jsp">
<input type="hidden" value="<%=code %>" name="id">
<table id="bookinfo" border cellspacing=0>
	<tr>
		<td>
		<input type="date" name="checkin" min="<%=date1%>" onchange="datechange()" data-placeholder="체크인"/>
		<input type="date" name="checkout" data-placeholder="체크아웃"/>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="number" name="member" id="member" onchange="ok()" value=<%=member%>>명
			
		</td>
	</tr>
	<tr>
		<td>
		전체 포인트 <%=point %>P<br>
		잔액 포인트 <input type="text" name="nmg" id="nmg" value=<%=point %>>P
		<br> 
		<input type="number" name="point" id="point" onchange="discount()" value=0>P</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="number" name="price" id="price" value=<%=price %>>원
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="accountname" placeholder="예금주">
		
			<select name="bank">
				<option value="농협은행">농협은행</option>
				<option value="국민은행">국민은행</option>
				<option value="기업은행">기업은행</option>
				<option value="신한은행">신한은행</option>
				<option value="우리은행">우리은행</option>
				<option value="제일은행">제일은행</option>
				<option value="하나은행">하나은행</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="text" id="num" name="num" placeholder="연락처"/>
		</td>
	</tr>
</table>
<input type="button" value="예약" onclick="order()">
<input type="reset" value="취소">
</form>
</center>
</div>
</div>
<script>
function ok(){
	var member=document.getElementById("member").value;
	var price=document.getElementById("price").value;
	var add=0;
	if(member><%=member%>){
		a=member-<%=member%>;
		add=a*10000;
	}
	else{
		add=0;
	}
	total=Number(add)+<%=price%>;
	document.getElementById("price").value=total;
}
function discount(){
	var member=document.getElementById("member").value;
	var price=Number(document.getElementById("price").value);
	var nmg=Number(document.getElementById("nmg").value);
	var point=Number(document.getElementById("point").value);
	
	var add=0;
	if(member><%=member%>){
		a=member-<%=member%>;
		add=a*10000;
	}
	else{
		add=0;
	}
	total=Number(add)+<%=price%>;
	document.getElementById("price").value=total;
	
	if(nmg>point && price>point){
		document.getElementById("nmg").value=<%=point%>-point;
		document.getElementById("price").value=total-point;
	}
	else{
		document.getElementById("point").value=0;
		document.getElementById("nmg").value=<%=point%>;
		document.getElementById("price").value=total;
		return;
	}
}
</script>
