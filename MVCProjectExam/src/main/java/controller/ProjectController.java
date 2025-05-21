package controller;

import jakarta.servlet.ServletConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.apache.catalina.connector.Response;

import controller.dao.AdminDAO;
import controller.dto.Admin;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/control")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO dao;
	int id = 0;
	
    public ProjectController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new AdminDAO();
		
	}
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		String action = request.getParameter("action");
		if(action == null) {
			getServletContext().getRequestDispatcher("/scontrol?action=loginPage").forward(request, response);
		}else {
			switch(action) {
			case "loginPage" : view = "/login.jsp"; break; 
			case "login" : view = login(request, response); break;
			}
		}
		getServletContext().getRequestDispatcher(view).forward(request, response);
		
	}
	
	private String login(HttpServletRequest request, HttpServletResponse response) {
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    Admin admin = dao.login(id, pw);

	    if (admin != null) {
	        int adminuid = admin.getUid();
	        System.out.println(adminuid);
	        // 쿠키 저장
	        Cookie cook = new Cookie("uid", adminuid + "");
	        cook.setMaxAge(60 * 60);
	        response.addCookie(cook);

	        return "/test.jsp";
	    } else {
	        return "/login.jsp"; // 로그인 실패 시
	    }
	}

}
