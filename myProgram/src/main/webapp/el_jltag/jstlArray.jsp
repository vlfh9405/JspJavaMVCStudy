<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	<c:set var = "arr" value = "${[1,2,3,4,5]}"/>
	--%>
	<c:forEach var = "num" items = "${arr}" varStatus = "i">
		<h1>${i.index} : ${num}</h1>
	</c:forEach>
	<hr/>
	<%--<c:forTokens></c:forTokens> : 구분자를 이용하여 문자열을 나누는(파싱 한다)태그
		var = 파싱된 문자열
		items = "문자열"
		delims = "구분자"
		varStatus = "상태"
		varStatus = "i"
			i.frist : 첫 번째 값
			i.last : 마지막 값
	--%>
	<c:forTokens var = "tokenExam" items = "사과|딸기|복숭아" delims = "|" varStatus="i">
		<%--
			<c:if test = "true / false 를 체크하려는 변수"></c:if>
			test = "true" 실행 <c:if>실행</c:if>
			test = "false" 실행하지 않는다.
		 --%>
		<c:if test = "${i.first }">과일종류[</c:if>
		<span>${tokenExam }</span>
		<c:if test = "${!i.last }">,</c:if>
		<c:if test = "${i.last }">]</c:if>
	</c:forTokens>
</body>
</html>