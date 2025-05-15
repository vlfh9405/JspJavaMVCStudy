<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="main">
	<h1>학생 추가</h1>
		<form action = "/MVCStudy/scontrol?action=insert" method="post" >
		<table border="1">
			<tr>
				<th>학번</th>
				<td><input type="text" name = "id" readonly="readonly" value = "${id}"></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name = "name" required="required"></td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="email" name = "email" required="required"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type= "submit" value = "작성완료"/>
					<input type= "button" value = "작성취소" onclick="location.href='./scontrol?action=list'"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>