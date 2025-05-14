
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MyDBConnection mydb = new MyDBConnection();	
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "";
	//System.out.print("입력하세요 : ");
	//int inputSsn = Integer.parseInt(sc.nextLine());
	int ssn = 0; String name =""; int score = 0; String addr =""; 
	sql = "select * from student";
	con = mydb.getConnection();
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
	border: 1px solid black;
	border-collapse: collapse;
	}
	th{
	border: 1px solid black;
	width: 140px;
	}
	td {
	border: 1px solid black;
	text-align: center;
	}
</style>
</head>
<body>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>성적</th>
				<th>주소</th>
			</tr>
	<%
	while(rs.next()){
		ssn = rs.getInt(1);
		name = rs.getString(2);
		score = rs.getInt(3);
		addr = rs.getString(4);
	%>
			<tr>
				<td><%=ssn %></td>
				<td><%=name %></td>
				<td><%=score %></td>
				<td><%=addr %></td>
			</tr>
	<%}
	mydb.close(rs, pstmt, con);
	%>
		</table>
</body>
</html>