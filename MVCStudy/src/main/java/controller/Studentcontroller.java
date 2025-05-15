package controller;


import java.io.IOException;
import controller.dao.StudentDAO;
import controller.dto.Student;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/scontrol")
public class Studentcontroller extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	StudentDAO dao;
	int id = 0;
	public void init(ServletConfig config) throws ServletException  {
		super.init(config);
		dao = new StudentDAO();
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
				case "insertPage" : view = insertPage(request,response);break;
				case "insert": view = insert(request,response); break;
				case "detailPage" : view = detailPage(request, response); break;
				case "delete" : view = delete(request,response); break;
				case "updatePage" : view = updatePage(request,response); break;
				case "update" : view = update(request,response); break;
			}
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
	}
	
	private String insertPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("id", dao.nextId());
		return "/studentInsert.jsp";
	}

	private String update(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Student std = new Student(); 
		std.setId(id);
		std.setName(name);
		std.setEmail(email);
	
		dao.update(std);
		
		request.setAttribute("studnet", dao.select(id));
		return "/studentDetail.jsp";
	}

	private String updatePage(HttpServletRequest request, HttpServletResponse response) {
		id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("student", dao.select(id));
		return "/studentUpdate.jsp";
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		dao.delete(id);
		return "/scontrol?action=list";
	}

	private String detailPage(HttpServletRequest request, HttpServletResponse response) {
		id = Integer.parseInt(request.getParameter("id"));
		
		request.setAttribute("studnet", dao.select(id));
		return "/studentDetail.jsp";
	}

	private String insert(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Student std = new Student(); 
		std.setId(id);
		std.setName(name);
		std.setEmail(email);
	
		dao.insert(std);
		
		return "/scontrol?action=list";
	}

	//학생 정보를 볼 수 있도록 처리 
	private String list(HttpServletRequest request, HttpServletResponse response) {
		String searchText = request.getParameter("searchText");
		if(searchText.equals("")) {
			searchText = null;
		}
		if(searchText== null) {
			request.setAttribute("studentAll", dao.findAll());
			
		}else {
			request.setAttribute("studentAll", dao.findAll(searchText));			
		}
		return "/studentList.jsp";
	}// end of service
	
	
}
