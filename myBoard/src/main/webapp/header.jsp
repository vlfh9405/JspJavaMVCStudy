<%@page import="com.choong.DTO.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.headerWrop{
	width: 100%;
	height: 100px;
	line-height: 100px;
	background-color: rgb(220,220,220);
	margin-bottom: 20px;
}
</style>
</head>
<body>
<div class ="headerWrop">
	<%--
	--%<%UserDTO user = (UserDTO) session.getAttribute("user");
	if(user == null){
		<a href = "/myBoard/insertUserView.do">회원가입</a>&nbsp;&nbsp;&nbsp;
		<a href = "/myBoard/loginView.do">로그인</a>	&nbsp;&nbsp;
	<%}else{%>
		<a href = "/myBoard/insertBoardView">글등록</a>&nbsp;&nbsp;&nbsp;
		<a href = "/myBoard/logout.do">로그아웃</a>&nbsp;&nbsp;
	<%}%
	--%>
	<c:if test = "${user == null}">
		<a href = "/myBoard/insertUserView.do">회원가입</a>&nbsp;&nbsp;&nbsp;
		<a href = "/myBoard/loginView.do">로그인</a>	&nbsp;&nbsp;
	</c:if>
	<c:if test = "${user != null }">
		<a href = "/myBoard/insertBoardView.do">글등록</a>&nbsp;&nbsp;&nbsp;
		<a href = "/myBoard/logout.do">로그아웃</a>&nbsp;&nbsp;
	</c:if>
</div>
</body>
</html>