<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		width : 200px;
		height: 40px;
		text-align: center;
	}
	td{
		width : 70%;
		height: 100%;
		box-sizing: border-box;
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
</style>
</head>
<body>
	<c:set var = "s" value = "${studnet}"/>
	<div class="main">
		<h1>학생정보</h1>
		<table border="1">
			<tr>
				<th>학번</th>
				<td>${s.id }</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>${s.name }</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>${s.email }</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button onclick = "location.href = './scontrol?action=updatePage&id=${s.id}'">수정</button>
					<button onclick = "location.href = './scontrol?action=delete&id=${s.id}'">삭제</button>
					<button onclick = "location.href='./scontrol?action=list'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>