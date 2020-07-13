package qnaAdmin;

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
import qna.QnaVO;

@SuppressWarnings("serial")
@WebServlet("/qnaAdminServlet/*")
public class QnaAdminController extends HttpServlet {

	QnaAdminService qnaAdminService;
	QnaVO qnaVO;

	@Override
	public void init() throws ServletException {
		qnaAdminService = new QnaAdminService();
		qnaVO = new QnaVO();
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
		
		if(action == null || action.equals("/listQna.do")) {

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("answerCheck", request.getAttribute("answerCheck"));

			Map<String, Object> qnaListMap = qnaAdminService.listQna(searchMap);			
			request.setAttribute("qnaListMap", qnaListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/qnaAdmin/listQna.jsp";
			
		}else if(action.equals("/readQna.do")) {

			setPagination(request);
			
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			
			Map<String, Object> qnaMap = qnaAdminService.readQna(qnaNo);			
			QnaVO qnaVO = (QnaVO)qnaMap.get("qnaVO");			
			ProductVO productVO = (ProductVO)qnaMap.get("productVO");
			
			request.setAttribute("qnaVO", qnaVO);
			request.setAttribute("productVO", productVO);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/qnaAdmin/readQna.jsp";
			
		}else if(action.equals("/answerQna.do")) {

			setPagination(request);

			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));

			Map<String, Object> qnaMap = qnaAdminService.readQna(qnaNo);			
			QnaVO qnaVO = (QnaVO)qnaMap.get("qnaVO");			
			ProductVO productVO = (ProductVO)qnaMap.get("productVO");
			
			request.setAttribute("qnaVO", qnaVO);
			request.setAttribute("productVO", productVO);
			
			nextPage = "/qnaAdmin/answerQna.jsp";
			
		}else if(action.equals("/updateQna.do")) {

			setPagination(request);
			
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			String qnaAnswer = request.getParameter("qnaAnswer");
			
			qnaVO.setQnaNo(qnaNo);
			qnaVO.setQnaAnswer(qnaAnswer);
			
			int result = qnaAdminService.updateQna(qnaVO);
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "답변이 완료되었습니다.";		
				nextPage = "/qnaAdminServlet/readQna.do?qnaNo=" + qnaNo;
			}else {
				alertMsg = "오류가 발생했습니다.";
				nextPage = "/qnaAdminServlet/readQna.do?qnaNo=" + qnaNo;
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
		}else if(action.equals("/deleteQna.do")) {

			setPagination(request);

			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			
			int result = qnaAdminService.deleteQna(qnaNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";				
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/qnaAdminServlet/listQna.do";
			
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
