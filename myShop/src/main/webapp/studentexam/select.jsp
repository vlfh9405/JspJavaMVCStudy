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
		<h1>결과 확인</h1>
		<form action = "./selectAction.jsp" method = "get" name = "select">
			<h3>학번 : <input type = "text" name = "ssn"/></h3>
			<h3>이름 : <input type = "text" name = "name"/></h3>
			<input type = "submit" value = "결과확인"/>
			<input type = "button" onClick = history.back() value = "취소"/>
		</form>
	</div>
</body>
</html>