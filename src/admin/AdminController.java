package admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderAdmin.OrderAdminService;
import productAdmin.ProductAdminService;
import userAdmin.UserAdminService;

@SuppressWarnings("serial")
@WebServlet("/adminServlet/*")
public class AdminController extends HttpServlet {

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

		String action = request.getPathInfo();
		System.out.println("action: " + action);

		if (action == null || action.equals("/admin.do")) {
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", 1);
			searchMap.put("searchKeyword", "");
			searchMap.put("searchCategoryNo", 0);

			OrderAdminService orderAdminService = new OrderAdminService();
			Map<String, Object> orderListMap = orderAdminService.listOrder(searchMap);		
			request.setAttribute("orderList", orderListMap.get("orderList"));

			ProductAdminService productAdminService = new ProductAdminService();
			Map<String, Object> productListMap = productAdminService.listProduct(searchMap);		
			request.setAttribute("productList", productListMap.get("productList"));
			
			UserAdminService userAdminService = new UserAdminService();
			Map<String, Object> userListMap = userAdminService.listUser(searchMap);
			request.setAttribute("userList", userListMap.get("userList"));
			
			nextPage = "/admin/dashBoard.jsp";
		}

		if (!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}

}