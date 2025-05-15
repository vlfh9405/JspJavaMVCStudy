<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookie = request.getCookies();
	for(int i = 0; i < cookie.length; i++){
		cookie[i].setMaxAge(0);
		response.addCookie(cookie[i]);
	}
	
	response.sendRedirect("./cookieLoginPage.jsp");
%>