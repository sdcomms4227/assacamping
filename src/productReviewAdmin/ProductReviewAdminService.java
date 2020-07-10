package productReviewAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductReviewAdminService {

	ProductReviewAdminDAO proAdminDAO;

	public ProductReviewAdminService() {
		proAdminDAO = new ProductReviewAdminDAO();
	}

	public Map<String, Object> listProductReview(Map<String, Object> searchMap) {

		Map<String, Object> productReviewListMap = new HashMap<String, Object>();

		List<Map<String, Object>> productReviewList = proAdminDAO.getProductReviewList(searchMap);
		productReviewListMap.put("productReviewList", productReviewList);

		int totalCount = proAdminDAO.getProductReviewListCount(searchMap);
		productReviewListMap.put("totalCount", totalCount);

		return productReviewListMap;
	}

	public Map<String, Object> readProductReview(int reviewNo) {
		return proAdminDAO.getProductReview(reviewNo);
	}

	public int deleteProductReview(int reviewNo) {
		return proAdminDAO.deleteProductReview(reviewNo);
	}

}