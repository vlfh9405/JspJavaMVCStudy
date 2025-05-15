<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "cookieLoginProcess.jsp" method = "post">
		<table>
			<tr>
				<th> 아이디 </th>
				<td><input type = "text" name ="uid"/></td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td><input type = "password" name ="upwd"/></td>
			</tr>
			<tr>
				<td colspan = "2" style = "text-align: center;">
					<input type = "checkBox" name = "remember" value = "ok"/>자동로그인
					<input type = "submit" name = "submit" value = "로그인"/>
					<input type = "button" value = "회원가입" onclick = "location.href='./cookieIndex.jsp'"/>	
				</td>
			</tr>
		</table>
	</form>
</body>
</html>