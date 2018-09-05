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
	int id=Integer.parseInt(request.getParameter("id"));
	String checkin=request.getParameter("checkin");
	String checkout=request.getParameter("checkout");
	int member=Integer.parseInt(request.getParameter("member"));
	int price=Integer.parseInt(request.getParameter("price"));
	String name=request.getParameter("accountname");
	String bank=request.getParameter("bank");
	String num=request.getParameter("num");
	int point=Integer.parseInt(request.getParameter("point"))*-1;

	out.println(id);
	out.println(userId);
	out.println(checkin);
	out.println(checkout);
	out.println(member);
	out.println(price);
	out.println(name);
	out.println(bank);
	out.println(num);
			
	try {
	    // 드라이버 로딩
	    String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	    String dbID = "root";
	    String dbPW="1234";
	   	
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
	   	
	   	PreparedStatement pstmt=null; 
	   	pstmt = con.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?)");
	   	pstmt.setInt(1,id);
	   	pstmt.setString(2,userId);
	   	pstmt.setString(3,checkin);
	   	pstmt.setString(4,checkout);
	   	pstmt.setInt(5,member);
	   	pstmt.setInt(6,price);
	   	pstmt.setString(7,name);
	   	pstmt.setString(8,bank);
	   	pstmt.setString(9,num);
	   	pstmt.executeUpdate();
	   	pstmt.close();
	   	
	   	PreparedStatement pstmt1=null; 
	   	pstmt1 = con.prepareStatement("update room set possible=? where id=?");
	   	pstmt1.setString(1,"n");
	   	pstmt1.setInt(2, id);
	   	pstmt1.executeUpdate();
	   	pstmt1.close();
	   	
	   	PreparedStatement pstmt2=null; 
	   	pstmt2 = con.prepareStatement("insert into point values(NULL,?,?,now())");
	   	pstmt2.setString(1,userId);
	   	pstmt2.setInt(2,point);
	   	pstmt2.executeUpdate();
	   	pstmt2.close();
	   	
	   	con.close();
	   	
	   	response.sendRedirect("index.jsp");   
	   	System.out.println("연동 성공!");
	} catch (Exception e) {       
		response.sendRedirect("order.jsp?re="+id);  
	    System.out.println("DB 연동 실패 " + e.getMessage());
	} 
%>