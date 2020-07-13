package wishList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.ProductService;
import product.ProductVO;

@SuppressWarnings("serial")
@WebServlet("/wishlist/*")
public class WishListController extends HttpServlet {

	WishListService wishListService;
	WishListVO wishListVO;
	ProductVO productVO;
	ProductService productService;

	public void init() throws ServletException {
		wishListService = new WishListService();
		wishListVO = new WishListVO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String nextPage = "";
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		
		System.out.println("action:" + action);

		if (action == null || action.equals("/wishList.do")) {
			
			String userId = (String) session.getAttribute("userId");
			Map<String, Object> wListMap = wishListService.getWishList(userId);
			request.setAttribute("wListMap", wListMap);
			
			nextPage = "/wishList.jsp";

		} else if (action.equals("addWish.do")) {
			
			String userId = (String) session.getAttribute("userId");
			int productNo = Integer.parseInt((String) request.getParameter("productNo"));

			int result = wishListService.addWishList(userId, productNo);

			if (result == 1) {
				pw.print("<script>" + "  alert('장바구니 담기 완료');" + "</script>");
			} else {
				pw.print("<script>" + "  alert('장바구니 담기 실패');" + "</script>");
			}
			
		} else if (action.equals("deleteWish.do")) {
			
			int wishNo = Integer.parseInt(request.getParameter("wishNo"));
			int result = wishListService.deleteWish(wishNo);
			String alertMsg = "";
			if (result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";
			} else {
				alertMsg = "오류가 발생했습니다.";
			}
			request.setAttribute("alertMsg", alertMsg);
			nextPage = "/wishlist/wishList.do";
			
		}

		if (!nextPage.equals("")) {
			RequestDispatcher dispath = request.getRequestDispatcher(nextPage);
			dispath.forward(request, response);
		}
	}
}
