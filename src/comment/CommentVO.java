package comment;

import java.sql.Timestamp;

public class CommentVO {

	
	private int eventNo;
	private int commentNo;
	private String commentContent;
	private String userId;
	private String userName;
	private int commentRe_ref;
	private int commentRe_lev;
	private int commentRe_seq;
	private Timestamp commentWriteDate;
	
	
	// getter, setter method
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getCommentRe_ref() {
		return commentRe_ref;
	}
	public void setCommentRe_ref(int commentRe_ref) {
		this.commentRe_ref = commentRe_ref;
	}
	public int getCommentRe_lev() {
		return commentRe_lev;
	}
	public void setCommentRe_lev(int commentRe_lev) {
		this.commentRe_lev = commentRe_lev;
	}
	public int getCommentRe_seq() {
		return commentRe_seq;
	}
	public void setCommentRe_seq(int commentRe_seq) {
		this.commentRe_seq = commentRe_seq;
	}
	public Timestamp getCommentWriteDate() {
		return commentWriteDate;
	}
	public void setCommentWriteDate(Timestamp commentWriteDate) {
		this.commentWriteDate = commentWriteDate;
	}
	
	
}
