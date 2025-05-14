<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box{
		width: 500px;
	}
	input{
		height : 40px;
		width : 300px;
		font-size : 20px;
		outline:none;
	}
</style>
</head>
<body>
	<div class = "box">
	<form action ="loginResult.jsp" method = "post" name = "login">
		<h1>아이디 : <input type = "text" name = "id"/></h1>
		<h1>비밀번호 : <input  type ="password" name ="pw"/></h1>
		<h1>이름 : <input  type ="text" name ="name"/></h1>
		<input type = "submit" value = "로그인"/>
		<input type = "reset" value = "리셋"/>
		<input type = "button" onClick=history.back() value = "작성취소" />
	</form>
	</div>
</body>
</html>