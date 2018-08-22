<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	String id=email1+'@'+email2;
	String pw=request.getParameter("user_pw");
	String name=request.getParameter("user_name");
	String birth=request.getParameter("user_birth");
	String type=request.getParameter("type");

	try{
		String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	    String dbID = "root";
	    String dbPW ="1234";
	    
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
	    
	    PreparedStatement pstmt=null;
	    pstmt=con.prepareStatement("insert into member values(?,?,?,?,?,now())");
	    pstmt.setString(1,id);
	    pstmt.setString(2,pw);
	    pstmt.setString(3,name);
	    pstmt.setString(4,birth);
	    pstmt.setString(5,type);
	    
	    pstmt.executeUpdate();
	   	pstmt.close();
	    con.close();
%>
	    <script>
	    	location.href="login.jsp";
	    	alert("트래비룸 회원이 되신 것을 축하드립니다.");
	    </script>
<% 
	}
	catch(Exception e){
		System.out.println("DB 연동 실패 " + e.getMessage());
%>
		<script>
			history.back();
			alert("이미 존재하는 이메일입니다.");
		</script>
<% 
	}
%>

