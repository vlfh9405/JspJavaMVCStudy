<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전체 상품목록</h1>
		<hr/>
		<table border = "1">
			<tr>
				<th>상품코드</th>
				<th>상풍명</th>
				<th>제조사</th>
				<th>상품가격</th>
				<th>등록일</th>
			</tr>
			
			<tr>
				<td>${p.id }</td>
				<td>${p.name }</td>
				<td>${p.maker }</td>
				<td>${p.price  }</td>
				<td>${p.date  }</td>
			</tr>
		
		</table>
</body>
</html>