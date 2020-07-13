package index;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.ProductService;

@SuppressWarnings("serial")
@WebServlet("/index.do")
public class IndexController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		// NEW ARRIVALS
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("pageNo", 1);
		searchMap.put("searchKeyword", "");
		searchMap.put("searchCategoryNo", 0);
		searchMap.put("sortType", "new");

		ProductService productService = new ProductService();
		Map<String, Object> newArrivalsListMap = productService.listProduct(searchMap);			
		request.setAttribute("newArrivalsListMap", newArrivalsListMap);
				
		// cartCount
		int cartCount = 0;		
		if(session.getAttribute("cartCount") != null) {
			cartCount = (int)session.getAttribute("cartCount");
		}	
		request.setAttribute("cartCount", cartCount);

		// wishCount
		int wishCount = 0;		
		if(session.getAttribute("wishCount") != null) {
			wishCount = (int)session.getAttribute("wishCount");
		}		
		request.setAttribute("wishCount", wishCount);
		
		nextPage = "/index.jsp";

		if (!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}

}