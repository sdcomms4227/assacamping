package reply;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/reply/*")
public class ReplyController extends HttpServlet {

	ReplyService replyService;
	ReplyVO replyVO;
	
	public void init() throws ServletException {
		replyService = new ReplyService();
		replyVO = new ReplyVO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req,resp);
	}
 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req,resp);
	}

	private void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();
		
		JSONParser jsonParser = new JSONParser();
		JSONObject replyObject = null;
		String action = req.getPathInfo();
		String info = null;
		
		if(action != null) {
			if(action.equals("/insertReply.do")) {
				info = req.getParameter("replyInfo");
				try {
					replyObject = (JSONObject)jsonParser.parse(info);
					int boardCategoryNo = Integer.parseInt((String)replyObject.get("boardCategoryNo"));
					int boardNo = Integer.parseInt((String)replyObject.get("boardNo"));
					String userId = (String)replyObject.get("userId");
					String userName = (String)replyObject.get("userName");
					String replyContent = (String)replyObject.get("replyContent");
					
					replyVO.setBoardCategoryNo(boardCategoryNo);
					replyVO.setBoardNo(boardNo);
					replyVO.setUserId(userId);
					replyVO.setUserName(userName);
					replyVO.setReplyContent(replyContent);
					
					int result = replyService.insertReply(replyVO);
					
					if(result == 1) {
						ReplyVO replyVO2 = new ReplyVO();
						
						replyVO2 = replyService.getLastReply();

						int returnNo = replyVO2.getReplyNo();
						String returnName = replyVO2.getUserName();
						String returnContent = replyVO2.getReplyContent();
						Timestamp returnDate = replyVO2.getReplyWriteDate();
						
						SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
						String formattedDate = sdf.format(returnDate);
						
						JSONObject returnObject = new JSONObject();
						
						returnObject.put("replyNo", returnNo);
						returnObject.put("userName", returnName);
						returnObject.put("replyContent", returnContent);
						returnObject.put("replyDate", formattedDate);			
						
						out.print(returnObject.toString());
					}
				} catch (ParseException e) {
					System.out.println("doHandle()메소드 reply.do 에서 예외발생 : " + e.toString());
				}	
			} else if(action.equals("/deleteReply.do")) {
				info = req.getParameter("replyDeleteInfo");
				try {
					replyObject = (JSONObject)jsonParser.parse(info);
					
					int replyNo = Integer.parseInt((String)replyObject.get("replyNo"));
					String userId = (String)replyObject.get("userId");			

					int result = replyService.deleteReply(replyNo, userId);
					
					if(result==1) {				
						out.print("success");
					}else{
						out.print("fail");				
					}
				} catch (Exception e) {
					System.out.println("doHandle() 메소드 deleteReply.do 에서 예외발생 : " + e.toString());
				}
			}
		}
	}
}

