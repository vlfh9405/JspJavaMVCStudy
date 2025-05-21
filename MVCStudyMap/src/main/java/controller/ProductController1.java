package controller;

import java.io.IOException;

import controller.dao.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/pcontrol1")
public class ProductController1 extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;
	//생성자에 의해서 생성, 모든 사용자 요청에 대해 동일한 인스턴스(객체)를 사용
	ProductService service;
	public ProductController1(ProductService service) {
		super();
		 service = new ProductService();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 클라이언트 요청 구분 -> 처리 메서드 호출, 결과 -> view 이동 
		String view ="";
		String action = request.getParameter("action");
		if(action == null) {
			getServletContext().getRequestDispatcher("./pcontrol?action=list").forward(request, response);
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
		return "/productInfo.jsp";
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", service.findAll());
		return "/productList.jsp";
	}
	
	
	
	
	
	
}
