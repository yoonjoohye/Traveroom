<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String pw=request.getParameter("edit_pw");
String name=request.getParameter("edit_name");
String birth=request.getParameter("edit_birth");

String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}

try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	String query = "update member set user_pw=?, user_name=?,user_birth=? where user_id=?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, pw);
	pstmt.setString(2, name);
	pstmt.setString(3, birth);
	pstmt.setString(4, id);
	
	pstmt.executeUpdate();
	
    session.setAttribute("userPw",pw);
    session.setAttribute("userName",name);
	session.setAttribute("userBirth",birth);
	
	pstmt.close();
	conn.close();
%>
	<script>
	alert("수정완료");
	location.href="mypage.jsp";
	</script>
<%    
}
catch(Exception e){
	response.sendRedirect("mypage.jsp");      
	System.out.println(e);
}
%>