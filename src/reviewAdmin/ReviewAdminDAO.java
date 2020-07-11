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
import review.ProductReviewVO;

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

	public List<Map<String, Object>> getProductReviewList(Map<String, Object> searchMap) {

		List<Map<String, Object>> productReviewList = new ArrayList<Map<String, Object>>();

		int numberPerPage = 10;
		int pageNo = (int) searchMap.get("pageNo");
		int offset = (pageNo - 1) * 10;
		String searchKeyword = (String) searchMap.get("searchKeyword");
		String sql = "";

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "	select *"
					+ " from productReview pq"
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
				Map<String, Object> productReviewMap = new HashMap<String, Object>();
				ProductReviewVO productReviewVO = new ProductReviewVO();
				ProductVO productVO = new ProductVO();
				
				productReviewVO.setProductNo(rs.getInt("productNo"));
				productReviewVO.setReviewContent(rs.getString("reviewContent"));
				productReviewVO.setReviewDate(rs.getTimestamp("reviewDate"));
				productReviewVO.setReviewNo(rs.getInt("reviewNo"));
				productReviewVO.setStarRating(rs.getInt("starRating"));
				productReviewVO.setUserId(rs.getString("userId"));
				productReviewVO.setUserName(rs.getString("userName"));
				
				productReviewMap.put("productReviewVO", productReviewVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				productReviewMap.put("productVO", productVO);
				
				productReviewList.add(productReviewMap);
				
			}

		} catch (Exception e) {
			System.out.println("getProductReviewList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return productReviewList;
	}

	public int getProductReviewListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String) searchMap.get("searchKeyword");
		String sql = "";

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select count(reviewNo)"
					+ " from productReview"
					+ " where reviewContent like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getProductReviewListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public Map<String, Object> getProductReview(int reviewNo) {
		
		Map<String, Object> productReviewMap = new HashMap<String, Object>();

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select *"
					+ " from productReview pq"
					+ " join product pr"
					+ " on pq.productNo = pr.productNo"
					+ " where pq.reviewNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				ProductReviewVO productReviewVO = new ProductReviewVO();
				ProductVO productVO = new ProductVO();
				
				productReviewVO.setProductNo(rs.getInt("productNo"));
				productReviewVO.setReviewContent(rs.getString("reviewContent"));
				productReviewVO.setReviewDate(rs.getTimestamp("reviewDate"));
				productReviewVO.setReviewNo(rs.getInt("reviewNo"));
				productReviewVO.setStarRating(rs.getInt("starRating"));
				productReviewVO.setUserId(rs.getString("userId"));
				productReviewVO.setUserName(rs.getString("userName"));
				
				productReviewMap.put("productReviewVO", productReviewVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				productReviewMap.put("productVO", productVO);	
			}

		} catch (Exception e) {
			System.out.println("getProductReview()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return productReviewMap;
	}

	public int deleteProductReview(int reviewNo) {

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from productReview where reviewNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteProductReview()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

}