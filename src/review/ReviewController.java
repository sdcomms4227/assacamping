package review;

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

import product.ProductService;

@SuppressWarnings("serial")
@WebServlet("/reviewServlet/*")
public class ReviewController extends HttpServlet{
	
	ReviewService reviewService;
	ReviewVO reviewVO;
	ProductService productService;
	
	public void init() throws ServletException {
		reviewService = new ReviewService();
		reviewVO = new ReviewVO();
		productService = new ProductService();
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		if (action != null) {
			if (action.equals("/listReview.do")) {
				try {
					info = request.getParameter("reviewListInfo");
					reviewObject = (JSONObject) jsonParser.parse(info);
					int productNo = Integer.parseInt((String) reviewObject.get("productNo"));

					List<ReviewVO> reviewList = reviewService.getReviewList(productNo);
					
					if (reviewList.size() > 0) {
						JSONArray jsonArray = new JSONArray();
						for (int i = 0; i < reviewList.size(); i++) {
							JSONObject returnObject = new JSONObject();
							
							returnObject.put("reviewNo", Integer.toString(reviewList.get(i).getReviewNo()));
							returnObject.put("userId",reviewList.get(i).getUserId());
							returnObject.put("userName", reviewList.get(i).getUserName());
							returnObject.put("reviewContent", reviewList.get(i).getReviewContent());
							returnObject.put("starRating", Integer.toString(reviewList.get(i).getStarRating()));
							
							
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
					int starRating = Integer.parseInt((String) reviewObject.get("starRating"));
					
					reviewVO.setProductNo(productNo);
					reviewVO.setUserId(userId);
					reviewVO.setUserName(userName);
					reviewVO.setReviewContent(reviewContent);
					reviewVO.setStarRating(starRating);
					
					int avgRating = reviewService.insertReview(reviewVO);
					
					productService.updateProductRating(productNo, avgRating);
					
					if (avgRating > 0) {
						JSONObject returnObject = new JSONObject();
						
						returnObject.put("avgRating", Integer.toString(avgRating));
						out.print(returnObject.toString());
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
					int productNo = Integer.parseInt((String) reviewObject.get("productNo"));
					String userId = (String) reviewObject.get("userId");

					int avgRating = reviewService.deleteReview(reviewNo, userId);
					
					productService.updateProductRating(productNo, avgRating);
					
					if (avgRating >= 0) {
						int reviewCnt = reviewService.getReviewList(productNo).size();
						JSONObject returnObject = new JSONObject();
						
						returnObject.put("reviewCnt", Integer.toString(reviewCnt));
						returnObject.put("avgRating", Integer.toString(avgRating));
						out.print(returnObject.toString());
						
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
					
					int result = reviewService.updateReview(reviewNo, userId, updateContent);
					
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
	}
}





























