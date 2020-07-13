package qna;

import java.sql.Timestamp;

public class QnaVO {
	private int productNo;
	private int qnaNo;
	private String qnaContent;
	private String userId;
	private String userName;
	private Timestamp qnaDate;
	private String qnaAnswer;
	private Timestamp qnaAnswerDate;
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
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
	public Timestamp getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Timestamp qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public Timestamp getQnaAnswerDate() {
		return qnaAnswerDate;
	}
	public void setQnaAnswerDate(Timestamp qnaAnswerDate) {
		this.qnaAnswerDate = qnaAnswerDate;
	}
	
}
