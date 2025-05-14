<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action ="calcResult.jsp" method ="get" name = "calcForm">
		<input type = "text" name = "number1" />
		<select name ="calc">
			<option value = "+">+</option>
			<option value = "-">-</option>
			<option value = "/">/</option>
			<option value = "*">*</option>
		</select>
		<input type = "text" name = "number2" /><br/>
		<input type = "submit" value = "전송"/>
		<input type = "reset" value ="리셋"/>
		<input type = "button" onClick = history.back() value ="작성취소"/>
	</form>
</body>
</html>