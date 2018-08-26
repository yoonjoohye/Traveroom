<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	font-family: 'Gothic A1', sans-serif;
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
table{
	padding-top:10px;
	padding-bottom:10px;
	border:1px solid #eeeeee;
	width:44%;
	font-family: 'Gothic A1', sans-serif;
	box-shadow: 0px 5px 10px #eeeeee;
}
table tr td{
	border:0px;
	padding-left:5%;
	padding-right:5%;
}
table tr:nth-child(1), table tr:nth-child(2), table tr:nth-child(3){
	border-bottom:1px solid #eeeeee;
}
</style>

<%
request.setCharacterEncoding("utf-8");
String city=request.getParameter("re");
%>
<div id="form1">
<div id="label"><%=city%> 여행지</div>
<p id="label">한국인이 꼭 가봐야할 <%=city%>여행지 추천 리스트</p>
<div id="form2">
<center>
<br>
<%
String url = "http://korean.visitkorea.or.kr/kor/bz15/mustgo100/mustgo100_list.jsp";

try{
    Document doc = Jsoup.connect(url).get();

    for (int i=1; i<=100; i++){
    	String region = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+")").attr("data-area");
    	
    	if(region.equals(city)){
    		String title = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a > div.cnt > h3 > b").text();
        	String content = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a > div.cnt > ul > li:nth-child(1)").text();
        	String img_url = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a > div.pic > img").attr("src");
    	
%>
        <table border cellspacing=0>
        	<tr>
        		<td><img src='<%=img_url%>' width=450px height=250px></td>
        	</tr>
        	<tr>
        		<td><b style="font-size:15pt;"><%=title %></b></td>
        	</tr>
        	<tr>
        		<td><%=content%></td>
        	</tr>
		</table>
		<br>
<%
    	}
    }

}
catch (IOException e){
    System.out.println(e);
}
%>
</center>
</div>
</div>
