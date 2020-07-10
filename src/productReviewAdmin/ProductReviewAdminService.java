package productReviewAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductReviewAdminService {

	ProductReviewAdminDAO productAdminADO;

	public ProductReviewAdminService() {
		productAdminADO = new ProductReviewAdminDAO();
	}

	public Map<String, Object> listProductReview(Map<String, Object> searchMap) {

		Map<String, Object> productReviewListMap = new HashMap<String, Object>();

		List<Map<String, Object>> productReviewList = productAdminADO.getProductReviewList(searchMap);
		productReviewListMap.put("productReviewList", productReviewList);

		int totalCount = productAdminADO.getProductReviewListCount(searchMap);
		productReviewListMap.put("totalCount", totalCount);

		return productReviewListMap;
	}

	public Map<String, Object> readProductReview(int reviewNo) {
		return productAdminADO.getProductReview(reviewNo);
	}

	public int deleteProductReview(int reviewNo) {
		return productAdminADO.deleteProductReview(reviewNo);
	}

}