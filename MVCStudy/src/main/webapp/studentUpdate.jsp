<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		width : 200px;
		height: 40px;
		text-align: center;
	}
	td{
		width : 70%;
		height: 100%;
		box-sizing: border-box;
	}
	
	th{
		background-color: gray;
	}
	
	hr{
	margin-bottom: 20px;
	}
	.main{
	text-align:center;
	margin:0 auto;
	}
	body{
		width: 700px;
	}
	
	input[type="text"], input[type="email"]{
		outline:none;
		border:none;
		width: 100%;
		box-sizing: border-box;
		font-size: 20px;
	}
</style>
</head>
<body>
<c:set var = "s" value ="${student}"/>
<div class="main">
		<h1>정보수정</h1>
		<form action = "/MVCStudy/scontrol?action=update&${s.id}" method = "post">
		<table border="1">
			<tr>
				<th>학번</th>
				<td><input type="text" readonly="readonly" value = "${s.id}" name = "id"></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type = "text" required="required" name = "name" value = "${s.name }"></td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type = "email" required="required" name = "email" value = "${s.email }"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type = "submit" value = "수정완료">
					<input type = "button" value = "수정취소" onclick = "location.href='./scontrol?action=detailPage&id=${s.id}'">
					<input type = "button" value = "목록으로" onclick = "location.href='./scontrol?action=list'">
				</td>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>