<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
		<h1>전체 상품목록</h1>
		<hr/>
		<table border = "1">
			<tr>
				<th>번호</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>수정/삭제</th>
			</tr>
		<c:forEach var = "p" items="${products}" varStatus = "i">
			<tr>
				<td>${i.count }</td>
				<td>${p.id }</td>
				<td><a href = "./pcontrol?action=ingfo&id=${p.id}">${p.name }</a></td>
				<td>${p.price }</td>
				<td>
					<a href = "./pcontrol?action=ingfo&id=${p.id}">수정</a>
					<a href = "./pcontrol?action=delete&id=${p.id}">삭제</a>
					<a href = "./pcontrol?action=send">sendRedirect연습</a>
				</td>
			</tr>
		</c:forEach>	
		
		</table>
</body>
</html>