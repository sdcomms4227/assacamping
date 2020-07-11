package productReview;

import java.util.List;

public class ProductReviewService {

	ProductReviewDAO productReviewDAO;
	
	public ProductReviewService() {
		productReviewDAO = new ProductReviewDAO();
	}
	
	public List<ProductReviewVO> getReviewList(int productNo) {
		return productReviewDAO.getReviewList(productNo);
	}

	public int insertReview(ProductReviewVO productReviewVO) {
		return productReviewDAO.insertReview(productReviewVO);
	}

	public int deleteReview(int reviewNo, String userId) {
		return productReviewDAO.deleteReview(reviewNo, userId);
	}

	public int updateReview(int reviewNo, String userId, String updateContent) {
		return productReviewDAO.updateReview(reviewNo, userId, updateContent);
	}

}
