package board.category;

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
@WebServlet("/brdCate/*")
public class BoardCategoryController extends HttpServlet {
	
	BoardCategoryService boardCategoryService;
	BoardCategoryVO boardCategoryVO;

	@Override
	public void init() throws ServletException {
		boardCategoryService = new BoardCategoryService();
		boardCategoryVO = new BoardCategoryVO();
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
		System.out.println("action : " + action);
		
		List<BoardCategoryVO> boardCategoryList = null;
		
		if(action != null){
			if(action.contentEquals("/listBoardCategory.do")) {			
				
				boardCategoryList = boardCategoryService.listBoardCategory();				
				request.setAttribute("boardCategoryList",  boardCategoryList);				
				nextPage = "/boardCategory/listBoardCategory.jsp";
				
			}else if(action.contentEquals("/addBoardCategory.do")) {
				
				String boardCategoryName = request.getParameter("boardCategoryName");
				boardCategoryVO.setBoardCategoryName(boardCategoryName);
				int result = boardCategoryService.addBoardCategory(boardCategoryVO);
				
				String msg = "";
				if(result > 0) {
					msg = "새 카테고리를 추가하였습니다.";
				}else {
					msg = "오류가 발생했습니다.";
				}
				
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert('" + msg + "');");
				out.write("location.href='" + request.getContextPath() + "/brdCate/listBoardCategory.do';");
				out.write("</script>");
				return;
				
			}else if(action.contentEquals("/updateBoardCategory.do")) {

				int boardCategoryNo = Integer.parseInt(request.getParameter("boardCategoryNo"));	
				String boardCategoryName = request.getParameter("boardCategoryName");				
				boardCategoryVO.setBoardCategoryNo(boardCategoryNo);
				boardCategoryVO.setBoardCategoryName(boardCategoryName);
				int result = boardCategoryService.updateBoardCategory(boardCategoryVO);
				
				String msg = "";
				if(result > 0) {
					msg = "카테고리 정보가 수정되었습니다.";
				}else {
					msg = "오류가 발생했습니다.";
				}
				
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert('" + msg + "');");
				out.write("location.href='" + request.getContextPath() + "/brdCate/listBoardCategory.do';");
				out.write("</script>");
				
				return;
				
			}else if(action.contentEquals("/deleteBoardCategory.do")) {
				
				int boardCategoryNo = Integer.parseInt(request.getParameter("boardCategoryNo"));				
				int result = boardCategoryService.deleteBoardCategory(boardCategoryNo);

				String msg = "";
				if(result > 0) {
					msg = "카테고리를 삭제하였습니다.";
				}else {
					msg = "오류가 발생했습니다.";
				}
				
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert('" + msg + "');");
				out.write("location.href='" + request.getContextPath() + "/brdCate/listBoardCategory.do';");
				out.write("</script>");
				
				return;
				
			}
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}
	
	
}






















