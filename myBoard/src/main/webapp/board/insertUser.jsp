<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{
	height: 40px;
	line-height: 40px;
}
.tdTitle{
	width: 200px;
	text-align: center;
	background-color: pink;
}
.tdContent{
	width: 400px;
	padding-left: 20px;
}
.tdContent>input{
	width: 350px;
	height: 30px;
	line-height: 30px;
}
.tdSubmit{
	text-align: center;
}
.buttonBox{
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="../header.jsp" %>
	<form action = "/myBoard/insertUser.do" method = "post">
	<h2>회원가입 화면</h2>
	<table border= "1">
		<tr>
			<td class="tdTitle">아이디</td>
			<td class="tdContent"><input type="text" name="id" required="required" placeholder="아이디 입력"> </td>
		</tr>
		
		<tr>
			<td class='tdTitle'>비밀번호</td>
			<td class="tdContent"><input type = "password" placeholder="비밀번호 입력" name = "password" required="required"></td>
		</tr>
		
		<tr>
			<td class='tdTitle'>이름</td>
			<td class="tdContent"><input type = "text" placeholder="이름 입력" name = "name" required="required"></td>
		</tr>
		
		<tr>
			<td class='tdTitle'>등급</td>
			<td class="tdContent"><input type = "text" placeholder="등급 입력" name = "role" required="required"></td>
		</tr>
		
		<tr>
		
			<td colspan = "2" class = "buttonBox">
			<input type = "submit" value = "가입완료">
			<input type = "reset" value = "작성취소">
			</td>
		</tr>
	</table>
	</form>
	<br/>
	<hr/>
	<%@include file="../footer.jsp" %>
</body>
</html>