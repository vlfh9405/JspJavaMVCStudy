<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.function.Predicate"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   String sql = "select max(custno) from member;";
   int custId = 0;
   Connection con = MyDBConnection.getConnection();
   PreparedStatement pstmt = con.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
   if(rs.next()){
	   custId = rs.getInt(1)+1;
   }
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base.css"> 
<style>
	section .add{
	 	line-height: 50px;
	 	text-align: center;
	 	margin: 0 auto;
	}
	section .add table{
		border-collapse:collapse;
		margin:0 auto;
		border: 1px solid black;
	}
	section .add td{
		text-align:left;
		width: 300px;
		border: 1px solid black;
	}
	section .add th{
		width: 300px;
		border: 1px solid black;
	}
	section .add td .buttonBox{
		text-align: center;
	}
	section .add td input{
		margin-left: 10px;
	}
</style>
<script>

		function check() {
		    const name = document.getElementById("name").value.trim();
		    const phone = document.getElementById("phone").value.trim();
		    const addr = document.getElementById("addr").value.trim();
		    const joindate = document.getElementById("joindate").value.trim();
		    const grade = document.getElementById("grade").value.trim();
		    const city = document.getElementById("city").value.trim();

		   
			if(!name){
				alert("이름을 등록해주세요.");
				return false
			}else if(!phone){
				alert("핸드폰 번호를 입력해주세요.");
			    return false;
			}else if(!addr){
				alert("주소를 입력해주세요.");
			    return false;
			}else if(!joindate){
				alert("가입날짜를 입력해주세요.")
			    return false;
			}else if(!grade){
				alert("등급을 입력해주세요.")
			    return false;
			}else if(!city){
				alert("도시 코드를 등록해주세요.")
			    return false;
			}else{
		    	alert("회원 등록이 완료되었습니다.");
		    	return true; 
			}
		}
	
</script>
</head>
<body>
	<%@include file="./header.jsp" %>
	<%@include file="./nav.jsp" %>
	<section>
		<div class = "add">
			<h3>회원 등록</h3>
			<form action = "./memberAddAction.jsp" method = "post" name = "memberAdd">
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
						<input type = "text" name = "name" id = "name"/>
					</td>
				</tr>
				
				
				<tr>
					<th>전화번호</th>
					<td>
						<input type = "text" name = "phone" id = "phone"/>
					</td>
				</tr>
				
				
				<tr>
					<th>주소</th>
					<td>
						<input type = "text" name = "addr" id = "addr"/>
					</td>
				</tr>
				
				
				<tr>
					<th>가입일자</th>
					<td>
						<input type = "text" name = "joindate" id = "joindate"/>
					</td>
				</tr>
				
				
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<input type = "text" name = "grade" id = "grade"/>
					</td>
				</tr>
				
				
				<tr>
					<th>도시코드</th>
					<td>
						<input type = "text" name = "city" id = "city"/>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;" colspan="2">
						<input type="submit" value="등록" onclick ="return check()">
						<input type = "submit" value = "조회">
					</td>
				</tr>
			</table>
			</form>	
		</div>
	</section>
	<%@include file="./footer.jsp" %>
</body>
</html>