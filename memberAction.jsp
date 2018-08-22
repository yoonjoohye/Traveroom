<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String check[]=request.getParameterValues("check");
try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("delete from member where user_id=?");
	for(int i=0; i<check.length; i++){
	pstmt.setString(1,check[i]);
	pstmt.executeUpdate();
	}
	pstmt.close();
	
	PreparedStatement pstmt1=null;
	pstmt1 = con.prepareStatement("delete from room where user_id=?");
	for(int i=0; i<check.length; i++){
	pstmt1.setString(1,check[i]);
	pstmt1.executeUpdate();
	}
	pstmt1.close();
	
	PreparedStatement pstmt2=null;
	pstmt2 = con.prepareStatement("delete from book where user_id=?");
	for(int i=0; i<check.length; i++){
	pstmt2.setString(1,check[i]);
	pstmt2.executeUpdate();
	}
	pstmt2.close();
	
	PreparedStatement pstmt3=null;
	pstmt3 = con.prepareStatement("delete from reply where user_id=?");
	for(int i=0; i<check.length; i++){
	pstmt3.setString(1,check[i]);
	pstmt3.executeUpdate();
	}
	pstmt3.close();
	
	con.close();
	response.sendRedirect("member.jsp");      
}
catch(Exception e){
	
}
%>