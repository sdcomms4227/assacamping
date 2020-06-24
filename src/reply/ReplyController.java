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

import boardCategory.BoardCategoryService;
import boardCategory.BoardCategoryVO;

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
		String action = req.getPathInfo();
		
		if(action != null) {
			if(action.equals("/reply.do")) {
				String replyInfo = req.getParameter("replyInfo");
				JSONObject replyObject = (JSONObject)jsonParser.parse(replyInfo);
				
				int boardNo = Integer.parseInt((String)replyObject.get("boardNo"));
				String userId = (String)replyObject.get("userId");
				String replyContent = (String)replyObject.get("replyContent");
				
				replyVO.setBoardNo(boardNo);
				replyVO.setUserId(userId);
				replyVO.setReplyContent(replyContent);
				
				int result = replyService.insertReply(replyVO);
				
				if(result==1) {
					ReplyVO replyVO2 = new ReplyVO();
					
					replyVO2 = replyService.getLastReply();

					int returnNo = replyVO2.getReplyNo();
					
					String returnContent = replyVO2.getReplyContent();
					Timestamp returnDate = replyVO2.getReplyWriteDate();
					
					SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
					String formattedDate = sdf.format(returnDate);
					
					JSONObject returnObject = new JSONObject();
					
					returnObject.put("replyNo", returnNo);
					returnObject.put("replyContent", returnContent);
					returnObject.put("replyDate", formattedDate);			
					
					out.print(returnObject.toString());
				
			} else if(action.equals("/deleteR eply.do")) {
				
			}
		}
		
	}

}
