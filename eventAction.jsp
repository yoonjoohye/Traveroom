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

	request.setCharacterEncoding("utf-8");

	String num1=request.getParameter("number1");
	String num2=request.getParameter("number2");
	String num3=request.getParameter("number3");
	String num=num1+num2+num3;
	
	String name=request.getParameter("name");
	String date=request.getParameter("date");
	String type=request.getParameter("type");
	String gender=request.getParameter("gender");
	
	out.println(num);
	out.println(name);
	out.println(date);
	out.println(type);
	out.println(gender);
	
	//insert
	//id, user_id, num, date, type, gender
	try {
    String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt=null; 
   	pstmt = con.prepareStatement("insert into event values(NULL,?,?,?,?,?,?)");
   	pstmt.setString(1,id);
   	pstmt.setString(2,num);
   	pstmt.setString(3,name);
   	pstmt.setString(4,date);
   	pstmt.setString(5,type);
   	pstmt.setString(6,gender);
   	
   	pstmt.executeUpdate();
   	pstmt.close();
   	con.close();
	
   	response.sendRedirect("slot.jsp");
} catch (Exception e) {       
	response.sendRedirect("event.jsp");  
    System.out.println("DB 연동 실패 " + e.getMessage());
} 
%>
