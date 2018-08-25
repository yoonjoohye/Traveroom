<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String userId=null;
if(session.getAttribute("userId")!=null){
	userId=(String)session.getAttribute("userId");
}
if(userId==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");
}

String reply=request.getParameter("reply");
reply=reply.replace("\r\n","<br>");
int score=Integer.parseInt(request.getParameter("star-input"));
int id=Integer.parseInt(request.getParameter("id"));

try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement pstmt =null;
	pstmt=con.prepareStatement("insert into reply values(NULL,?,?,?,?,now())");
	pstmt.setInt(1, id);
	pstmt.setString(2, userId);
	pstmt.setInt(3, score);
	pstmt.setString(4, reply);
	
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	out.println("<script>");
	out.println("alert('후기 등록!');");
	out.println("location.href='roominfo.jsp?re="+id+"';");
	out.println("</script>");    
}
catch(Exception e){
	out.println("<script>");
	out.println("alert('후기 등록 실패!');");
	out.println("location.href='roominfo.jsp?re="+id+"';");
	out.println("</script>");   
}
%>