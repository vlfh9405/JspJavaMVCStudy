package controller;

import java.io.IOException;

import controller.dao.ProductService;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/pcontrol")
public class ProductController extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;
	
	ProductService service;

	// 기본 생성자에서 service 초기화
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		
		service = new ProductService();
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String view ="";
		String action = request.getParameter("action");
		
		if(action == null) {
			// redirect로 변경하는 게 좋음 (무한 포워딩 방지)
			response.sendRedirect(request.getContextPath() + "/pcontrol?action=list");
			return;
		}else {
			switch(action) {
			case "list" : view = list(request, response); break; 
			case "info" :  view = info(request, response); break; 
			case "delete" : view = delete(request, response); break; 
			case "send" : view = "/sendTest.jsp"; break;
 			}
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", service.delete(request.getParameter("id")));
		return "/productList.jsp";
	}

	private String info(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("p", service.find(request.getParameter("id")));
		return "/productInto.jsp";
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", service.findAll());
		return "/productList.jsp";
	}
}
