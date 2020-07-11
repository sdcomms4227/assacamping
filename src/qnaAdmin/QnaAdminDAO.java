package qnaAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import product.ProductVO;
import qna.ProductQnaVO;

public class QnaAdminDAO {

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

	public List<Map<String, Object>> getProductQnaList(Map<String, Object> searchMap) {

		List<Map<String, Object>> productQnaList = new ArrayList<Map<String, Object>>();

		int numberPerPage = 10;
		int pageNo = (int) searchMap.get("pageNo");
		int offset = (pageNo - 1) * 10;
		String searchKeyword = (String) searchMap.get("searchKeyword");
		String answerCheck = (String) searchMap.get("answerCheck");
		String sql = "";
		String sqlFilter ="";
		
		if(answerCheck != null && !answerCheck.equals("")) {
			sqlFilter =" and pq.qnaAnswer is null";
		}

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "	select *"
					+ " from productQna pq"
					+ " join product pr"
					+ " on pq.productNo = pr.productNo"
					+ " where pq.qnaContent like ?"
					+ sqlFilter
					+ " order by pq.qnaNo desc limit ?, ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			pstmt.setInt(2, offset);
			pstmt.setInt(3, numberPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> productQnaMap = new HashMap<String, Object>();
				ProductQnaVO productQnaVO = new ProductQnaVO();
				ProductVO productVO = new ProductVO();
				
				productQnaVO.setProductNo(rs.getInt("productNo"));
				productQnaVO.setQnaAnswer(rs.getString("qnaAnswer"));
				productQnaVO.setQnaContent(rs.getString("qnaContent"));
				productQnaVO.setQnaDate(rs.getTimestamp("qnaDate"));
				productQnaVO.setQnaNo(rs.getInt("qnaNo"));
				productQnaVO.setUserId(rs.getString("userId"));
				productQnaVO.setUserName(rs.getString("userName"));
				
				productQnaMap.put("productQnaVO", productQnaVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				productQnaMap.put("productVO", productVO);
				
				productQnaList.add(productQnaMap);
				
			}

		} catch (Exception e) {
			System.out.println("getProductQnaList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return productQnaList;
	}

	public int getProductQnaListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String) searchMap.get("searchKeyword");
		String answerCheck = (String) searchMap.get("answerCheck");
		String sql = "";
		String sqlFilter ="";
		
		if(answerCheck != null && !answerCheck.equals("")) {
			sqlFilter =" and qnaAnswer is null";
		}

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select count(qnaNo)"
					+ " from productQna"
					+ " where qnaContent like ?"
					+ sqlFilter;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getProductQnaListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public Map<String, Object> getProductQna(int qnaNo) {
		
		Map<String, Object> productQnaMap = new HashMap<String, Object>();

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select *"
					+ " from productQna pq"
					+ " join product pr"
					+ " on pq.productNo = pr.productNo"
					+ " where pq.qnaNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				ProductQnaVO productQnaVO = new ProductQnaVO();
				ProductVO productVO = new ProductVO();
				
				productQnaVO.setProductNo(rs.getInt("productNo"));
				productQnaVO.setQnaAnswer(rs.getString("qnaAnswer"));
				productQnaVO.setQnaContent(rs.getString("qnaContent"));
				productQnaVO.setQnaDate(rs.getTimestamp("qnaDate"));
				productQnaVO.setQnaNo(rs.getInt("qnaNo"));
				productQnaVO.setUserId(rs.getString("userId"));
				productQnaVO.setUserName(rs.getString("userName"));
				
				productQnaMap.put("productQnaVO", productQnaVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				productQnaMap.put("productVO", productVO);	
			}

		} catch (Exception e) {
			System.out.println("getProductQna()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return productQnaMap;
	}

	public int updateProductQna(ProductQnaVO productQnaVO) {

		try {
			conn = dbUtil.DBConnection.getConnection();

			String sql = "update productQna set qnaAnswer=? where qnaNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productQnaVO.getQnaAnswer());
			pstmt.setInt(2, productQnaVO.getQnaNo());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateProductQna()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public int deleteProductQna(int qnaNo) {

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from productQna where qnaNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteProductQna()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

}