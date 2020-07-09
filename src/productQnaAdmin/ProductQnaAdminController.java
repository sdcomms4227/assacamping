package productQnaAdmin;

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
import productQna.ProductQnaVO;

@SuppressWarnings("serial")
@WebServlet("/proQnaAdm/*")
public class ProductQnaAdminController extends HttpServlet {

	ProductQnaAdminService productQnaAdminService;
	ProductQnaVO productQnaVO;

	@Override
	public void init() throws ServletException {
		productQnaAdminService = new ProductQnaAdminService();
		productQnaVO = new ProductQnaVO();
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
		
		if(action == null || action.equals("/listProductQna.do")) {

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("answerCheck", request.getAttribute("answerCheck"));

			Map<String, Object> productQnaListMap = productQnaAdminService.listProductQna(searchMap);			
			request.setAttribute("productQnaListMap", productQnaListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/productQnaAdmin/listProductQna.jsp";
			
		}else if(action.equals("/readProductQna.do")) {

			setPagination(request);
			
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			
			Map<String, Object> productQnaMap = productQnaAdminService.readProductQna(qnaNo);			
			ProductQnaVO productQnaVO = (ProductQnaVO)productQnaMap.get("productQnaVO");			
			ProductVO productVO = (ProductVO)productQnaMap.get("productVO");
			
			request.setAttribute("productQnaVO", productQnaVO);
			request.setAttribute("productVO", productVO);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/productQnaAdmin/readProductQna.jsp";
			
		}else if(action.equals("/answerProductQna.do")) {

			setPagination(request);

			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));

			Map<String, Object> productQnaMap = productQnaAdminService.readProductQna(qnaNo);			
			ProductQnaVO productQnaVO = (ProductQnaVO)productQnaMap.get("productQnaVO");			
			ProductVO productVO = (ProductVO)productQnaMap.get("productVO");
			
			request.setAttribute("productQnaVO", productQnaVO);
			request.setAttribute("productVO", productVO);
			
			nextPage = "/productQnaAdmin/answerProductQna.jsp";
			
		}else if(action.equals("/updateProductQna.do")) {

			setPagination(request);
			
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			String qnaAnswer = request.getParameter("qnaAnswer");
			
			productQnaVO.setQnaNo(qnaNo);
			productQnaVO.setQnaAnswer(qnaAnswer);
			
			int result = productQnaAdminService.updateProductQna(productQnaVO);
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "답변이 완료되었습니다.";		
				nextPage = "/proQnaAdm/readProductQna.do?qnaNo=" + qnaNo;
			}else {
				alertMsg = "오류가 발생했습니다.";
				nextPage = "/proQnaAdm/readProductQna.do?qnaNo=" + qnaNo;
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
		}else if(action.equals("/deleteProductQna.do")) {

			setPagination(request);

			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			
			int result = productQnaAdminService.deleteProductQna(qnaNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";				
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/proQnaAdm/listProductQna.do";
			
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

			String answerCheck = "";
			if (request.getParameter("answerCheck") != null) {
				answerCheck = request.getParameter("answerCheck");
			}
			if (request.getAttribute("answerCheck") == null) {
				request.setAttribute("answerCheck", answerCheck);
			}
			
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}
}
