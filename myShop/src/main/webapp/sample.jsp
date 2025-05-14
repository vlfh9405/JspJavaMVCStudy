<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp연습</h1>
	<%-- 주석, 1 ~ 5 까지의 합 구하기 --%>
	<!-- 여기는 HTML 주석 -->
	
	<%-- 선언문 연습, 자바의 필드나 메서드를 정의 --%>
	<%!
	int sum = 0;
	int add(){ //default 타입
		for(int i = 1; i <= 5; i++){
			sum += i;
		};
	return sum;
	}
	%>
	<%-- 스크립틀릿 태그, 자바 코드 작성 --%>
	<%
	int hap = 0;
	for(int i = 1; i <= 100; i++){
		hap += i;
	}
	%>
	
	<%-- 표현문 태그 --%>
	<h2>1 ~ 5 까지 합 : <%=add() %></h2>
	<h2>1 ~ 100 까지 합 : <%=hap %></h2>
		
</body>
</html>