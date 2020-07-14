package comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@SuppressWarnings("serial")
@WebServlet("/commentServlet/*")
public class CommentController extends HttpServlet {

	CommentService commentService;
	CommentVO commentVO;

	public void init() throws ServletException {
		commentService = new CommentService();
		commentVO = new CommentVO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();

		JSONParser jsonParser = new JSONParser();
		JSONObject commentObject = null;
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		String info = null;
		String nextPage = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		if (action != null) {
			if (action.equals("/listComment.do")) {
				try {
					info = request.getParameter("commentListInfo");
					commentObject = (JSONObject) jsonParser.parse(info);
					int eventNo = Integer.parseInt((String) commentObject.get("eventNo"));

					List<CommentVO> commentList = commentService.getCommentList(eventNo);
					
				
					if (commentList.size() > 0) {
						JSONArray jsonArray = new JSONArray();
						for (int i = 0; i < commentList.size(); i++) {
							JSONObject returnObject = new JSONObject();
							
							returnObject.put("commentNo", Integer.toString(commentList.get(i).getCommentNo()));
							returnObject.put("userId",commentList.get(i).getUserId());
							returnObject.put("userName", commentList.get(i).getUserName());
							returnObject.put("commentContent", commentList.get(i).getCommentContent());
							returnObject.put("commentRe_lev", Integer.toString(commentList.get(i).getCommentRe_lev()));
							
							String formattedDate = sdf.format(commentList.get(i).getCommentWriteDate());
							returnObject.put("commentWriteDate", formattedDate);

							jsonArray.add(returnObject);
						}
						JSONObject result = new JSONObject();
						result.put("jsonArray", jsonArray);
						
						response.setContentType("text/html; charset=utf-8");
						out.print(result.toString());
						out.flush();
						out.close();						
					}

				} catch (ParseException e) {
					e.printStackTrace();
				}


			} else if (action.equals("/insertComment.do")) {

				try {
					info = request.getParameter("commentInfo");
					commentObject = (JSONObject) jsonParser.parse(info);
					int eventNo = Integer.parseInt((String) commentObject.get("eventNo"));
					String userId = (String) commentObject.get("userId");
					String userName = (String) commentObject.get("userName");
					String commentContent = (String) commentObject.get("commentContent");

					
					commentVO.setEventNo(eventNo);
					commentVO.setUserId(userId);
					commentVO.setUserName(userName);
					commentVO.setCommentContent(commentContent);

					commentService.insertComment(commentVO);

				} catch (ParseException e) {
					System.out.println("doHandle()메소드 insertComment.do 에서 예외발생 : " + e.toString());
				}
			} else if (action.equals("/deleteComment.do")) {

				try {
					info = request.getParameter("commentDeleteInfo");
					commentObject = (JSONObject) jsonParser.parse(info);

					int commentNo = Integer.parseInt((String) commentObject.get("commentNo"));
					String userId = (String) commentObject.get("userId");

					int result = commentService.deleteComment(commentNo, userId);

					if (result == 1) {
						out.print("success");
					} else {
						out.print("fail");
					}
					return;

				} catch (Exception e) {
					System.out.println("doHandle() 메소드 deleteComment.do 에서 예외발생 : " + e.toString());
				}
			} else if (action.equals("/updateComment.do")) {
				
				try {
				
					info = request.getParameter("commentUpdateInfo");
					commentObject = (JSONObject) jsonParser.parse(info);
					
					int commentNo = Integer.parseInt((String) commentObject.get("commentNo"));
					String userId = (String) commentObject.get("userId");
					String updateContent = (String) commentObject.get("updateContent");
					
					int result = commentService.updateComment(commentNo, userId, updateContent);
					
					if (result == 1) {
						out.print("success");
					} else {
						out.print("fail");
					}
					
				} catch (Exception e) {
					System.out.println("doHandle() 메소드 updateComment.do 에서 예외발생 : " + e.toString());
				}
				
			} else if (action.equals("/replyComment.do")) {
				
				try {
					info = request.getParameter("commentReplyInfo");
					commentObject = (JSONObject) jsonParser.parse(info);
					
					int parentNo = Integer.parseInt((String) commentObject.get("commentNo"));
					CommentVO parentVO = commentService.getComment(parentNo);
					
					int eventNo = Integer.parseInt((String) commentObject.get("eventNo"));
					String userId = (String) commentObject.get("userId");
					String userName = (String) commentObject.get("userName");
					String replyContent = (String) commentObject.get("replyContent");

					commentVO.setEventNo(eventNo);
					commentVO.setUserId(userId);
					commentVO.setUserName(userName);
					commentVO.setCommentContent(replyContent);

//					int updateRes = commentService.replyUpdate(parentVO);
//					int result = commentService.replyComment(commentVO, parentVO);
					commentService.replyUpdate(parentVO);
					commentService.replyComment(commentVO, parentVO);
					
				} catch (ParseException e) {
					System.out.println("doHandle()메소드 replyComment.do 에서 예외발생 : " + e.toString());
				}
			}
		} 

		if (nextPage != null && !nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}

	}
}
