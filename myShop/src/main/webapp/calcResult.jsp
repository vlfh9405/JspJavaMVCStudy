<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h1>입력결과</h1>
 <% int result = 0; int number1 = 0; int number2 = 0; String calc = "";
  	try{
	number1 = Integer.parseInt(request.getParameter("number1"));
	number2 = Integer.parseInt(request.getParameter("number2"));  		
	calc = request.getParameter("calc");
  
	switch(calc){
	case "+" : result = number1 + number2; break;
	case "-" : result = number1 - number2; break;
	case "/" : result = number1 / number2; break;
	case "*" : result = number1 * number2; break;
	default : result = 0;
  	}  	
  	%>
	<h2>첫 번째 입력 : <%=number1 %></h2>
	<h2>두 번째 입력 : <%=number2 %></h2>
	<h2>결과 : <%=result %></h2>
  	
  	<%}catch(NumberFormatException e){%>
  	<h1>오류 숫자를 입력하세요 </h1>
	<%}%>
	<button onClick=history.back();>뒤로가기</button>
</body>
</html>