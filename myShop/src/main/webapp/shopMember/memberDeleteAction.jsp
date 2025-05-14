<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int custId = Integer.parseInt(request.getParameter("custId"));
	String sql = "delete from member where custno = ?";
	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, custId);
	pstmt.executeUpdate();
%>
<script>
	alert("삭제 되었습니다.");
	location.href = "./memberSelect.jsp";
</script>
