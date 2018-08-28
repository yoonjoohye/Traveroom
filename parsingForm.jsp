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
	border-top:1px solid #eeeeee;
	height:auto;
	font-family: 'Gothic A1', sans-serif;
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
	font-family: 'Gothic A1', sans-serif;
	color:#666666;
	margin-bottom:20px;
}
div#form2{
	margin-left:20%;
	margin-right:20%;
	padding-bottom:20px;
}
table#travel{
	float:left;
	padding-top:10px;
	border:1px solid #eeeeee;
	width:24%;
	margin:5px;
	height:300px;
	font-family: 'Gothic A1', sans-serif;
	box-shadow: 0px 5px 10px #eeeeee;
}
table#travel tr td{
	border:0px;
	padding-left:5%;
	padding-right:5%;
	color:#666666;
}
table#travel tr:nth-child(1), table#travel tr:nth-child(2), table#travel tr:nth-child(3){
	border-bottom:1px solid #eeeeee;
}
</style>

<%
request.setCharacterEncoding("utf-8");
String city=request.getParameter("re");
%>
<center>
<div id="form1">
<div id="label"><%=city%> 여행지</div>
<p id="label">한국인이 꼭 가봐야할 <%=city%>여행지 추천 리스트</p>
<div id="form2">
<%
String url = "http://korean.visitkorea.or.kr/kor/bz15/mustgo100/mustgo100_list.jsp";

try{
    Document doc = Jsoup.connect(url).get();

    for (int i=1; i<=500; i++){
    	String region = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+")").attr("data-area");
    	if(region.equals(city)){
	    	String link=doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a").attr("href");
    		String title = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a > div.cnt > h3 > b").text();
        	String content = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a > div.cnt > ul > li:nth-child(1)").text();
        	String img_url = doc.select("#content > div.doc > div > div.whereWrap.mustgo100 > ul > li:nth-child("+i+") > a > div.pic > img").attr("src");
    	
%>
        <a href="<%=link%>">
        <table id="travel" border cellspacing=0>
        	<tr>
        		<td align="center"><img src='<%=img_url%>' width=100% height=150px></td>
        	</tr>
        	<tr>
        		<td align="left"><b style="font-size:15pt;"><%=title %></b></td>
        	</tr>
        	<tr>
        		<td align="left"><%=content%></td>
        	</tr>
		</table>
		</a>
<%
    	}
    }

}
catch (IOException e){
    System.out.println(e);
}
%>
</div>
</div>
</center>
