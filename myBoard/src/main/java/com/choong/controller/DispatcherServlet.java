package com.choong.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import java.io.IOException;
import java.util.List;

import com.choong.DAO.BoardDAO;
import com.choong.DAO.UserDAO;
import com.choong.DTO.BoardDTO;
import com.choong.DTO.UserDTO;


@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 요청 path를 찾을 수 있어야한다.
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		
//		private final static String URI = request.getRequestURI();
//		private final static String PATH = URI.substring(URI.lastIndexOf("/"));
		
		//2. 추출한 path 정보를 이용해서 요청을 처리
		if(path.equals("/login.do")) {
//			System.out.println("로그인 처리");
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			UserDAO dao = new UserDAO();
			UserDTO user = dao.getUser(id);
			HttpSession session = request.getSession();
			if(user != null && user.getPassword().equals(pw)) {
				session.setAttribute("user", user);
				request.getRequestDispatcher("/searchBoardList.do").forward(request, response);
			}else {
				request.getRequestDispatcher("/myBoard/loginView.do").forward(request, response);
			}
		}else if(path.equals("/insertUser.do")){
			System.out.println("회원가입 처리");
			
		}else if(path.equals("/logout.do")) {
//			System.out.println("로그아웃 처리");
			HttpSession session = request.getSession();
			if(session != null) {
				session.removeAttribute("user");
				request.getRequestDispatcher("/myBoard/loginView.do").forward(request, response);
			}
		}else if(path.equals("/insertBoard.do")) {
			System.out.println("글 등록처리");
			
		}else if(path.equals("/updatetBOard.do")) {
			System.out.println("글 수정 처리");
			
		}else if(path.equals("deleteBoard.do")){
			System.out.println("글 삭제 처리");
			
		}else if(path.equals("/findBoard.do")) {
			System.out.println("글 상세 조회 처리");

		}else if(path.equals("/searchBoardList.do")) {
				String searchCondition = request.getParameter("searchCondition");
				String searchKeyword = request.getParameter("searchKeyword");
				
				// Null Check
				if(searchCondition == null) searchCondition = "TITLE";
				if(searchKeyword == null) searchKeyword = "";
				
				// 세션에 검색 관련 정보를 저장한다. 
				HttpSession session = request.getSession();
				session.setAttribute("condition", searchCondition);
				session.setAttribute("keyword", searchKeyword);	

				// 2. DB 연동 처리
				BoardDTO dto = new BoardDTO();
				dto.setSearchCondition(searchCondition);
				dto.setSearchKeyword(searchKeyword);
				
				BoardDAO dao = new BoardDAO();
				List<BoardDTO> boardList = dao.searchBoardList(dto);
				
				// 3. 화면 이동
				request.setAttribute("boardList", boardList);
				RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/board/searchBoardList.jsp");
				dispatcher.forward(request, response);	
			   
			
		}else if(path.equals("/findBoardAll.do")) {
			System.out.println("글 전체 조회 처리");
			request.getRequestDispatcher("/board/searchBoardList.jsp").forward(request, response);
		}else if(path.equals("/loginView.do")) {
//			System.out.println("로그인페이지");
			request.getRequestDispatcher("/board/login.jsp").forward(request, response);
		}else if(path.equals("/insertBoardView.do")) {
			System.out.println("글쓰기 페이지");
			request.getRequestDispatcher("/board/insertBoard.jsp").forward(request, response);
		}else if(path.equals("/insertUserView.do")) {
			System.out.println("회원가입 페이지");
			request.getRequestDispatcher("/board/insertUser.jsp").forward(request, response);
		}
	} // end of service
	
	
}
