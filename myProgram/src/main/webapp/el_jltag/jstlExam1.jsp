<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var ="num1" value  = "30"/>
<c:set var ="addr" value  = "서울시 마포구 합정동"/>
<h1>num1 변수의 값 : ${num1}</h1>
<h1>addr 변수의 값 : ${addr}</h1>

</body>
</html>