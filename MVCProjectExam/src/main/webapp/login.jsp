<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "./css/base.css">
</head>
<body>
	<div class = "mainBox">
	<form action = "./control?action=login" method = "post">
	<h1>관리자 로그인</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type = "text" name  = "id" placeholder="아이디를 입력하세요"/></td>			
			<td rowspan="2"><input type = "submit" value = "로그인"/></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type = "password" name  = "pw" placeholder="비밀번호를 입력하세요"/></td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>