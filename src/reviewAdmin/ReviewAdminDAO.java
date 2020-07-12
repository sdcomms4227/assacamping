package reviewAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import product.ProductVO;
import review.ReviewVO;

public class ReviewAdminDAO {

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

	public List<Map<String, Object>> getReviewList(Map<String, Object> searchMap) {

		List<Map<String, Object>> reviewList = new ArrayList<Map<String, Object>>();

		int numberPerPage = 10;
		int pageNo = (int) searchMap.get("pageNo");
		int offset = (pageNo - 1) * 10;
		String searchKeyword = (String) searchMap.get("searchKeyword");
		String sql = "";

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "	select *"
					+ " from review pq"
					+ " join product pr"
					+ " on pq.productNo = pr.productNo"
					+ " where pq.reviewContent like ?"
					+ " order by pq.reviewNo desc limit ?, ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			pstmt.setInt(2, offset);
			pstmt.setInt(3, numberPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> reviewMap = new HashMap<String, Object>();
				ReviewVO reviewVO = new ReviewVO();
				ProductVO productVO = new ProductVO();
				
				reviewVO.setProductNo(rs.getInt("productNo"));
				reviewVO.setReviewContent(rs.getString("reviewContent"));
				reviewVO.setReviewDate(rs.getTimestamp("reviewDate"));
				reviewVO.setReviewNo(rs.getInt("reviewNo"));
				reviewVO.setStarRating(rs.getInt("starRating"));
				reviewVO.setUserId(rs.getString("userId"));
				reviewVO.setUserName(rs.getString("userName"));
				
				reviewMap.put("reviewVO", reviewVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				reviewMap.put("productVO", productVO);
				
				reviewList.add(reviewMap);
				
			}

		} catch (Exception e) {
			System.out.println("getReviewList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return reviewList;
	}

	public int getReviewListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String) searchMap.get("searchKeyword");
		String sql = "";

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select count(reviewNo)"
					+ " from review"
					+ " where reviewContent like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getReviewListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public Map<String, Object> getReview(int reviewNo) {
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select *"
					+ " from review pq"
					+ " join product pr"
					+ " on pq.productNo = pr.productNo"
					+ " where pq.reviewNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				ReviewVO reviewVO = new ReviewVO();
				ProductVO productVO = new ProductVO();
				
				reviewVO.setProductNo(rs.getInt("productNo"));
				reviewVO.setReviewContent(rs.getString("reviewContent"));
				reviewVO.setReviewDate(rs.getTimestamp("reviewDate"));
				reviewVO.setReviewNo(rs.getInt("reviewNo"));
				reviewVO.setStarRating(rs.getInt("starRating"));
				reviewVO.setUserId(rs.getString("userId"));
				reviewVO.setUserName(rs.getString("userName"));
				
				reviewMap.put("reviewVO", reviewVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				reviewMap.put("productVO", productVO);	
			}

		} catch (Exception e) {
			System.out.println("getReview()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return reviewMap;
	}

	public int deleteReview(int reviewNo) {

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from review where reviewNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteReview()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

}