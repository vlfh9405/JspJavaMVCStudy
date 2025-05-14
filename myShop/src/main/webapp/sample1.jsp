<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp 연습</h1>
	<form action ="./result.jsp" method ="post" name ="user">
		name : <input type = "text" name = "name"/><br/>
		age : <input type = "text" name = "age"/><br/>
		addr : <input type = "text" name = "addr"/><br/>
		<input type = "submit" value = "작성"/>
		<input type = "reset" value = "리셋"/>
	</form>
</body>
</html>