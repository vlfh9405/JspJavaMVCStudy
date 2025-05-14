<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    int ssn = Integer.parseInt(request.getParameter("ssn"));
    String name = request.getParameter("name");
    
    String sql = "select score from student where ssn = ? and name like ?";
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    con = MyDBConnection.getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, ssn);
    pstmt.setString(2, name);
    rs = pstmt.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.select{
		text-align: center;
	}
</style>
</head>
<body>
	<%@include file = "./header.jsp" %>
	<div class = "select">
	<%if(rs.next()){
		String result = "";
		if(rs.getInt(1) >= 60){
			result = "합격";
		}else{
			result = "불합격";
		}
	%>
		<h1>결과</h1>
		<h1>이름 : <%=name %></h1>
		<h1>점수 : <%=rs.getInt(1) %></h1>
		<h1><%=result %></h1>
	<%}else{%>
		<h1>조회한 결과가 없습니다.</h1>
	<%} 
	MyDBConnection.close(rs, pstmt, con);
	%>
	</div>
</body>
</html>