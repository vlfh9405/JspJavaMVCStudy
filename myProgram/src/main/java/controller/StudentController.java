package controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import controller.dao.StudentDao;
import controller.dto.Student;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/scontrol")
public class StudentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	StudentDao dao;
	// 처음 한 번만 실행 시킨다. = 준비 
	public void init(ServletConfig config) throws ServletException  {
		super.init(config);
		dao = new StudentDao();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		
		String view = "";
		String action = request.getParameter("action");
		if(action == null) {
			getServletContext().getRequestDispatcher("/scontrol?action=list").forward(request, response);
			
		}else{
			switch(action) {
				case "list" : view = list(request,response); break; 
				case "insert" : view = insert(request,response); break; 
				case "send" : view = "studentInsert.jsp"; 
			}
			
			getServletContext().getRequestDispatcher("/studentMVC/" + view).forward(request, response);
		}
	}
	
	//학생을 추가할 수 있도록 처리
	private String insert(HttpServletRequest request, HttpServletResponse response) {
		// 새로운 학생을 등록 한다. => 컨트롤러 -> dao의 Insert() 메서드를 호출한다.
		
		Student std = new Student(); 
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		std.setId(id);
		std.setName(name);
		std.setEmail(email);
		
		dao.insert(std); // DAO를 호출해서 DB에 연결한 후 자료 저장
		
		return "studentInsert.jsp";
	}
	
	//학생 정보를 볼 수 있도록 처리 
	private String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("studentAll", dao.findAll());
		return "studentInfo.jsp";
	}// end of service
	
}
