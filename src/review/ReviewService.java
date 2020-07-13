package review;

import java.util.List;

public class ReviewService {

	ReviewDAO reviewDAO;
	
	public ReviewService() {
		reviewDAO = new ReviewDAO();
	}
	
	public List<ReviewVO> getReviewList(int productNo) {
		return reviewDAO.getReviewList(productNo);
	}

	public int insertReview(ReviewVO reviewVO) {
		return reviewDAO.insertReview(reviewVO);
	}

	public int deleteReview(int reviewNo, String userId) {
		return reviewDAO.deleteReview(reviewNo, userId);
	}

	public int updateReview(int reviewNo, String userId, String updateContent) {
		return reviewDAO.updateReview(reviewNo, userId, updateContent);
	}

}
