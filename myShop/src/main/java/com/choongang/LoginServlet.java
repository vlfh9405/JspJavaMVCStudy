package com.choongang;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글 처리
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//2. 데이터 가져오기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		int score = Integer.parseInt(request.getParameter("score"));
		String result = null;
		if(score >= 60) {
			result = "합격";
		}else {
			result = "불합격";
		}
		String id = "vlfh01";
		String pwd = "12345";
		//3. 결과 출력
		if(id.equals(userId) && pwd.equals(userPwd)) {
			response.getWriter()
			.append("<html><head><title>로그인 결과</title></head>")
			.append("<body>")
			.append("<h1>아 이 디 :"+ id +"</h1>")
			.append("<h1>비밀번호 :"+ pwd +"</h1>")
			.append("<h1>점   수 :"+ score +"점</h1>")
			.append("<h1>결   과 :"+ result +"</h1>")
			.append("</body><html>");
		}else {
			response.getWriter()
			.append("<html><head><title>로그인 결과</title></head>")
			.append("<body>")
			.append("<h1>로그인 실패 ID 와 pwd를 확인하세요</h1>")
			.append("</body><html>");
		}
		
		
	}
}
