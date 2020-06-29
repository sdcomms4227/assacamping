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

@SuppressWarnings("serial")
@WebServlet("/camp/*")
public class CampingController extends HttpServlet {
	
	CampingService campingService;
	CampingVO campingVO;

	@Override
	public void init() throws ServletException {
		campingService = new CampingService();
		campingVO = new CampingVO();
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
		
		List<CampingVO> campingList = null;
		
		if(action == null || action.contentEquals("/listCamping.do")) {			

			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");

			int section = Integer.parseInt((_section == null) ? "1" : _section);
			int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);

			Map pagingMap = new HashMap();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);

			Map campingMap = campingService.listCamping(pagingMap);

			campingMap.put("section", section);
			campingMap.put("pageNum", pageNum);

			request.setAttribute("campingMap", campingMap);
						
			nextPage = "/camping/listCamping.jsp";
			
//		}else if(action.contentEquals("/addCamping.do")) {
//			
//			String campingName = request.getParameter("campingName");
//			campingVO.setCampingName(campingName);
//			int result = campingService.addCamping(campingVO);
//			
//			String msg = "";
//			if(result > 0) {
//				msg = "새 카테고리를 추가하였습니다.";
//			}else {
//				msg = "오류가 발생했습니다.";
//			}
//			
//			PrintWriter out = response.getWriter();
//			out.write("<script>");
//			out.write("alert('" + msg + "');");
//			out.write("location.href='" + request.getContextPath() + "/brdCategory/listCamping.do';");
//			out.write("</script>");
//			return;
//			
//		}else if(action.contentEquals("/updateCamping.do")) {
//
//			int campingNo = Integer.parseInt(request.getParameter("campingNo"));	
//			String campingName = request.getParameter("campingName");				
//			campingVO.setCampingNo(campingNo);
//			campingVO.setCampingName(campingName);
//			int result = campingService.updateCamping(campingVO);
//			
//			String msg = "";
//			if(result > 0) {
//				msg = "카테고리 정보가 수정되었습니다.";
//			}else {
//				msg = "오류가 발생했습니다.";
//			}
//			
//			PrintWriter out = response.getWriter();
//			out.write("<script>");
//			out.write("alert('" + msg + "');");
//			out.write("location.href='" + request.getContextPath() + "/brdCategory/listCamping.do';");
//			out.write("</script>");
//			
//			return;
//			
//		}else if(action.contentEquals("/deleteCamping.do")) {
//			
//			int campingNo = Integer.parseInt(request.getParameter("campingNo"));				
//			int result = campingService.deleteCamping(campingNo);
//
//			String msg = "";
//			if(result > 0) {
//				msg = "카테고리를 삭제하였습니다.";
//			}else {
//				msg = "오류가 발생했습니다.";
//			}
//			
//			PrintWriter out = response.getWriter();
//			out.write("<script>");
//			out.write("alert('" + msg + "');");
//			out.write("location.href='" + request.getContextPath() + "/brdCategory/listCamping.do';");
//			out.write("</script>");
//			
//			return;
			
		}
		
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}
	
}
