package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDAO {

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

	// 댓글달기
	public int insertReply(ReplyVO replyVO) {
		String sql = "";
		int num = 0;

		if (replyVO.getReplyContent() == null || replyVO.getReplyContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(replyNum) from reply";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}

				sql = "insert into reply(replyNo,boardCategoryNo,boardNo,userId,userName,replyContent,replyDate, replyRe_ref, replyRe_lev, replyRe_seq)"
						+ "values(?,?,?,?,?,?,now(), 0, 0, 0)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, replyVO.getBoardCategoryNo());
				pstmt.setInt(3, replyVO.getBoardNo());
				pstmt.setString(4, replyVO.getUserId());
				pstmt.setString(5, replyVO.getUserName());
				pstmt.setString(6, replyVO.getReplyContent());

				return pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("insertReply()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}

		return 0;
	} // insertReply

	// 댓글 삭제
	public int deleteReply(int replyNo, String userId) {
		String sql = "select userId from reply where replyNo=?";

		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId"))) {
					sql = "delete from reply where replyNo=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, replyNo);
					return pstmt.executeUpdate();
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			System.out.println("deleteReply()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	} // deleteReply

	public List<ReplyVO> getReplyList(int boardCategoryNo, int boardNo) {
		String sql = "";
		List<ReplyVO> replyList = new ArrayList<ReplyVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select * from reply where boardCategoryNo=? and boardNo=? order by replyNo";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCategoryNo);
			pstmt.setInt(2, boardNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReplyVO replyVO = new ReplyVO();

				replyVO.setBoardCategoryNo(rs.getInt("boardCategoryNo"));
				replyVO.setBoardNo(rs.getInt("boardNo"));
				replyVO.setReplyContent(rs.getString("replyContent"));
				replyVO.setReplyWriteDate(rs.getTimestamp("replyWriteDate"));
				replyVO.setReplyNo(rs.getInt("replyNo"));
				replyVO.setUserId(rs.getString("userId"));
				replyVO.setUserName(rs.getString("userName"));
				replyVO.setReplyRe_ref(rs.getInt("replyRe_ref"));
				replyVO.setReplyRe_lev(rs.getInt("replyRe_lev"));
				replyVO.setReplyRe_seq(rs.getInt("replyRe_seq"));
				
				replyList.add(replyVO);
			}

		} catch (Exception e) {
			System.out.println("getReplyList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return replyList;
	}

	public ReplyVO getLastReply() {
		String sql = "";
		int num = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select max(replyNo) from reply";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1);
			} else {
				num = 1;
			}
			sql = "select * from reply where replyNum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ReplyVO replyVO = new ReplyVO();
				replyVO.setBoardCategoryNo(rs.getInt("boardCategoryNo"));
				replyVO.setBoardNo(rs.getInt("boardNo"));
				replyVO.setReplyContent(rs.getString("replyContent"));
				replyVO.setReplyWriteDate(rs.getTimestamp("replyWriteDate"));
				replyVO.setReplyNo(rs.getInt("replyNo"));
				replyVO.setUserId(rs.getString("userId"));
				replyVO.setUserName(rs.getString("userName"));	
				replyVO.setReplyRe_ref(rs.getInt("replyRe_ref"));
				replyVO.setReplyRe_lev(rs.getInt("replyRe_lev"));
				replyVO.setReplyRe_seq(rs.getInt("replyRe_seq"));
				return replyVO;
			}
		} catch (Exception e) {
			System.out.println("getLastReply()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return null;
	}
}
