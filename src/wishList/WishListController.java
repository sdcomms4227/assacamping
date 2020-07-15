package wishList;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/wishListServlet/*")
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String nextPage = "";
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();

		System.out.println("action:" + action);

		if (action == null || action.equals("/wishList.do")) {

			String userId = (String) session.getAttribute("userId");
			Map<String, Object> wListMap = wishListService.getWishList(userId);
			request.setAttribute("wListMap", wListMap);

			nextPage = "/order/wishList.jsp";

		} else if (action.equals("/addWish.do")) {

			String userId = (String) session.getAttribute("userId");
			int productNo = Integer.parseInt((String) request.getParameter("productNo"));

			int result = wishListService.addWishList(userId, productNo);

			if (result == 1) {
				pw.print("<script>");
				pw.print("	alert('위시리스트 추가 완료');");
				pw.print("	location.href='" + contextPath + "/wishListServlet/wishList.do';");
				pw.print("</script>");
			} else if (result == 0) {
				pw.print("<script>");
				pw.print("	alert('위시리스트 추가 실패');");
				pw.print("</script>");
			} else if (result == 2) {
				pw.print("<script>");
				pw.print("	alert('이미 추가된 위시리스트 입니다.');");
				pw.print("	location.href='" + contextPath + "/wishListServlet/wishList.do';");
				pw.print("</script>");
			}

			int wishCount = 0;
			wishCount = wishListService.wishTotalCount(userId);
			session.setAttribute("wishCount", wishCount);
			
			return;

		} else if (action.equals("/deleteWish.do")) {

			String userId = (String) session.getAttribute("userId");
			int wishNo = Integer.parseInt((String) request.getParameter("wishNo"));
			int result = wishListService.deleteWish(wishNo);
			
			if (result > 0) {
				pw.print("<script>");
				pw.print("	alert('정상적으로 삭제되었습니다.');");
				pw.print("	location.href='" + contextPath + "/wishListServlet/wishList.do';");
				pw.print("</script>");
			} else {
				pw.print("<script>");
				pw.print("	alert('오류가 발생했습니다.');");
				pw.print("	location.href='" + contextPath + "/wishListServlet/wishList.do';");
				pw.print("</script>");
			}

			int wishCount = 0;
			wishCount = wishListService.wishTotalCount(userId);
			session.setAttribute("wishCount", wishCount);
			
			return;
			
		} else if (action.equals("/deleteAllWish.do")) {
			String userId = (String) session.getAttribute("userId");
			int result = wishListService.deleteAllWish(userId);
			
			if (result > 0) {
				pw.print("<script>");
				pw.print("	alert('위시리스트가 전부 삭제되었습니다.');");
				pw.print("	location.href='" + contextPath + "/wishListServlet/wishList.do';");
				pw.print("</script>");
			} else {
				pw.print("<script>");
				pw.print("	alert('오류가 발생했습니다.');");
				pw.print("	location.href='" + contextPath + "/wishListServlet/wishList.do';");
				pw.print("</script>");
			}

			int wishCount = 0;
			wishCount = wishListService.wishTotalCount(userId);
			session.setAttribute("wishCount", wishCount);
			
			return;
		}

		if (!nextPage.equals("")) {
			RequestDispatcher dispath = request.getRequestDispatcher(nextPage);
			dispath.forward(request, response);
		}
	}
}
