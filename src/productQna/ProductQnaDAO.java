package productQna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductQnaDAO {

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
	
	// 문의목록 가져오기
	public List<ProductQnaVO> getQnaList(int productNo) {
		String sql = "";
		List<ProductQnaVO> qnaList = new ArrayList<ProductQnaVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select * from productQna where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductQnaVO productQnaVO = new ProductQnaVO();

				productQnaVO.setProductNo(rs.getInt("productNo"));
				productQnaVO.setQnaContent(rs.getString("qnaContent"));
				productQnaVO.setQnaDate(rs.getTimestamp("qnaDate"));
				productQnaVO.setQnaNo(rs.getInt("qnaNo"));
				productQnaVO.setUserId(rs.getString("userId"));
				productQnaVO.setUserName(rs.getString("userName"));
				productQnaVO.setQnaAnswer(rs.getString("qnaAnswer"));
				productQnaVO.setQnaAnswerDate(rs.getTimestamp("qnaAnswerDate"));
				
				qnaList.add(productQnaVO);
			}
		} catch (Exception e) {
			System.out.println("getQnaList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return qnaList;
	}

	// 문의등록
	public int insertQna(ProductQnaVO productQnaVO) {
		String sql = "";
		int num = 0;
		
		if (productQnaVO.getQnaContent() == null || productQnaVO.getQnaContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(qnaNo) from productQna";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
				
				sql = "insert into productQna(qnaNo,productNo,userId,userName,qnaContent,qnaDate)"
						+ "values(?, ?, ?, ?, ?, now())";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, productQnaVO.getProductNo());
				pstmt.setString(3, productQnaVO.getUserId());
				pstmt.setString(4, productQnaVO.getUserName());
				pstmt.setString(5, productQnaVO.getQnaContent());

				return pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("insertQna()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}
		return 0;
	}

	// 문의삭제
	public int deleteQna(int qnaNo, String userId) {
		String sql = "select userId from productQna where qnaNo=?";

		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId")) || userId.equals("admin")) {
					sql = "delete from productQna where qnaNo=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, qnaNo);
					return pstmt.executeUpdate();
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			System.out.println("deleteQna()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}
}
