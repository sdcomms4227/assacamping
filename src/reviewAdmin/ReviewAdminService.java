package reviewAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewAdminService {

	ReviewAdminDAO reviewAdminDAO;

	public ReviewAdminService() {
		reviewAdminDAO = new ReviewAdminDAO();
	}

	public Map<String, Object> listProductReview(Map<String, Object> searchMap) {

		Map<String, Object> productReviewListMap = new HashMap<String, Object>();

		List<Map<String, Object>> productReviewList = reviewAdminDAO.getProductReviewList(searchMap);
		productReviewListMap.put("productReviewList", productReviewList);

		int totalCount = reviewAdminDAO.getProductReviewListCount(searchMap);
		productReviewListMap.put("totalCount", totalCount);

		return productReviewListMap;
	}

	public Map<String, Object> readProductReview(int reviewNo) {
		return reviewAdminDAO.getProductReview(reviewNo);
	}

	public int deleteProductReview(int reviewNo) {
		return reviewAdminDAO.deleteProductReview(reviewNo);
	}

}