<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");
}
%>
<script>
var d = new Date();
d = new Date(d.getTime() - 3000000);
var today="";
var check=true;
<%
String d="";
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
    d=rs.getString("date").substring(0,10).trim();
    %>
    
    today = d.getFullYear().toString()+"-"+((d.getMonth()+1).toString().length==2?(d.getMonth()+1).toString():"0"+(d.getMonth()+1).toString())+"-"+(d.getDate().toString().length==2?d.getDate().toString():"0"+d.getDate().toString());

	if(today=<%=d%>){
		check=false;
	}
 	<%}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
 }
%>
if(check==true){
	var timer = [];
	var stopNum;
	var stopCount;
	var startBtn = document.getElementById('startBtn');
	var stop = {
		Btn0 : document.getElementById('stop0'),
		Btn1 : document.getElementById('stop1'),
		Btn2 : document.getElementById('stop2'),
		Btn3 : document.getElementById('stop3')
	};
	var i=0;
	function startSlot(){
		stopNum = [];
		stopCount = 0;
		runSlot(0);
		runSlot(1);
		runSlot(2);
		runSlot(3);
		i++;
		if(i>1){
			slotForm.submit();
		}
		
	}
	
	function runSlot(n){
		document.getElementById('num'+n).innerHTML = Math.floor( Math.random() * 9+1 );
		timer[n] = setTimeout(function(){
			runSlot(n);
		}, 50);
	}
	
	function stopSlot(n){
		if( typeof stopNum[n] !== 'undefined' ){
			return;
		}
		clearTimeout(timer[n]);
		stopNum[n] = document.getElementById('num'+n).innerHTML;
		stopCount++;
	
		if( stopCount === 4 ){
			document.getElementById("startBtn").value=stopNum[0]+""+stopNum[1]+""+stopNum[2]+""+stopNum[3]+"P";
			document.getElementById("stop0").disabled=true;
			var point=parseInt(stopNum[0]+""+stopNum[1]+""+stopNum[2]+""+stopNum[3]);
			slotForm.point.value=point;
		}
	}
}
else{
	alert("이벤트는 하루에 한번만 참여가능합니다.");
	location.href="index.jsp";
}
</script>
<style>
div#form1{
	text-align:center;
	padding-top:20px;
	padding-bottom:50px;
	background-color:#eeeeee;
	color:gray;
}
div#label{
	text-align:center;
	font-size:20pt;
	font-weight:bold;
	color:#666666;
}
p#label{
	text-align:center;
	font-size:10pt;
	color:#666666;
	margin-bottom:20px;
}
#slot{
	margin-left:20%;
	margin-right:20%;
	width: 60%;
}
.col{
	width: 200px;
	height:150px;
	font-size: 40pt;
	color:#666666;
	text-align: center;
	display:inline-block;
	border:1px solid #bbbbbb;
	box-shadow: 0px 5px 10px #bbbbbb;
	background-color:white;
	margin:10px;
}
input[type="button"]{
	padding:10px;
	margin-bottom:10px;
	width:80%;
	border:3px solid #221acc;
	background-color:white;
	color:#221acc;
	font-size:15pt;
}
input[type="button"]:hover{
	background-color:#221acc;
	color:white;
}
#result{
	width: 100%;
	height: 50px;
}
#startBtn {
	margin-left:50px;
	padding:0px;
	width: 130px;
	height: 130px;
	font-size: 15pt;
	font-weight: light;
	color: white;
	border: none;
	border-radius: 50%;
	background: #221acc;
	-webkit-animation-name: spin;
	-webkit-animation-duration: 1.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
}
#startBtn:hover {
  -webkit-animation: none;
}

@-webkit-keyframes spin {
    0% {
        -webkit-transform: scale(1);
    }
    50% {
        -webkit-transform: scale(1.1);
        -webkit-box-shadow: 0 0 0 50px rgba(#5a99d4, 0);
    }
    100% {
        -webkit-transform: scale(1);
        -webkit-box-shadow: 0 0 0 0 rgba(#5a99d4, 0);
    }
}
}
</style>
<center>
<div id="form1">
<div id="label">헌혈 이벤트-포인트 슬롯</div>
<p id="label">
먼저 START 버튼을 누른 후 차례대로 STOP 버튼을 눌러주세요!
</p>
<div id="slot">
	<br><br>
	<div class="col">
		<div id="num0">?</div>
		<input type="button" id="stop0" onclick="stopSlot(0)" value="STOP">
	</div>
	<div class="col">
		<div id="num1">?</div>
		<input type="button" id="stop0" onclick="stopSlot(1)" value="STOP">
	</div>
	<div class="col">
		<div id="num2">?</div>
		<input type="button" id="stop0" onclick="stopSlot(2)" value="STOP">
	</div>
	<div class="col">
		<div id="num3">?</div>
		<input type="button" id="stop0" onclick="stopSlot(3)" value="STOP">
	</div>
	<form method="post" name="slotForm" action="slotAction.jsp" style="display:inline;">
	<input type="hidden" name="point">
	<input type="button" id="startBtn" onclick="startSlot()" value="START">
	</form>
	<p id="result"></p>
</div>
</div>
</center>