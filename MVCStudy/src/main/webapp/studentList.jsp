<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	td:hover{
		background-color:pink;
	}
	th{
		background-color: gray;
	}
	
	hr{
	margin-bottom: 20px;
	}
	.main{
	text-align:center;
	margin:0 auto;
	}
	body{
		width: 700px;
	}
	a{
		text-decoration: none;
		color: black;
		font-size:20px;
	}
	a:visited {
 	color : black;
  	text-decoration: none;
	}
	.buttonBox{
		display: flex;
		justify-content: space-around;
	}
</style>
</head>
<body>
	<div class = "main">
	<h1>홈</h1>
	<table border="1">
		<tr>
			<th>no</th>
			<th>학번</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<c:forEach items = "${studentAll}" var = "s" varStatus = "i">
		<tr>
			<td><a href="./scontrol?action=detailPage&id=${s.id}">${i.count}</a></td>
			<td><a href="./scontrol?action=detailPage&id=${s.id}">${s.id}</a></td>
			<td><a href="./scontrol?action=detailPage&id=${s.id}">${s.name}</a></td>
			<td><a href="./scontrol?action=detailPage&id=${s.id}">${s.email}</a></td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan = "4" >
			<div class="buttonBox">			
				<button onclick = "location.href='./scontrol?action=insertPage'">추가</button>
				<form action = "/MVCStudy/scontrol?action=search">
					<input type = "text" name = "searchText">
					<input type = "submit"value = "검색">
				</form>
			</div>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>