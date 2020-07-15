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
import qna.QnaVO;

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

	public List<Map<String, Object>> getQnaList(Map<String, Object> searchMap) {

		List<Map<String, Object>> qnaList = new ArrayList<Map<String, Object>>();

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
					+ " from qna pq"
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
				Map<String, Object> qnaMap = new HashMap<String, Object>();
				QnaVO qnaVO = new QnaVO();
				ProductVO productVO = new ProductVO();
				
				qnaVO.setProductNo(rs.getInt("productNo"));
				qnaVO.setQnaAnswer(rs.getString("qnaAnswer"));
				qnaVO.setQnaAnswerDate(rs.getTimestamp("qnaAnswerDate"));
				qnaVO.setQnaContent(rs.getString("qnaContent"));
				qnaVO.setQnaDate(rs.getTimestamp("qnaDate"));
				qnaVO.setQnaNo(rs.getInt("qnaNo"));
				qnaVO.setUserId(rs.getString("userId"));
				qnaVO.setUserName(rs.getString("userName"));
				
				qnaMap.put("qnaVO", qnaVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				qnaMap.put("productVO", productVO);
				
				qnaList.add(qnaMap);
				
			}

		} catch (Exception e) {
			System.out.println("getQnaList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return qnaList;
	}

	public int getQnaListCount(Map<String, Object> searchMap) {

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
					+ " from qna"
					+ " where qnaContent like ?"
					+ sqlFilter;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getQnaListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public Map<String, Object> getQna(int qnaNo) {
		
		Map<String, Object> qnaMap = new HashMap<String, Object>();

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select *"
					+ " from qna pq"
					+ " join product pr"
					+ " on pq.productNo = pr.productNo"
					+ " where pq.qnaNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				QnaVO qnaVO = new QnaVO();
				ProductVO productVO = new ProductVO();
				
				qnaVO.setProductNo(rs.getInt("productNo"));
				qnaVO.setQnaAnswer(rs.getString("qnaAnswer"));
				qnaVO.setQnaAnswerDate(rs.getTimestamp("qnaAnswerDate"));
				qnaVO.setQnaContent(rs.getString("qnaContent"));
				qnaVO.setQnaDate(rs.getTimestamp("qnaDate"));
				qnaVO.setQnaNo(rs.getInt("qnaNo"));
				qnaVO.setUserId(rs.getString("userId"));
				qnaVO.setUserName(rs.getString("userName"));
				
				qnaMap.put("qnaVO", qnaVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				
				qnaMap.put("productVO", productVO);	
			}

		} catch (Exception e) {
			System.out.println("getQna()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return qnaMap;
	}

	public int updateQna(QnaVO qnaVO) {

		try {
			conn = dbUtil.DBConnection.getConnection();

			String sql = "update qna set qnaAnswer=?, qnaAnswerDate=now() where qnaNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaVO.getQnaAnswer());
			pstmt.setInt(2, qnaVO.getQnaNo());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateQna()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public int deleteQna(int qnaNo) {

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from qna where qnaNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteQna()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

}