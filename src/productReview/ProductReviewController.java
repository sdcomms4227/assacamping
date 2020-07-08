package productReview;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.text.SimpleDateFormat;

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
@WebServlet("/proreview/*")
public class ProductReviewController extends HttpServlet{
	
	ProductReviewService productReviewService;
	ProductReviewVO productReviewVO;
	
	public void init() throws ServletException {
		productReviewService = new ProductReviewService();
		productReviewVO = new ProductReviewVO();
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
		JSONObject reviewObject = null;
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		String info = null;
//		String nextPage = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		if (action != null) {
			if (action.equals("/listReview.do")) {
				try {
					info = request.getParameter("reviewListInfo");
					reviewObject = (JSONObject) jsonParser.parse(info);
					int productNo = Integer.parseInt((String) reviewObject.get("productNo"));

					List<ProductReviewVO> reviewList = productReviewService.getReviewList(productNo);
				
					if (reviewList.size() > 0) {
						JSONArray jsonArray = new JSONArray();
						for (int i = 0; i < reviewList.size(); i++) {
							JSONObject returnObject = new JSONObject();
							
							returnObject.put("reviewNo", Integer.toString(reviewList.get(i).getReviewNo()));
							returnObject.put("userId",reviewList.get(i).getUserId());
							returnObject.put("userName", reviewList.get(i).getUserName());
							returnObject.put("reviewContent", reviewList.get(i).getReviewContent());
							
							String formattedDate = sdf.format(reviewList.get(i).getReviewDate());
							returnObject.put("reviewDate", formattedDate);

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

			} else if (action.equals("/insertReview.do")) {

				try {
					info = request.getParameter("reviewInfo");
					reviewObject = (JSONObject) jsonParser.parse(info);
					int productNo = Integer.parseInt((String) reviewObject.get("productNo"));
					String userId = (String) reviewObject.get("userId");
					String userName = (String) reviewObject.get("userName");
					String reviewContent = (String) reviewObject.get("reviewContent");

					productReviewVO.setProductNo(productNo);
					productReviewVO.setUserId(userId);
					productReviewVO.setUserName(userName);
					productReviewVO.setReviewContent(reviewContent);
 
					int result = productReviewService.insertReview(productReviewVO);
					
					if (result == 1) {
						out.print("success");
					} else {
						out.print("fail");
					}

				} catch (ParseException e) {
					System.out.println("doHandle()메소드 insertReview.do 에서 예외발생 : " + e.toString());
				}
			} else if (action.equals("/deleteReview.do")) {

				try {
					info = request.getParameter("reviewDeleteInfo");
					reviewObject = (JSONObject) jsonParser.parse(info);

					int reviewNo = Integer.parseInt((String) reviewObject.get("reviewNo"));
					String userId = (String) reviewObject.get("userId");

					int result = productReviewService.deleteReview(reviewNo, userId);

					if (result == 1) {
						out.print("success");
					} else {
						out.print("fail");
					}

				} catch (Exception e) {
					System.out.println("doHandle() 메소드 deleteReview.do 에서 예외발생 : " + e.toString());
				}
			} else if (action.equals("/updateReview.do")) {
				
				try {
				
					info = request.getParameter("reviewUpdateInfo");
					reviewObject = (JSONObject) jsonParser.parse(info);
					
					int reviewNo = Integer.parseInt((String) reviewObject.get("reviewNo"));
					String userId = (String) reviewObject.get("userId");
					String updateContent = (String) reviewObject.get("updateContent");
					
					int result = productReviewService.updateReview(reviewNo, userId, updateContent);
					
					if (result == 1) {
						out.print("success");
					} else {
						out.print("fail");
					}
					
				} catch (Exception e) {
					System.out.println("doHandle() 메소드 updateReview.do 에서 예외발생 : " + e.toString());
				}	
			}
		} 

//		if (nextPage != null && !nextPage.equals("")) {
//			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
//			dispatch.forward(request, response);
//		}
	}
}





























