package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

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
	public int insertComment(CommentVO commentVO) {
		String sql = "";
		int num = 0;
		int num2 = 0;
		
		if (commentVO.getCommentContent() == null || commentVO.getCommentContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(commentNo) from comment";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
				
				sql = "select max(commentRe_ref) from comment";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num2 = rs.getInt(1) + 1;
				} else {
					num2 = 0;
				}
				
				sql = "insert into comment(commentNo,eventNo,userId,userName,commentContent,commentWriteDate, commentRe_ref, commentRe_lev, commentRe_seq)"
						+ "values(?,?,?,?,?,now(), ?, 0, 0)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, commentVO.getEventNo());
				pstmt.setString(3, commentVO.getUserId());
				pstmt.setString(4, commentVO.getUserName());
				pstmt.setString(5, commentVO.getCommentContent());
				pstmt.setInt(6, num2);

				return pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("insertComment()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}

		return 0;
	} // insertComment

	// 댓글 삭제
	public int deleteComment(int commentNo, String userId) {
		String sql = "select userId from comment where commentNo=?";

		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId"))) {
					sql = "delete from comment where commentNo=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, commentNo);
					return pstmt.executeUpdate();
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			System.out.println("deletecomment()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	} // deleteComment

	// 댓글 리스트
	public List<CommentVO> getCommentList(int eventNo) {
		String sql = "";
		List<CommentVO> commentList = new ArrayList<CommentVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select * from comment where eventNo=? order by commentRe_ref ASC, commentRe_seq ASC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eventNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO commentVO = new CommentVO();

				commentVO.setEventNo(rs.getInt("eventNo"));
				commentVO.setCommentContent(rs.getString("commentContent"));
				commentVO.setCommentWriteDate(rs.getTimestamp("commentWriteDate"));
				commentVO.setCommentNo(rs.getInt("commentNo"));
				commentVO.setUserId(rs.getString("userId"));
				commentVO.setUserName(rs.getString("userName"));
				commentVO.setCommentRe_ref(rs.getInt("commentRe_ref"));
				commentVO.setCommentRe_lev(rs.getInt("commentRe_lev"));
				commentVO.setCommentRe_seq(rs.getInt("commentRe_seq"));

				commentList.add(commentVO);
			}

		} catch (Exception e) {
			System.out.println("getCommentList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return commentList;
	} // getCommentList

	// 댓글하나 가져오기
	public CommentVO getComment(int commentNo) {
		String sql = "";
		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select * from comment where commentNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				CommentVO commentVO = new CommentVO();
				
				commentVO.setEventNo(rs.getInt("eventNo"));
				commentVO.setCommentContent(rs.getString("commentContent"));
				commentVO.setCommentWriteDate(rs.getTimestamp("commentWriteDate"));
				commentVO.setCommentNo(rs.getInt("commentNo"));
				commentVO.setUserId(rs.getString("userId"));
				commentVO.setUserName(rs.getString("userName"));
				commentVO.setCommentRe_ref(rs.getInt("commentRe_ref"));
				commentVO.setCommentRe_lev(rs.getInt("commentRe_lev"));
				commentVO.setCommentRe_seq(rs.getInt("commentRe_seq"));
				return commentVO;
			}
		} catch (Exception e) {
			System.out.println("getComment()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return null;
	}
	
	// 마지막 댓글 가져오기
	public CommentVO getLastComment() {
		String sql = "";
		int num = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select max(commentNo) from comment";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1);
			} else {
				num = 1;
			}
			sql = "select * from comment where commentNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				CommentVO commentVO = new CommentVO();
				commentVO.setEventNo(rs.getInt("eventNo"));
				commentVO.setCommentContent(rs.getString("commentContent"));
				commentVO.setCommentWriteDate(rs.getTimestamp("commentWriteDate"));
				commentVO.setCommentNo(rs.getInt("commentNo"));
				commentVO.setUserId(rs.getString("userId"));
				commentVO.setUserName(rs.getString("userName"));
				commentVO.setCommentRe_ref(rs.getInt("commentRe_ref"));
				commentVO.setCommentRe_lev(rs.getInt("commentRe_lev"));
				commentVO.setCommentRe_seq(rs.getInt("commentRe_seq"));
				return commentVO;
			}
		} catch (Exception e) {
			System.out.println("getLastComment()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return null;
	}

	
	// 댓글 수정
	public int updateComment(int commentNo, String userId, String updateContent) {
		String sql = "select userId from comment where commentNo=?";
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (userId.equals(rs.getString("userId"))) {
					sql = "update comment set commentContent=?, commentWriteDate=curdate() where commentNo=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, updateContent);
					pstmt.setInt(2, commentNo);
					return pstmt.executeUpdate();
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			System.out.println("updateComment()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	} // updateComment

	public int replyComment(CommentVO commentVO, CommentVO parentVO) {
		String sql = "";
		int num = 0;

		if (commentVO.getCommentContent() == null || commentVO.getCommentContent().equals("")) {
			return -1;
		} else {
			try {
				conn = dbUtil.DBConnection.getConnection();
				sql = "select max(commentNo) from comment";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
				
				sql = "insert into comment(commentNo,eventNo,userId,userName,commentContent,commentWriteDate, commentRe_ref, commentRe_seq, commentRe_lev)"
						+ "values(?, ?, ?, ?, ?, now(), ?, ?, ?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, commentVO.getEventNo());
				pstmt.setString(3, commentVO.getUserId());
				pstmt.setString(4, commentVO.getUserName());
				pstmt.setString(5, commentVO.getCommentContent());
				pstmt.setInt(6, parentVO.getCommentRe_ref());
				pstmt.setInt(7, parentVO.getCommentRe_seq() + 1);
				pstmt.setInt(8, parentVO.getCommentRe_lev() + 1);

				return pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("replyComment()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}
		return 0;
	}
	
	// 부모글을 입력으로 받아서 sequence update
	public int replyUpdate(CommentVO parentVO) {
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "update comment set commentRe_seq = commentRe_seq + 1 where commentRe_ref = ?  and commentRe_seq > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parentVO.getCommentRe_ref());
			pstmt.setInt(2, parentVO.getCommentRe_seq());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("replyUpdate()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return -1;
	}
	
}



















