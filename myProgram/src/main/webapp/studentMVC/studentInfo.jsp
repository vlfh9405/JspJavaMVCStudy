<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td,th{
		width : 200px;
		height: 40px;
		text-align: center;
	}
	
	th{
		background-color: gray;
	}
	
	hr{
	margin-bottom: 20px;
	}
</style>
</head>
<body>
	<h1>학생정보</h1>
	<hr/>
	<table border="1">
		<tr>
			<th>no</th>
			<th>학번</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<%--자료를 넣을자리 --%>
		<c:forEach items = "${studentAll }" var ="s" varStatus="i">
			
		<tr>
			<td>${i.count}</td> <%--횟수 누적--%>
			<td>${s.id }</td>
			<td>${s.name }</td>
			<td>${s.email }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><input type = "button" onclick = "location.href = '/myProgram/scontrol?action=send'" value = "학생등록"/></td>
		</tr>
	</table>
</body>
</html>