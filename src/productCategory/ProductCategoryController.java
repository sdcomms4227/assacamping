package productCategory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// /productCategory/listProductCategories.do 로 요청
@SuppressWarnings("serial")
@WebServlet("/productCategory/*")
public class ProductCategoryController extends HttpServlet {
	ProductCategoryService productCategoryService;
	ProductCategoryVO productCategoryVO;
	
	public void init(ServletConfig config) throws ServletException {
		productCategoryService = new ProductCategoryService();
		productCategoryVO = new ProductCategoryVO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session;
		
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		try {
			List<ProductCategoryVO> productCategoryList = new ArrayList<>();
			if(action == null) {
				productCategoryList = productCategoryService.listProductCategories();
				request.setAttribute("productCategoriesList", productCategoryList);
				nextPage = "/productCategory/productCategoryMng.jsp";
			} else if(action.equals("/listProductCategories.do")) {
				productCategoryList = productCategoryService.listProductCategories();
				request.setAttribute("productCategoriesList", productCategoryList);
				nextPage = "/productCategory/productCategoryMng.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
