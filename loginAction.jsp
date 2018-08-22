<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

try{
	String DB_URL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;   	
	pstmt=con.prepareStatement("select * from member");
	
	ResultSet rs = pstmt.executeQuery();
	Boolean check=false;
	while(rs.next())
    {
	     if (id.equals(rs.getString("user_id")) && pw.equals(rs.getString("user_pw")))
	     {
		    check=true;
		    session.setAttribute("userId",rs.getString("user_id"));
		    session.setAttribute("userPw",rs.getString("user_pw"));
		    session.setAttribute("userName",rs.getString("user_name"));
	    	session.setAttribute("userBirth",rs.getString("user_birth"));
	    	session.setAttribute("userType",rs.getString("user_type"));
	    	break;
	     }
	     else
	     {
	    	 check=false;
	     }
    }
	if(check==true){
	    String name=(String)session.getAttribute("userName");
	    String type=(String)session.getAttribute("userType");
	    
	    if(type.equals("관리자")){
			out.println("<script>");
			out.println("alert('관리자님 환영합니다.');");
			out.println("location.href='index.jsp';");
			out.println("</script>");
		}
	    else if(type.equals("호스트")){
	    	out.println("<script>");
			out.println("alert('"+name+" 호스트님 환영합니다.');");
		    out.println("location.href='index.jsp';");
			out.println("</script>");
	    }
	    else if(type.equals("게스트")){
	    	out.println("<script>");
			out.println("alert('"+name+" 게스트님 환영합니다.');");
		    out.println("location.href='index.jsp'");
			out.println("</script>");
	    }
    }
	else{
    	out.println("<script>");
		out.println("alert('아이디나 비밀번호를 틀렸습니다.');");
    	out.println("history.back();");
		out.println("</script>");
    }
    rs.close();
    pstmt.close();
    con.close();  
    }
	catch(Exception e){
		System.out.println("DB 연동 실패 " + e.getMessage());
	}
%>
