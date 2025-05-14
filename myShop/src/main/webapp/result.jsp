<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String name; int age; String addr; %>
	<%
		name = request.getParameter("name");
		age = Integer.parseInt(request.getParameter("age"));
		addr = request.getParameter("addr");
	%>
	
	<h1>입력 한 결과</h1>
	<h2> 이름 : <%= name %></h2>
	<h2> 나이 : <%= age %></h2>
	<h2> 주소 : <%= addr %></h2>

</body>
</html>