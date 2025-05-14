<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String sql = "delete from student where ssn = ?";
int ssn = Integer.parseInt( request.getParameter("ssn"));
Connection con = MyDBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setInt(1,ssn);
pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	alert("삭제되었습니다.");
	location.href = "./sample2.jsp";
</script>
<body>
	
</body>
</html>