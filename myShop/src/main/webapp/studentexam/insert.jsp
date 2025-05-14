<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.insertBox{
	margin: 0 auto;
	text-align: center;
	}
	input[type="submit"], input[type="button"]{
	background-color: rgb(220,220,220,);
	width: 100px;
	}
	input[type="button"]{
	margin-left: 20px; 
	}
</style>
</head>
<body>
	<%@include file = "./header.jsp" %>
	<div class = "insertBox">
	<form action ="./function/studentFunction.jsp" method = "post" name = "insert">
		<input type="hidden" name="formName" value="studentInsert">
		<h1>등록</h1>
		<h3>학번 : <input type = "text" name = "ssn"></h3>
		<h3>이름 : <input type = "text" name = "name"></h3>
		<h3>점수 : <input type = "text" name = "score"></h3>
		<h3>주소 : <input type = "text" name = "addr"></h3>
		<input type = "submit" value = "등록완료">
		<input type = "button" onClick = history.back() value = "취소">
	</form>
	</div>
</body>
</html>