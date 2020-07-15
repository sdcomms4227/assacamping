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
		int result = reviewDAO.insertReview(reviewVO);
		if(result == 1) {
			return (int) Math.round(reviewDAO.getAvgRating(reviewVO.getProductNo()));
		}
		return 0; 
	}

	public int deleteReview(int reviewNo, String userId) {
		int productNo = reviewDAO.getProductNo(reviewNo);
		int result = reviewDAO.deleteReview(reviewNo, userId);
		if(result == 1) {
			return (int) Math.round(reviewDAO.getAvgRating(productNo));
		}
		return -1;
	}

	public int updateReview(int reviewNo, String userId, String updateContent) {
		return reviewDAO.updateReview(reviewNo, userId, updateContent);
	}

}
