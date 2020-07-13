package reviewAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewAdminService {

	ReviewAdminDAO reviewAdminDAO;

	public ReviewAdminService() {
		reviewAdminDAO = new ReviewAdminDAO();
	}

	public Map<String, Object> listReview(Map<String, Object> searchMap) {

		Map<String, Object> reviewListMap = new HashMap<String, Object>();

		List<Map<String, Object>> reviewList = reviewAdminDAO.getReviewList(searchMap);
		reviewListMap.put("reviewList", reviewList);

		int totalCount = reviewAdminDAO.getReviewListCount(searchMap);
		reviewListMap.put("totalCount", totalCount);

		return reviewListMap;
	}

	public Map<String, Object> readReview(int reviewNo) {
		return reviewAdminDAO.getReview(reviewNo);
	}

	public int deleteReview(int reviewNo) {
		return reviewAdminDAO.deleteReview(reviewNo);
	}

}