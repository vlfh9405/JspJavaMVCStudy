package com.choongang;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hobby")
public class HobbyGet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글 처리
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//2. 데이터 가져오기
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbys != null) {
			for(int i = 0; i < hobbys.length; i++) {
				if(i == 0 ) {
					hobby += "[" + hobbys[i] + ", ";
				}else if(i == hobbys.length-1) {
					hobby += hobbys[i]+"]";
				}else {
					hobby += hobbys[i]+", ";					
				}
			}
		}
		//3. 출력
		response.getWriter()
		.append("<html><head><title>배열 받아오기</title><head>")
		.append("<body>")
		.append("<h1>"+ hobby +"</h1>")
		.append("</body></html>");
	}
}
