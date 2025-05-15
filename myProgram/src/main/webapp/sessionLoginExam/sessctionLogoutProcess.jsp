<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /*일부 세션제거
   	if(session.getAttribute("UID") != null){
   		session.removeAttribute("UID");
   		response.sendRedirect("sessionIndex.jsp");
   	}
    */
    session.invalidate();
    response.sendRedirect("sessionIndex.jsp");
    %>
