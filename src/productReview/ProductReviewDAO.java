package productReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProductReviewDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void freeResource() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 리뷰목록 가져오기
	public List<ProductReviewVO> getReviewList(int productNo) {
		String sql = "";
		List<ProductReviewVO> reviewList = new ArrayList<ProductReviewVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select * from productReview where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductReviewVO productReviewVO = new ProductReviewVO();

				productReviewVO.setProductNo(rs.getInt("productNo"));
				productReviewVO.setReviewContent(rs.getString("reviewContent"));
				productReviewVO.setReviewDate(rs.getTimestamp("reviewDate"));
				productReviewVO.setReviewNo(rs.getInt("reviewNo"));
				productReviewVO.setUserId(rs.getString("userId"));
				productReviewVO.setUserName(rs.getString("userName"));
				productReviewVO.setStarRating(rs.getInt("starRating"));

				reviewList.add(productReviewVO);
			}
		} catch (Exception e) {
			System.out.println("getReviewList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return reviewList;
	}

	// 리뷰달기
	public int insertReview(ProductReviewVO productReviewVO) {
		String sql = "";
		int num = 0;
		
		if (productReviewVO.getReviewContent() == null || productReviewVO.getReviewContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(reviewNo) from productReview";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
				
				sql = "insert into productReview(reviewNo,productNo,userId,userName,reviewContent,reviewDate, starRating)"
						+ "values(?, ?, ?, ?, ?, now(), ?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, productReviewVO.getProductNo());
				pstmt.setString(3, productReviewVO.getUserId());
				pstmt.setString(4, productReviewVO.getUserName());
				pstmt.setString(5, productReviewVO.getReviewContent());
				pstmt.setInt(6, productReviewVO.getStarRating());

				return pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("insertReview()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}

		return 0;
	}

	// 리뷰삭제
	public int deleteReview(int reviewNo, String userId) {
		String sql = "select userId from productReview where reviewNo=?";

		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId")) || userId.equals("admin")) {
					sql = "delete from productReview where reviewNo=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, reviewNo);
					return pstmt.executeUpdate();
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			System.out.println("deleteReview()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

	// 리뷰수정
	public int updateReview(int reviewNo, String userId, String updateContent) {
String sql = "select userId from productReview where reviewNo=?";
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId"))) {
					sql = "update productReview set reviewContent=?, reviewDate=curdate() where reviewNo=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, updateContent);
					pstmt.setInt(2, reviewNo);
					return pstmt.executeUpdate();
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			System.out.println("updateReview()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

}
