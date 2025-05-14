<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ssn = Integer.parseInt(request.getParameter("ssn"));
	String name = request.getParameter("name");
	int score = Integer.parseInt(request.getParameter("score"));
	String addr = request.getParameter("addr");
	
	MyDBConnection myDB = new MyDBConnection();
	Connection con = myDB.getConnection();
	String sql = "insert into student values(?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,ssn);
	pstmt.setString(2,name);
	pstmt.setInt(3,score);
	pstmt.setString(4,addr);
	
	pstmt.executeUpdate();
	
	myDB.close(null, pstmt, con);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("등록되었습니다.")
	location,href = "./sample2.jsp";
</script>
</head>
<body>
</body>
</html>