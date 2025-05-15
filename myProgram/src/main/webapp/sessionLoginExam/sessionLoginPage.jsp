<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "./sessionLoginProcess.jsp" method = "post">
		<table>
			<tr>
				<th> 아이디 </th>
				<td><input type = "text" name ="id"/></td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td><input type = "password" name ="pw"/></td>
			</tr>
			<tr>
				<td colspan = "2" style = "text-align: center;">
				<input type = "submit" name = "submit" value = "로그인"/>
				<input type = "button" value = "회원가입" onclick = "location.href='./sessionIndex.jsp'"/>	
				</td>
			</tr>
		</table>
	</form>
</body>
</html>