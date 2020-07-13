package faqAdmin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/faqAdminServlet/*")
public class FaqAdminController extends HttpServlet {
	
	FaqAdminService faqAdminService;
	FaqVO faqVO;
	String realPath;

	@Override
	public void init() throws ServletException {
		faqAdminService = new FaqAdminService();
		faqVO = new FaqVO();
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
		
		if(action == null || action.equals("/listFaq.do")) {			

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));

			Map<String, Object> faqListMap = faqAdminService.listFaq(searchMap);			
			request.setAttribute("faqListMap", faqListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/faqAdmin/listFaq.jsp";
			
		}else if(action.equals("/readFaq.do")) {

			setPagination(request);
			
			int faqNo = Integer.parseInt(request.getParameter("faqNo"));
			
			faqVO = faqAdminService.readFaq(faqNo);
			
			request.setAttribute("faqVO", faqVO);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/faqAdmin/readFaq.jsp";
			
		}else if(action.contentEquals("/addFaq.do")) {
						
			nextPage = "/faqAdmin/addFaq.jsp";
			
		}else if(action.equals("/insertFaq.do")) {
												
			String faqTitle = request.getParameter("faqTitle");
			String faqContent = request.getParameter("faqContent");
			
			faqVO.setFaqTitle(faqTitle);
			faqVO.setFaqContent(faqContent);
						
			int readNo = faqAdminService.insertFaq(faqVO);	
						
			nextPage = "/faqAdminServlet/readFaq.do?faqNo=" + readNo;
			
		}else if(action.equals("/modifyFaq.do")) {

			setPagination(request);
			
			int faqNo = Integer.parseInt(request.getParameter("faqNo"));

			faqVO = faqAdminService.readFaq(faqNo);

			request.setAttribute("faqVO", faqVO);
						
			nextPage = "/faqAdmin/modifyFaq.jsp";
			
		}else if(action.equals("/updateFaq.do")) {

			setPagination(request);
						
			int faqNo = Integer.parseInt(request.getParameter("faqNo"));
			String faqTitle = request.getParameter("faqTitle");
			String faqContent = request.getParameter("faqContent");
						
			faqVO.setFaqNo(faqNo);
			faqVO.setFaqTitle(faqTitle);
			faqVO.setFaqContent(faqContent);
			
			int result = faqAdminService.updateFaq(faqVO);
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "정상적으로 수정되었습니다.";
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/faqAdminServlet/readFaq.do?faqNo=" + faqNo;
			
		}else if(action.equals("/deleteFaq.do")) {

			setPagination(request);
			
			int faqNo = Integer.parseInt(request.getParameter("faqNo"));
			
			int result = faqAdminService.deleteFaq(faqNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/faqAdminServlet/listFaq.do";
		}
		
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}
	
	private void setPagination(HttpServletRequest request) {
		try {
			int pageNo = 1;
			if(request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			if(request.getAttribute("pageNo")==null) {
				request.setAttribute("pageNo", pageNo);
			}
			
			String searchKeyword = "";
			if(request.getParameter("searchKeyword")!=null) {
				searchKeyword = request.getParameter("searchKeyword");
			}
			if(request.getAttribute("searchKeyword")==null) {
				request.setAttribute("searchKeyword", searchKeyword);
			}
			
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}
}