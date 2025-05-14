<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String sql = "select * from member";
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
	section .memberSelect{
	 	text-align: center;
	 	margin: 0 auto;
	}
	section .memberSelect a{
		text-decoration: none;
		color: white;
		font-weight: 500;
	}
	section .memberSelect a:hover{
		color:red;
	}
	section .memberSelect h3{
		line-height: 50px;
	}
	section .memberSelect table{
		border-collapse:collapse;
		margin:0 auto;
		border: 1px solid black;
	}
	section .memberSelect td{
		padding: 3px 30px;
		border: 1px solid black;
		text-align:center;
	}
	section .memberSelect th{
		padding: 3px;
		border: 1px solid black;
	}
</style>
</head>
<body>
<%@include file="./header.jsp" %>
	<%@include file="./nav.jsp" %>
	<section>
		<div class="memberSelect">
		<h3>회원목록조회/수정</h3>
			<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%while(rs.next()){ 
				String result = rs.getString(6).equals("A") ? "VIP": rs.getString(6).equals("B") ? "일반" : "직원";
				int custId = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String addr = rs.getString(4);
				String joindate = rs.getString(5);
				String city = rs.getString(7);
			%>
			<tr>
				<td>
					<a href = "./memberUpdate.jsp?id=<%=custId%>&name=<%=name%>&phone=<%=phone%>
					&addr=<%=addr%>&grade=<%=rs.getString(6)%>&joindate=<%=joindate%>&city=<%=city%>">
					<%=rs.getInt(1) %>
					</a>
				</td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=result %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<%} %>
			</table>
			
		</div>
	</section>
	<%@include file="./footer.jsp" %>
</body>
</html>