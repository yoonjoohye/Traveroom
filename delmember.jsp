<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("delete from member where user_id=?");
	pstmt.setString(1,id);
	pstmt.executeUpdate();
	pstmt.close();
	
	PreparedStatement pstmt1=null;
	pstmt1 = con.prepareStatement("delete from room where user_id=?");
	pstmt1.setString(1,id);
	pstmt1.executeUpdate();
	pstmt1.close();
	
	PreparedStatement pstmt2=null;
	pstmt2 = con.prepareStatement("delete from reply where user_id=?");
	pstmt2.setString(1,id);
	pstmt2.executeUpdate();
	pstmt2.close();
	
	PreparedStatement pstmt3=null;
	pstmt3 = con.prepareStatement("delete from book where user_id=?");
	pstmt3.setString(1,id);
	pstmt3.executeUpdate();
	pstmt3.close();
	
	con.close();
	session.invalidate();
	response.sendRedirect("index.jsp");      
}
catch(Exception e){
	System.out.println(e);
}
%>