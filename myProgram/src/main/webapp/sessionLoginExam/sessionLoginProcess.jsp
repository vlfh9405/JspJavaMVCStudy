<%@page import="java.lang.reflect.AccessFlag.Location"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sql = "select uid,pwd,name from mem where uid like ? and pwd like ?";

	String id = request.getParameter("id");
	String pw = request.getParameter("pw"); 
	
	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("id"));
	pstmt.setString(2,request.getParameter("pw"));
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(id.equals(rs.getString(1)) && pw.equals(rs.getString(2))){
			session.setAttribute("UID", rs.getString(1));
			response.sendRedirect("sessionIndex.jsp");
		}
	}else{%>
		<h1>아이디와 비밀번호가 일치하지 않습니다.</h1>	
		<button onclick="location.href ='sessionLoginPage.jsp'">로그인</button>
	<%}
		MyDBConnection.close(rs, pstmt, con);
	%>
</body>
</html>