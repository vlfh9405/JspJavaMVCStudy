<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select count(m.custno), count(mo.custno), sum(mo.amount * mo.price)"  
				+ " from member m inner join money mo"
			    + " on m.custno = mo.custno";
	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	DecimalFormat d = new DecimalFormat("#,##0원");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base.css"> 
<style>
	.homeContent{
		margin-top:20px;
		display: flex;
		flex-direction: column;
		gap:40px
	}
</style>
</head>
<body>
	<%@include file="./header.jsp" %>
	<%@include file="./nav.jsp" %>
	<section>
		<div class="home">
			<h3>홈 입니다.</h3>
			<div class = "homeContent"> 
			<%if(rs.next()){%>
				<h3>회원수 : <%=rs.getInt(1) %>명</h3>
				<h3>주문건수 : <%=rs.getInt(2) %>건</h3>
				<h3>총 매출 : <%=d.format(rs.getLong(3))%></h3>
			<%}%>
			</div>
		</div>
	</section>
	<%@include file="./footer.jsp" %>
</body>
</html>