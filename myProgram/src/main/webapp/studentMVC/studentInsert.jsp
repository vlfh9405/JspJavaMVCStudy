<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 추가</title>
</head>
<body>
	<h1>학생 정보 추가 화면</h1>
	<%-- 컨트롤러로 이동 --%>
	<form action = "/myProgram/scontrol?action=insert" method = "post">
	<table>
		<tr>
			<th>학번</th>
			<td><input type = "text" name = "id" required/></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type = "text" name = "name" required/></td>
		</tr>
		
		<tr>
			<th>메일주소</th>
			<td><input type = "text" name = "email" required/></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type = "submit"  value = "학생정보 등록"/>
				<input type = "button" onclick = "location.href = '/myProgram/scontrol?action=list'" value = "학생정보 리스트"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>