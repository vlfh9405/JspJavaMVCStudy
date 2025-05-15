<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 쿠키가 null 일 경우 처리 
		if(request.getCookies() == null){
			response.sendRedirect("./cookieLoginPage.jsp");
			return;
		}
		Cookie[] cook = request.getCookies();
		for(Cookie cok : cook){
			if(cok.getName().equals("CookID")){%>
				<h1><%= cok.getValue() %>님 반갑습니다.</h1>
				<button onclick = "location.href ='cookieLogoutProcess.jsp'">로그아웃</button>
				
	<%		
			return;
			}
		}
		%>
	
	
</body>
</html>