package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplyDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void freeResource() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	} 
	
	// 댓글달기
	public int insertReply(ReplyVO replyVO) {
		String sql = "";
		int num = 0;

		if(replyVO.getReplyContent()==null || replyVO.getReplyContent().equals("")) {
			return -1;
		}else {
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
				
				/*
				수정해야할 부분
				sql = "insert into reply(replyNum,boardId,boardNum,userId,userName,replyContent,replyDate)"
						+ "values(?,?,?,?,?,?,now())";
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, replyBean.getBoardId());
				pstmt.setInt(3, replyBean.getBoardNum());
				pstmt.setString(4, replyBean.getUserId());
				pstmt.setString(5, replyBean.getUserName());
				pstmt.setString(6, replyBean.getReplyContent());
				*/
				return pstmt.executeUpdate();
	
			} catch (Exception e) {
				System.out.println("insertReply()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}
		
		return 0; 
	} //insertReply
	
}
