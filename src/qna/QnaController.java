package qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

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
@WebServlet("/qnaServlet/*")
public class QnaController extends HttpServlet{
	
	QnaService qnaService;
	QnaVO qnaVO;
	
	public void init() throws ServletException {
		qnaService = new QnaService();
		qnaVO = new QnaVO();
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
		JSONObject qnaObject = null;
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		String info = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		if (action != null) {
			if (action.equals("/listQna.do")) {
				try {
					info = request.getParameter("qnaListInfo");
					qnaObject = (JSONObject) jsonParser.parse(info);
					int productNo = Integer.parseInt((String) qnaObject.get("productNo"));

					List<QnaVO> qnaList = qnaService.getQnaList(productNo);
				
					if (qnaList.size() > 0) {
						JSONArray jsonArray = new JSONArray();
						for (int i = 0; i < qnaList.size(); i++) {
							JSONObject returnObject = new JSONObject();
							
							returnObject.put("qnaNo", Integer.toString(qnaList.get(i).getQnaNo()));
							returnObject.put("userId",qnaList.get(i).getUserId());
							returnObject.put("userName", qnaList.get(i).getUserName());
							returnObject.put("qnaContent", qnaList.get(i).getQnaContent());
							returnObject.put("qnaAnswer", qnaList.get(i).getQnaAnswer());
							
							String formattedDate = sdf.format(qnaList.get(i).getQnaDate());
							returnObject.put("qnaDate", formattedDate);
							
							if(qnaList.get(i).getQnaAnswer() != null) {
								String formattedAnswerDate = sdf.format(qnaList.get(i).getQnaAnswerDate());
								returnObject.put("qnaAnswerDate", formattedAnswerDate);	
							}
							jsonArray.add(returnObject);
						}
						JSONObject result = new JSONObject();
						result.put("jsonArray", jsonArray);
						
						response.setContentType("text/html; charset=utf-8");
						request.setAttribute("qnaNum", qnaList.size());					
						
						out.print(result.toString());
						out.flush();
						out.close();						
					}
					
				} catch (ParseException e) {
					System.out.println("doHandle()메소드 listQna.do 에서 예외발생 : " + e.toString());
				}

			} else if (action.equals("/insertQna.do")) {

				try {
					info = request.getParameter("qnaInfo");
					qnaObject = (JSONObject) jsonParser.parse(info);
					int productNo = Integer.parseInt((String) qnaObject.get("productNo"));
					String userId = (String) qnaObject.get("userId");
					String userName = (String) qnaObject.get("userName");
					String qnaContent = (String) qnaObject.get("qnaContent");

					qnaVO.setProductNo(productNo);
					qnaVO.setUserId(userId);
					qnaVO.setUserName(userName);
					qnaVO.setQnaContent(qnaContent);
 
					int result = qnaService.insertQna(qnaVO);
					
					if (result == 1) {
						out.print("success");
					} else {
						out.print("fail");
					}

				} catch (ParseException e) {
					System.out.println("doHandle()메소드 insertQna.do 에서 예외발생 : " + e.toString());
				}
				
			} else if (action.equals("/deleteQna.do")) {

				try {
					info = request.getParameter("qnaDeleteInfo");
					qnaObject = (JSONObject) jsonParser.parse(info);

					int qnaNo = Integer.parseInt((String) qnaObject.get("qnaNo"));
					String userId = (String) qnaObject.get("userId");
					int productNo = Integer.parseInt((String) qnaObject.get("productNo"));
					
					int result = qnaService.deleteQna(qnaNo, userId);

					if (result == 1) {
						int qnaCnt = qnaService.getQnaList(productNo).size();
						JSONObject returnObject = new JSONObject();
						
						returnObject.put("qnaCnt", Integer.toString(qnaCnt));
						out.print(returnObject.toString());
						
					} else {
						out.print("fail");
					}

				} catch (Exception e) {
					System.out.println("doHandle() 메소드 deleteQna.do 에서 예외발생 : " + e.toString());
				}
			}
		}
	}
}
