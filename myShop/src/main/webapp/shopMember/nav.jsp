<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.nav{
		margin: 0;
		padding: 0;
		background-color:rgb(83 92 183);
	}
	.nav ul{
		margin: 0;
		display: flex;
		justify-content: space-around;
	}
	.nav li{
		margin: 0;
		list-style: none;
		padding: 5px 0;
	}
	.nav li a{
		padding: 0 5px;
		color: white;
		font-weight: 600;
		text-decoration: none;	
	}
	
	.nav li a:hover{
		color: red;
	}
</style>

</head>
<body>
		<div class = "nav">
		<ul>
			<li><a href = "./memberAdd.jsp">회원등록</a></li>
			<li><a href = "./memberSelect.jsp">회원목록조회수정</a></li>
			<li><a href = "./memberMoneySelect.jsp">회원매출조회</a></li>
			<li><a href = "./index.jsp">홈으로</a></li>
		</ul>
		</div>
</body>
</html>