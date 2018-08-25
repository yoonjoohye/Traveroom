<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int id=Integer.parseInt(request.getParameter("id"));
try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement pstmt = null;
	pstmt=con.prepareStatement("delete from book where id=?");
	pstmt.setInt(1, id);
	pstmt.executeUpdate();
	pstmt.close();
	
	PreparedStatement pstmt1 = null;
	pstmt1=con.prepareStatement("update room set possible=? where id=?");
	pstmt1.setString(1, "y");
	pstmt1.setInt(2, id);
	pstmt1.executeUpdate();
	pstmt1.close();
	
	con.close();
	out.println("<script>");
	out.println("alert('예약을 취소하였습니다.');");
	out.println("location.href='myroom.jsp';");
	out.println("</script>");
}
catch(Exception e){
	out.println("<script>");
	out.println("alert('예약이 취소되지 않았습니다.');");
	out.println("location.href='myroom.jsp';");
	out.println("</script>");      
}
%>