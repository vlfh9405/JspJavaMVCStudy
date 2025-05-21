<%@page import="com.choong.DTO.BoardDTO"%>
<%@page import="java.util.ArrayList"%>



<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>
<form action="/myBoard/searchBoardList.do" method="post">
	<table border="1">
	<tr>
		<td>
			<select name="searchCondition">
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			</select>
			<input name="searchKeyword" type="text"/>
			<input type="submit" value="검색"/>
			<button onclick="location.href='/myBoard/findBoardAdd.do'">목록</button>
		</td>
	</tr>
	</table>
</form>
<!-- 검색 종료 -->

<table border="1" >
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>등록일</th>
	<th>조회수</th>
</tr>

<%-- 
<% 
	List<BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");
	for(BoardDTO board : boardList) { 
%>
<tr>
	<td><%= board.getSeq() %></td>
		<td ><a href="/myBoard/findBoard.do?seq=<%= board.getSeq() %>"><%= board.getTitle() %></a></td>
	<td><%= board.getWriter() %></td>
	<td><%= board.getRegDate() %></td>
	<td><%= board.getCnt() %></td>
</tr>
<% } %>
--%>

	<c:forEach var = "b" items = "${boardList}" varStatus = "i">
		<tr>
			<td>${b.getSeq()}</td>
			<td><a href = "/myBoard/findBoard.do?seq=${b.getSeq()}">${b.getTitle()}</a></td>	
			<td>${b.getWriter()}</td>
			<td>${b.getRegDate()}</td>
			<td>${b.getCnt()}</td>
		</tr>
	
	</c:forEach>

</table>
</body>
</html>