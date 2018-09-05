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
int point=Integer.parseInt(request.getParameter("point"));
try {
    String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt=null; 
   	pstmt = con.prepareStatement("insert into point values(NULL,?,?,now())");
   	pstmt.setString(1,id);
   	pstmt.setInt(2,point);
   	pstmt.executeUpdate();
   	pstmt.close();
   	con.close();
	
   	out.println("<script>");
   	out.println("alert('이벤트에 참여해주셔서 감사합니다.')");
   	out.println("alert('포인트는 마이페이지에서 확인해주세요!')");
   	out.println("location.href='index.jsp';");
   	out.println("</script>");
   	
} catch (Exception e) {       
	response.sendRedirect("slot.jsp");
    System.out.println("DB 연동 실패 " + e.getMessage());
} 
%>