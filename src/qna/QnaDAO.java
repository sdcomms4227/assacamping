package qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QnaDAO {

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
	public List<QnaVO> getQnaList(int productNo) {
		String sql = "";
		List<QnaVO> qnaList = new ArrayList<QnaVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select * from qna where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaVO qnaVO = new QnaVO();

				qnaVO.setProductNo(rs.getInt("productNo"));
				qnaVO.setQnaContent(rs.getString("qnaContent"));
				qnaVO.setQnaDate(rs.getTimestamp("qnaDate"));
				qnaVO.setQnaNo(rs.getInt("qnaNo"));
				qnaVO.setUserId(rs.getString("userId"));
				qnaVO.setUserName(rs.getString("userName"));
				qnaVO.setQnaAnswer(rs.getString("qnaAnswer"));
				qnaVO.setQnaAnswerDate(rs.getTimestamp("qnaAnswerDate"));
				
				qnaList.add(qnaVO);
			}
		} catch (Exception e) {
			System.out.println("getQnaList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return qnaList;
	}

	// 문의등록
	public int insertQna(QnaVO qnaVO) {
		String sql = "";
		int num = 0;
		
		if (qnaVO.getQnaContent() == null || qnaVO.getQnaContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(qnaNo) from qna";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
				
				sql = "insert into qna(qnaNo,productNo,userId,userName,qnaContent,qnaDate)"
						+ "values(?, ?, ?, ?, ?, now())";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, qnaVO.getProductNo());
				pstmt.setString(3, qnaVO.getUserId());
				pstmt.setString(4, qnaVO.getUserName());
				pstmt.setString(5, qnaVO.getQnaContent());

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
		String sql = "select userId from qna where qnaNo=?";

		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId")) || userId.equals("admin")) {
					sql = "delete from qna where qnaNo=?";
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
