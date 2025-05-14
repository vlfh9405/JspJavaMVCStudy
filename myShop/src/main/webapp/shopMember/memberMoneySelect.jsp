<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "select m.custno, m.custname, m.grade, sum(mo.price * amount)"
			+ " from member as m, money as mo"
			+ " where m.custno = mo.custno"
			+ " group by m.custno"
			+ " order by sum(mo.price * amount) DESC";

	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base.css">

<style>
	section .memberMoneySelect{
	 	text-align: center;
	 	margin: 0 auto;
	 	line-height: 50px;
	}
	section .memberMoneySelect table{
		border-collapse:collapse;
		margin:0 auto;
		border: 1px solid black;
	}
	section .memberMoneySelect td{
		width:150px;
		border: 1px solid black;
		text-align:center;
	}
	section .memberMoneySelect th{
		
		border: 1px solid black;
	}
</style>
</head>
<body>
	<%@include file="./header.jsp" %>
	<%@include file="./nav.jsp" %>
	<section>
		<div class = "memberMoneySelect">
			<h3>회원 매출 조회</h3>
			<table>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
			<%while(rs.next()){
				String result = "";
				switch(rs.getString(3)){
				case "A" : result = "VIP"; break;
				case "B" : result = "일반"; break;
				case "C" : result = "직원"; break;
				}
			%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=result %></td>
					<td><%=rs.getInt(4) %>
				</tr>
			<%} %>
			</table>
		</div>
	</section>
	<%@include file="./footer.jsp" %>
</body>
</html>