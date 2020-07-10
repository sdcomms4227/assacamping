package productReviewAdmin;

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
import productReview.ProductReviewVO;

@SuppressWarnings("serial")
@WebServlet("/proReviewAdm/*")
public class ProductReviewAdminController extends HttpServlet {

	ProductReviewAdminService productReviewAdminService;
	ProductReviewVO productReviewVO;

	@Override
	public void init() throws ServletException {
		productReviewAdminService = new ProductReviewAdminService();
		productReviewVO = new ProductReviewVO();
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
		
		if(action == null || action.equals("/listProductReview.do")) {

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("answerCheck", request.getAttribute("answerCheck"));

			Map<String, Object> productReviewListMap = productReviewAdminService.listProductReview(searchMap);			
			request.setAttribute("productReviewListMap", productReviewListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/productReviewAdmin/listProductReview.jsp";
			
		}else if(action.equals("/readProductReview.do")) {

			setPagination(request);
			
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			
			Map<String, Object> productReviewMap = productReviewAdminService.readProductReview(reviewNo);			
			ProductReviewVO productReviewVO = (ProductReviewVO)productReviewMap.get("productReviewVO");			
			ProductVO productVO = (ProductVO)productReviewMap.get("productVO");
			
			request.setAttribute("productReviewVO", productReviewVO);
			request.setAttribute("productVO", productVO);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/productReviewAdmin/readProductReview.jsp";
			
		}else if(action.equals("/deleteProductReview.do")) {

			setPagination(request);

			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			
			int result = productReviewAdminService.deleteProductReview(reviewNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";				
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/proReviewAdm/listProductReview.do";
			
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
