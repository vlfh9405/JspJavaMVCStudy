<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ssn = Integer.parseInt(request.getParameter("ssn"));
	String name = request.getParameter("name");
	int score = Integer.parseInt(request.getParameter("score"));
	String addr = request.getParameter("addr");
%>
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
	<form action ="./function/studentFunction.jsp" method = "post" name = "update">
		<input type="hidden" name="formName" value="studentUpdate">
		<h1>수정</h1>
		<h3>학번 : <input type = "text" name = "ssn" readonly value = "<%=ssn %>"></h3>
		<h3>이름 : <input type = "text" name = "name" readonly value = "<%=name%>"></h3>
		<h3>점수 : <input type = "text" name = "score" value = "<%=score %>"></h3>
		<h3>주소 : <input type = "text" name = "addr" value = "<%=addr%>"></h3>
		<input type = "submit" value = "수정완료">
		<input type = "button" onClick = history.back() value = "취소">
	</form>
	</div>
</body>
</html>