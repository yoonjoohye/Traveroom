<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");

String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}

String path=request.getRealPath("/traveroom_img");

MultipartRequest multi=new MultipartRequest(request, path, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy());

String type=multi.getParameter("roomType");
int member=Integer.parseInt(multi.getParameter("roomMember"));
String city=multi.getParameter("roomCity");
int price=Integer.parseInt(multi.getParameter("roomPrice"));
String name=multi.getParameter("roomName");
String explain=multi.getParameter("roomExplain");
explain=explain.replace("\r\n","<br>");
String num=multi.getParameter("roomNumber");
String fileName =multi.getFilesystemName("roomImage");
String img=path+"\\"+fileName;

try {
    String dbURL = "jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt=null; 
   	pstmt = con.prepareStatement("insert into room values(NULL,?,?,?,?,?,?,?,?,?,?,0.0)");
	
   	pstmt.setString(1,id);
   	pstmt.setString(2,type);
   	pstmt.setInt(3,member);
   	pstmt.setString(4,city);
   	pstmt.setInt(5,price);
   	pstmt.setString(6,name);
   	pstmt.setString(7,explain);
   	pstmt.setString(8,num);
	pstmt.setString(9,fileName);
	pstmt.setString(10,"y");
	
	pstmt.executeUpdate();
   	pstmt.close();
   	con.close();
   	
   	out.println("<script>");
	out.println("alert('등록 완료!');");
	out.println("location.href='room.jsp';");
	out.println("</script>"); 
   	
} catch (Exception e) {       
	out.println("<script>");
	out.println("alert('등록 실패!');");
	out.println("location.href='host.jsp';");
	out.println("</script>"); 
    System.out.println("DB 연동 실패 " + e.getMessage());
} 
%>