<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "update member set phone = ?, address = ?, grade = ?, city = ?  where custno = ?";
	int csutId = Integer.parseInt(request.getParameter("custId"));
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String city = request.getParameter("city");
	String grade = request.getParameter("grade");
	
	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, phone);
	pstmt.setString(2, addr);
	pstmt.setString(3, grade);
	pstmt.setString(4, city);
	pstmt.setInt(5, csutId);
	
	pstmt.executeUpdate();
%>
<script>
location.href='./index.jsp'
</script>