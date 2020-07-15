package reviewAdmin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductVO;
import review.ReviewVO;

@SuppressWarnings("serial")
@WebServlet("/reviewAdminServlet/*")
public class ReviewAdminController extends HttpServlet {

	ReviewAdminService reviewAdminService;
	ReviewVO reviewVO;

	@Override
	public void init() throws ServletException {
		reviewAdminService = new ReviewAdminService();
		reviewVO = new ReviewVO();
	}

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
		
		if(action == null || action.equals("/listReview.do")) {

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("answerCheck", request.getAttribute("answerCheck"));

			Map<String, Object> reviewListMap = reviewAdminService.listReview(searchMap);			
			request.setAttribute("reviewListMap", reviewListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/reviewAdmin/listReview.jsp";
			
		}else if(action.equals("/readReview.do")) {

			setPagination(request);
			
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			
			Map<String, Object> reviewMap = reviewAdminService.readReview(reviewNo);			
			ReviewVO reviewVO = (ReviewVO)reviewMap.get("reviewVO");			
			ProductVO productVO = (ProductVO)reviewMap.get("productVO");
			
			request.setAttribute("reviewVO", reviewVO);
			request.setAttribute("productVO", productVO);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/reviewAdmin/readReview.jsp";
			
		}else if(action.equals("/deleteReview.do")) {

			setPagination(request);

			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			
			int result = reviewAdminService.deleteReview(reviewNo, productNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";				
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/reviewAdminServlet/listReview.do";
			
		}
				
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}

	private void setPagination(HttpServletRequest request) {
		try {
			int pageNo = 1;
			if (request.getParameter("pageNo") != null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			if (request.getAttribute("pageNo") == null) {
				request.setAttribute("pageNo", pageNo);
			}

			String searchKeyword = "";
			if (request.getParameter("searchKeyword") != null) {
				searchKeyword = request.getParameter("searchKeyword");
			}
			if (request.getAttribute("searchKeyword") == null) {
				request.setAttribute("searchKeyword", searchKeyword);
			}			
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}
}
