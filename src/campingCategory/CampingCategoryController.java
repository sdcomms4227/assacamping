package campingCategory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/campingCategoryServlet/*")
public class CampingCategoryController extends HttpServlet {

	CampingCategoryService campingCategoryService;
	CampingCategoryVO campingCategoryVO;

	@Override
	public void init() throws ServletException {
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

		List<CampingCategoryVO> campingCategoryList = null;

		if (action == null || action.contentEquals("/listCampingCategory.do")) {

			campingCategoryList = campingCategoryService.listCampingCategory();
			request.setAttribute("campingCategoryList", campingCategoryList);
			nextPage = "/campingAdmin/listCampingCategory.jsp";

		} else if (action.contentEquals("/addCampingCategory.do")) {

			String campingCategoryName = request.getParameter("campingCategoryName");
			campingCategoryVO.setCampingCategoryName(campingCategoryName);
			int result = campingCategoryService.insertCampingCategory(campingCategoryVO);

			String msg = "";
			if (result > 0) {
				msg = "새 카테고리를 추가하였습니다.";
			} else {
				msg = "오류가 발생했습니다.";
			}

			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('" + msg + "');");
			out.write("location.href='" + request.getContextPath() + "/campingCategoryServlet/listCampingCategory.do';");
			out.write("</script>");
			return;

		} else if (action.contentEquals("/updateCampingCategory.do")) {

			int campingCategoryNo = Integer.parseInt(request.getParameter("campingCategoryNo"));
			String campingCategoryName = request.getParameter("campingCategoryName");
			campingCategoryVO.setCampingCategoryNo(campingCategoryNo);
			campingCategoryVO.setCampingCategoryName(campingCategoryName);
			int result = campingCategoryService.updateCampingCategory(campingCategoryVO);

			String msg = "";
			if (result > 0) {
				msg = "카테고리 정보가 수정되었습니다.";
			} else {
				msg = "오류가 발생했습니다.";
			}

			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('" + msg + "');");
			out.write("location.href='" + request.getContextPath() + "/campingCategoryServlet/listCampingCategory.do';");
			out.write("</script>");

			return;

		} else if (action.contentEquals("/deleteCampingCategory.do")) {

			int campingCategoryNo = Integer.parseInt(request.getParameter("campingCategoryNo"));
			int result = campingCategoryService.deleteCampingCategory(campingCategoryNo);

			String msg = "";
			if (result > 0) {
				msg = "카테고리를 삭제하였습니다.";
			} else {
				msg = "오류가 발생했습니다.";
			}

			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('" + msg + "');");
			out.write("location.href='" + request.getContextPath() + "/campingCategoryServlet/listCampingCategory.do';");
			out.write("</script>");

			return;

		}

		if (!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}

	}

}
