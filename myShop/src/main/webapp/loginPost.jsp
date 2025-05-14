<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form action = "/myShop/login" method = "post" name = "loginForm">
		아이디 : <input type="text" name ="userId"/> <br/>
		비밀번호 : <input type="password" name ="userPwd"/> <br/>
		점수 : <input type="text" name ="score"/> <br/>
		<input type = "submit" value = "로그인"/>
		<input type = "reset" value ="리셋"/>
	</form>
</body>
</html>