<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body{
	width: 900px;
	}
	.header{
	padding: 10px 0;
	background-color: rgb(220,220,220);
	}
	ul{
	display: flex;
	justify-content: space-around;
	margin: 0;
	padding: 0;
	}
	
	li{
	margin: 0;
	padding : 0;
	list-style: none;
	}
	.header a{
	padding: 10px 20px 10px 20px;
	text-decoration: none;
	color: black;
	}
	a:hover{
	color: red;
	}

</style>

<script>
		
</script>

</head>
<body>
	<div class = "header">
		<nav>
			<ul>
				<li ><a href = "./index.jsp">정보</a></li>
				<li><a href = "./insert.jsp">추가</a></li>
				<li><a href = "./select.jsp">조회</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>