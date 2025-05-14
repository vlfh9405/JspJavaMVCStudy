<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String resultPw = "";
	for(int i = 0; i < pw.length(); i++){
		resultPw += "*";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>입력 결과</h1>
	<h2>id : <%= id %></h2>
	<h2>resultPw : <%= resultPw %></h2>
	<h2>pw : <%= pw %></h2>
	<h2>name : <%= name%></h2>
	<button onClick = history.back()>뒤로가기</button>
</body>
</html>