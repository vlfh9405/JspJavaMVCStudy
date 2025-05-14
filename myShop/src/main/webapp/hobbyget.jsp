<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취미</title>
</head>
<body>
	<form action ="/myShop/hobby" method="get">
		<input type = checkbox name = "hobby" value ="java"/>java 공부<br/>
 		<input type = checkbox name = "hobby" value ="html"/>html 공부<br/>
		<input type = checkbox name = "hobby" value ="python"/>python 공부<br/>
		<input type = checkbox name = "hobby" value ="jsp"/>jsp 공부<br/>
		<input type = "submit" value = "전송"/>
		<input type = "reset" value = "수정"/>
	</form>
</body>
</html>