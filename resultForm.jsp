<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
request.setCharacterEncoding("utf-8");

String city=request.getParameter("city"); 
String type[]=request.getParameterValues("type");

int member;
int price;

if(request.getParameter("member")==""){
	member=1;
}else{
	member=Integer.parseInt(request.getParameter("member"));
}

if(request.getParameter("price")==""){
	price=999999999;
}else{
	price=Integer.parseInt(request.getParameter("price"));
}

for(int i=0; i<type.length; i++){
	if(type[i].equals("all")){
		type[i]="집전체";
	}
	else if(type[i].equals("solo")){
		type[i]="개인실";
	}
	else if(type[i].equals("both")){
		type[i]="다인실";
	}
}
try {
    String dbURL="jdbc:mysql://localhost:3306/room?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID ="root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
	PreparedStatement pstmt=null;
	
	if(city.equals("전체")){
		if(type.length==1){
			pstmt=con.prepareStatement("select * from room where type in(?) AND member>=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(2,member);
			pstmt.setInt(3,price);
			pstmt.setString(4,"y");
		}
		else if(type.length==2){
			pstmt=con.prepareStatement("select * from room where type in(?,?) AND member>=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(3,member);
			pstmt.setInt(4,price);
			pstmt.setString(5,"y");
		}
		else if(type.length==3){
			pstmt=con.prepareStatement("select * from room where type in(?,?,?) AND member>=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(4,member);
			pstmt.setInt(5,price);
			pstmt.setString(6,"y");
		}
		
	}
	else{
		if(type.length==1){
			pstmt=con.prepareStatement("select * from room where type in(?) AND member>=? AND city=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(2,member);
			pstmt.setString(3,city);
			pstmt.setInt(4,price);
			pstmt.setString(5,"y");
		}
		else if(type.length==2){
			pstmt=con.prepareStatement("select * from room where type in(?,?) AND member>=? AND city=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(3,member);
			pstmt.setString(4,city);
			pstmt.setInt(5,price);
			pstmt.setString(6,"y");
		}
		else if(type.length==3){
			pstmt=con.prepareStatement("select * from room where type in(?,?,?) AND member>=? AND city=? AND price<=? AND possible=?");
			for(int i=0; i<type.length; i++){
				
				pstmt.setString(i+1,type[i]);
			}
			pstmt.setInt(4,member);
			pstmt.setString(5,city);
			pstmt.setInt(6,price);
			pstmt.setString(7,"y");
		}
		
	}
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){%>
	<table border=1>
	   	<tr>
	   		<td rowspan="4">
	   			<a href="roominfo.jsp?re=<%=rs.getString("id")%>"><img src="traveroom_img/<%=rs.getString("imgpath")%>" width="100px" height="150px"></a>
	   		</td>
	   		<td colspan=2>
				<a href="roominfo.jsp?re=<%=rs.getString("id") %>"><%=rs.getString("name") %></a>   		
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>
	   			<a href="roominfo.jsp?re=<%=rs.getString("id") %>">최대 <%=rs.getString("member") %>명</a> 
	   		</td>
	   		<td>
	   			<a href="roominfo.jsp?re=<%=rs.getString("id") %>"><%=rs.getString("price") %>원</a> 
	   		</td>
	   	</tr>
	   	 <tr>
	   		<td colspan=2>
	   			<a href="roominfo.jsp?re=<%=rs.getString("id") %>">지역: <%=rs.getString("city") %></a> 
	   		</td>
	   	</tr>
	   	 <tr>
	   		<td colspan=2>
	   			<a href="roominfo.jsp?re=<%=rs.getString("id") %>">집형태: <%=rs.getString("type") %></a> 
	   		</td>
	   	</tr>
	  </table>
	<% } 
		rs.close();
		pstmt.close();
	   	con.close();
   	
} catch (Exception e) {
	out.println("결과 조회가 없습니다.");
    System.out.println("DB 연동 실패 " + e.getMessage());
}
%>