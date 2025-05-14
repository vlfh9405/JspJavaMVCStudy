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
<style>
	
	table{
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	box-sizing: border-box;
	margin-top: 20px
	}
	th{
	background-color: #a8a8c3;
	border: 1px solid black;
	width: 150px;
	}
	.buttonBox{
	display: flex;
	justify-content: space-around;
	border-collapse: collapse;
	box-sizing: border-box;
	}
	td {
	border: 1px solid black;
	text-align: center;
	}

</style>
</head>
<body>
	<%@include file ="./header.jsp"%>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>점수</th>
			<th>주소</th>
			<th>버튼</th>
		</tr>
	<%
	String sql = "select * from student";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	con = MyDBConnection.getConnection();
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		int ssn = rs.getInt(1);
		String name = rs.getString(2);
		int score = rs.getInt(3);
		String addr = rs.getString(4);
		%>
		<tr>
			<td><%= ssn %></td>
			<td><%= name %></td>
			<td><%= score %></td>
			<td><%= addr %></td>
			<td >
				<div class = "buttonBox">
				<span> </span>
					<a href = "./update.jsp?ssn=<%=ssn%>&name=<%=name%>&score=<%=score%>&addr=<%=addr%>">
						<button>수정</button>
					</a>
				<span> </span>
					<a href = "./function/studentFunction.jsp?formName=studentDelete&ssn=<%=ssn%>&name=<%=name%>">
						<button>삭제</button>
					</a>
				<span> </span>
				</div>
			</td>
		</tr>	
	<%}
	MyDBConnection.close(rs, pstmt, con);
	%>
		
	</table>
	
</body>
</html>