<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int custId = Integer.parseInt(request.getParameter("custId"));
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String sql = "insert into member values(?,?,?,?,?,?,?)";
	
	try{
	String tel1 = phone.substring(0, 3);
	String tel2 = phone.substring(3, 7);
	String tel3 = phone.substring(7);
	phone = tel1 + "-" + tel2 + "-" + tel3;
		
	}catch(StringIndexOutOfBoundsException e){
		e.printStackTrace();
	}
	
	
	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, custId);
	pstmt.setString(2,name);
	pstmt.setString(3, phone);
	pstmt.setString(4,addr);
	pstmt.setString(5,joindate);
	pstmt.setString(6,grade);
	pstmt.setString(7,city);
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	location.href = "./index.jsp";
</script>
</head>
<body>

</body>
</html>