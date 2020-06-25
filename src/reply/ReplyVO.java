package reply;

import java.sql.Timestamp;

public class ReplyVO {

	private int boardCategoryNo;
	private int boardNo;
	private int replyNo;
	private String replyContent;
	private String userId;
	private String userName;
	private int replyRe_ref;
	private int replyRe_lev;
	private int replyRe_seq;
	private Timestamp replyWriteDate;
		
	public int getBoardCategoryNo() {
		return boardCategoryNo;
	}
	public void setBoardCategoryNo(int boardCategoryNo) {
		this.boardCategoryNo = boardCategoryNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReplyRe_ref() {
		return replyRe_ref;
	}
	public void setReplyRe_ref(int replyRe_ref) {
		this.replyRe_ref = replyRe_ref;
	}
	public int getReplyRe_lev() {
		return replyRe_lev;
	}
	public void setReplyRe_lev(int replyRe_lev) {
		this.replyRe_lev = replyRe_lev;
	}
	public int getReplyRe_seq() {
		return replyRe_seq;
	}
	public void setReplyRe_seq(int replyRe_seq) {
		this.replyRe_seq = replyRe_seq;
	}
	public Timestamp getReplyWriteDate() {
		return replyWriteDate;
	}
	public void setReplyWriteDate(Timestamp replyWriteDate) {
		this.replyWriteDate = replyWriteDate;
	}
	
	
	
}
