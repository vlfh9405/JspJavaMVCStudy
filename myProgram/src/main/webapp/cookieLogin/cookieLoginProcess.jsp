<%@page import="java.net.CookieManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upwd");
	String remember = request.getParameter("remember");
	
	String sql = "select uid, pwd from mem where uid like ? and pwd like ?";
	Connection con = MyDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, uid);
	pstmt.setString(2, upw);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(uid.equals(rs.getString(1)) && upw.equals(rs.getString(2))){
			//쿠키 객체 생성
			Cookie cook = new Cookie("CookID", uid);
				
				if(remember == null){
					//쿠키를 생성하지 않을때
					//cook.setMaxAge(0);
					cook.setMaxAge(0);
				}else{
					cook.setMaxAge(60*60*24*10);//1시간, 분*초*시*연;
					
				}
			//쿠키 생존 기간
			
			
			
			//쿠키 등록
			response.addCookie(cook);
			
			//페이지 이동
			response.sendRedirect("cookieIndex.jsp");
		}
	}else{
		response.sendRedirect("./cookieLoginPage.jsp");
	}
	MyDBConnection.close(rs, pstmt, con);
%>
