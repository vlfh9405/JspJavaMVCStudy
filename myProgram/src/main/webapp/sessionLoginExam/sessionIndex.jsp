<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	clickclogoup
</script>
</head>
<body>
<%  if(session.getAttribute("UID") == null){%>
	<h2><a href = "sessionLoginPage.jsp">로그인</a></h2>
<%	}else{%>
	<h2><%=session.getAttribute("UID") %>님 반갑습니다.</h2>
	<h2><a href = "sessctionLogoutProcess.jsp">로그아웃</a></h2>
<%} %>
</body>
</html>