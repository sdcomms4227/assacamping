package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ReviewDAO {

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
	public List<ReviewVO> getReviewList(int productNo) {
		String sql = "";
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select * from review where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewVO reviewVO = new ReviewVO();

				reviewVO.setProductNo(rs.getInt("productNo"));
				reviewVO.setReviewContent(rs.getString("reviewContent"));
				reviewVO.setReviewDate(rs.getTimestamp("reviewDate"));
				reviewVO.setReviewNo(rs.getInt("reviewNo"));
				reviewVO.setUserId(rs.getString("userId"));
				reviewVO.setUserName(rs.getString("userName"));
				reviewVO.setStarRating(rs.getInt("starRating"));

				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			System.out.println("getReviewList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return reviewList;
	}

	// 리뷰달기
	public int insertReview(ReviewVO reviewVO) {
		String sql = "";
		int num = 0;
		
		if (reviewVO.getReviewContent() == null || reviewVO.getReviewContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(reviewNo) from review";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
				
				sql = "insert into review(reviewNo,productNo,userId,userName,reviewContent,reviewDate, starRating)"
						+ "values(?, ?, ?, ?, ?, now(), ?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, reviewVO.getProductNo());
				pstmt.setString(3, reviewVO.getUserId());
				pstmt.setString(4, reviewVO.getUserName());
				pstmt.setString(5, reviewVO.getReviewContent());
				pstmt.setInt(6, reviewVO.getStarRating());

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
		String sql = "select userId from review where reviewNo=?";

		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId")) || userId.equals("admin")) {
					sql = "delete from review where reviewNo=?";
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
		String sql = "select userId from review where reviewNo=?";
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId"))) {
					sql = "update review set reviewContent=?, reviewDate=curdate() where reviewNo=?";
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

	public double getAvgRating(int productNo) {
		String sql = "";
		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select avg(starRating) from review where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getDouble(1);
			}
		} catch (Exception e) {
			System.out.println("getAvgRating()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

	public int getProductNo(int reviewNo) {
		String sql = "";
		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select productNo from review where reviewNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getProductNo()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

}
