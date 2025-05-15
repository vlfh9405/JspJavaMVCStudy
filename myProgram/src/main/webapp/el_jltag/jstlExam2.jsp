<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	th{
		background-color: blue;
		color:white;
	}
	
	th, td{
		padding: 10px;
	}
</style>
</head>
<body>
<h1>구구단</h1>
<table border = 1>
	<tr>
	<c:forEach var ="dan" begin = "2" end = "9">
		<th>${dan}단</th>
	</c:forEach>
	</tr>	
	<%--변수명 begin = "시작값" end = "끝값" varStatus = "반복진행을 참조하기 위한변수" --%>
	<c:forEach var ="i" begin = "1" end = "9" varStatus="status">
	<tr>
		<c:forEach var = "j" begin = "2" end = "9">
			<td class = "gugu">${j} x ${i} = ${i * j}<%--
			${status.count}, ${status.index}</td>
			 --%> 
		</c:forEach>
	</tr>
	</c:forEach>
	
</table>
</body>
</html>