package camping;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import campingCategory.CampingCategoryService;
import campingCategory.CampingCategoryVO;

@SuppressWarnings("serial")
@WebServlet("/camp/*")
public class CampingController extends HttpServlet {
	
	CampingService campingService;
	CampingVO campingVO;	
	CampingCategoryService campingCategoryService;
	CampingCategoryVO campingCategoryVO;

	@Override
	public void init() throws ServletException {
		campingService = new CampingService();
		campingVO = new CampingVO();
		campingCategoryService = new CampingCategoryService();
		campingCategoryVO = new CampingCategoryVO();
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
		
		if(action == null || action.equals("/listCamping.do")) {			

			setPagination(request, response);

			Map<String, Integer> pagingMap = new HashMap<String, Integer>();
			pagingMap.put("section", (int)request.getAttribute("section"));
			pagingMap.put("pageNo", (int)request.getAttribute("pageNo"));

			Map<String, Object> campingListMap = campingService.listCamping(pagingMap);
			
			request.setAttribute("campingListMap", campingListMap);
						
			nextPage = "/camping/listCamping.jsp";
			
		}else if(action.equals("/readCamping.do")) {

			setPagination(request, response);
			
			int campingNo = 0;
			
			if(request.getAttribute("campingNo")!=null) {
				campingNo = (int)request.getAttribute("campingNo");
			}else {
				campingNo = Integer.parseInt(request.getParameter("campingNo"));
			}
			
			Map<String, Object> campingItemMap = campingService.readCamping(campingNo);

			request.setAttribute("campingItemMap", campingItemMap);
			
			nextPage = "/camping/readCamping.jsp";
			
		}else if(action.contentEquals("/writeCamping.do")) {
			
			List<CampingCategoryVO> campingCategoryList = campingCategoryService.listCampingCategory();
			
			request.setAttribute("campingCategoryList", campingCategoryList);
			
			nextPage = "/camping/writeCamping.jsp";
			
		}else if(action.equals("/insertCamping.do")) {
			
			CampingVO campingVO = new CampingVO();
			
			int campingCategoryNo = Integer.parseInt(request.getParameter("campingCategoryNo"));
			String campingContent = request.getParameter("campingContent");
			String campingTitle = request.getParameter("campingTitle");
			String userId = request.getParameter("userId");
			
			campingVO.setCampingCategoryNo(campingCategoryNo);
			campingVO.setCampingContent(campingContent);
			campingVO.setCampingTitle(campingTitle);
			campingVO.setUserId(userId);
			
			int readNo = campingService.insertCamping(campingVO);
			
			request.setAttribute("campingNo", readNo);
			
			nextPage = "/camp/readCamping.do";
			
		}else if(action.equals("/modifyCamping.do")) {

			setPagination(request, response);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));

			Map<String, Object> campingItemMap = campingService.readCamping(campingNo);
			CampingVO campingVO = (CampingVO)campingItemMap.get("campingVO");			
			request.setAttribute("campingVO", campingVO);

			List<CampingCategoryVO> campingCategoryList = campingCategoryService.listCampingCategory();			
			request.setAttribute("campingCategoryList", campingCategoryList);
			
			nextPage = "/camping/modifyCamping.jsp";
			
		}else if(action.equals("/updateCamping.do")) {

			setPagination(request, response);
			
			CampingVO campingVO = new CampingVO();
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));
			String campingTitle = request.getParameter("campingTitle");
			String campingContent = request.getParameter("campingContent");
			String userId = request.getParameter("userId");
			int campingCategoryNo = Integer.parseInt(request.getParameter("campingCategoryNo"));
			
			campingVO.setCampingNo(campingNo);
			campingVO.setCampingTitle(campingTitle);
			campingVO.setCampingContent(campingContent);
			campingVO.setUserId(userId);
			campingVO.setCampingCategoryNo(campingCategoryNo);
			
			campingService.updateCamping(campingVO);
			
			request.setAttribute("campingNo", campingNo);
			
			nextPage = "/camp/readCamping.do";
			
		}else if(action.equals("/deleteCamping.do")) {

			setPagination(request, response);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));
			
			campingService.deleteCamping(campingNo);
			
			nextPage = "/camp/listCamping.do";
			
		}else if(action.equals("/replyCamping.do")) {
			
			setPagination(request, response);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));

			Map<String, Object> campingItemMap = campingService.readCamping(campingNo);
			
			request.setAttribute("campingItemMap", campingItemMap);
			
			nextPage = "/camping/replyCamping.jsp";
			
		}else if(action.equals("/insertReplyCamping.do")) {
			
			CampingVO campingVO = new CampingVO();
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));
			String campingTitle = request.getParameter("campingTitle");
			String campingContent = request.getParameter("campingContent");
			String userId = request.getParameter("userId");
			int campingRe_ref = Integer.parseInt(request.getParameter("campingRe_ref"));
			int campingRe_lev = Integer.parseInt(request.getParameter("campingRe_lev"));
			int campingRe_seq = Integer.parseInt(request.getParameter("campingRe_seq"));
			int campingCategoryNo = Integer.parseInt(request.getParameter("campingCategoryNo"));
			
			campingVO.setCampingNo(campingNo);
			campingVO.setCampingTitle(campingTitle);
			campingVO.setCampingContent(campingContent);
			campingVO.setUserId(userId);
			campingVO.setCampingRe_ref(campingRe_ref);
			campingVO.setCampingRe_lev(campingRe_lev);
			campingVO.setCampingRe_seq(campingRe_seq);
			campingVO.setCampingCategoryNo(campingCategoryNo);
			
			int readNo = campingService.insertReplyCamping(campingVO);
			
			request.setAttribute("campingNo", readNo);
			
			nextPage = "/camp/readCamping.do";
			
		}
		
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}
	
	public void setPagination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _section = request.getParameter("section");
		String _pageNo = request.getParameter("pageNo");

		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNo = Integer.parseInt((_pageNo == null) ? "1" : _pageNo);

		if(request.getAttribute("section")==null) {
			request.setAttribute("section", section);
		}
		if(request.getAttribute("pageNo")==null) {
			request.setAttribute("pageNo", pageNo);
		}
	}
	
}
