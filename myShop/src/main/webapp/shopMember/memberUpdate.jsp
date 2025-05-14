<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int custId = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	String grade = request.getParameter("grade");
	
	String joindate = request.getParameter("joindate");
	
	String city = request.getParameter("city");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base.css"> 

<style>
	section .update{
	 	line-height: 50px;
	 	text-align: center;
	 	margin: 0 auto;
	}
	section .update table{
		border-collapse:collapse;
		margin:0 auto;
		border: 1px solid black;
	}
	section .update td{
		text-align:left;
		width: 300px;
		border: 1px solid black;
	}
	section .update th{
		width: 300px;
		border: 1px solid black;
	}
	section .update td .buttonBox{
		text-align: center;
	}
	section .update td input{
		margin-left: 10px;
	}
</style>
</head>
<body>
	<%@include file="./header.jsp" %>
	<%@include file="./nav.jsp" %>
	<section>
		<div class = "update">
			<h3>회원정보수정</h3>
			<form action = "./memberUpdateAction.jsp" method = "post" name = "memberAdd">
			<table>
				<tr>
					<th>회원번호(자동 발생)</th>
					<td>
						<input type = "text" name = "custId" id = "custId" value = "<%=custId%>" readonly="readonly"/>
					</td>
				</tr>
				
				<tr>
					<th>회원 성명</th>
					<td>
						<input type = "text" name = "name" id = "name" value = "<%=name %>" readonly="readonly" />
					</td>
				</tr>
				
				
				<tr>
					<th>전화번호</th>
					<td>
						<input type = "text" name = "phone" id = "phone"  value = "<%=phone %>"/>
					</td>
				</tr>
				
				
				<tr>
					<th>주소</th>
					<td>
						<input type = "text" name = "addr" id = "addr"value = "<%=addr %>"/>
					</td>
				</tr>
				
				
				<tr>
					<th>가입일자</th>
					<td>
						<input type = "text" name = "joindate" id = "joindate" value = "<%=joindate %>" readonly="readonly"/>
					</td>
				</tr>
				
				
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<input type = "text" name = "grade" id = "grade" value = "<%=grade%>"/>
					</td>
				</tr>
				
				
				<tr>
					<th>도시코드</th>
					<td>
						<input type = "text" name = "city" id = "city" value = "<%=city %>"/>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;" colspan="2">
						<input type="submit" value="수정" onclick="return check()">
						<input type = "button" value = "삭제" onclick="location.href='./memberDeleteAction.jsp?custId=<%=custId%>'">
					</td>
				</tr>
			</table>
			</form>	
		</div>
	</section>
	<%@include file="./footer.jsp" %>
</body>
</html>