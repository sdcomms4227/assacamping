package comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@SuppressWarnings("serial")
@WebServlet("/comment/*")
public class CommentController extends HttpServlet {

	CommentService commentService;
	CommentVO commentVO;

	public void init() throws ServletException {
		commentService = new CommentService();
		commentVO = new CommentVO();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	private void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();

		JSONParser jsonParser = new JSONParser();
		JSONObject commentObject = null;
		String action = req.getPathInfo();
		String info = null;

		if (action == null || action.equals("/listComment.do")) {
			try {
				commentObject = (JSONObject) jsonParser.parse(info);
				int boardCategoryNo = Integer.parseInt((String) commentObject.get("boardCategoryNo"));
				int boardNo = Integer.parseInt((String) commentObject.get("boardNo"));
				List<CommentVO> commentList = commentService.getCommentList(boardCategoryNo, boardNo);
				req.setAttribute("commentList", commentList);
			} catch (ParseException e) {
				System.out.println("doHandle()메소드 listComment.do 에서 예외발생 : " + e.toString());
			}
			 
		} else if (action.equals("/insertComment.do")) {
			info = req.getParameter("commentInfo");
			try {
				commentObject = (JSONObject) jsonParser.parse(info);
				int boardCategoryNo = Integer.parseInt((String) commentObject.get("boardCategoryNo"));
				int boardNo = Integer.parseInt((String) commentObject.get("boardNo"));
				String userId = (String) commentObject.get("userId");
				String userName = (String) commentObject.get("userName");
				String commentContent = (String) commentObject.get("commentContent");

				commentVO.setBoardCategoryNo(boardCategoryNo);
				commentVO.setBoardNo(boardNo);
				commentVO.setUserId(userId);
				commentVO.setUserName(userName);
				commentVO.setCommentContent(commentContent);

				int result = commentService.insertComment(commentVO);

				if (result == 1) {
					CommentVO commentVO2 = new CommentVO();

					commentVO2 = commentService.getLastComment();

					int returnNo = commentVO2.getCommentNo();
					String returnName = commentVO2.getUserName();
					String returnContent = commentVO2.getCommentContent();
					Timestamp returnDate = commentVO2.getCommentWriteDate();

					SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
					String formattedDate = sdf.format(returnDate);

					JSONObject returnObject = new JSONObject();

					returnObject.put("commentNo", returnNo);
					returnObject.put("userName", returnName);
					returnObject.put("commentContent", returnContent);
					returnObject.put("commentDate", formattedDate);

					out.print(returnObject.toString());
				}
			} catch (ParseException e) {
				System.out.println("doHandle()메소드 insertComment.do 에서 예외발생 : " + e.toString());
			}
		} else if (action.equals("/deleteComment.do")) {
			info = req.getParameter("commentDeleteInfo");
			try {
				commentObject = (JSONObject) jsonParser.parse(info);

				int commentNo = Integer.parseInt((String) commentObject.get("commentNo"));
				String userId = (String) commentObject.get("userId");

				int result = commentService.deleteComment(commentNo, userId);

				if (result == 1) {
					out.print("success");
				} else {
					out.print("fail");
				}
			} catch (Exception e) {
				System.out.println("doHandle() 메소드 deleteComment.do 에서 예외발생 : " + e.toString());
			}
		}

	}
}
