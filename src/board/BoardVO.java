package board;

import java.sql.Timestamp;

public class BoardVO {
	private int boardNo; 
	private String boardTitle;
	private String boardContent;
	private String boardImageFileName;
	private String userId;
	private int boardRe_ref; //그룹번호
	private int boardRe_lev; //들여쓰기
	private int boardRe_seq; //답글순서
	private Timestamp boardWriteDate;
	private int boardReadCount; //조회수
	
  public BoardVO() {
  }

public BoardVO(int boardNo, String boardTitle, String boardContent, String boardImageFileName, String userId) {
	super();
	this.boardNo = boardNo;
	this.boardTitle = boardTitle;
	this.boardContent = boardContent;
	this.boardImageFileName = boardImageFileName;
	this.userId = userId;
}

public int getBoardNo() {
	return boardNo;
}

public void setBoardNo(int boardNo) {
	this.boardNo = boardNo;
}

public String getBoardTitle() {
	return boardTitle;
}

public void setBoardTitle(String boardTitle) {
	this.boardTitle = boardTitle;
}

public String getBoardContent() {
	return boardContent;
}

public void setBoardContent(String boardContent) {
	this.boardContent = boardContent;
}

public String getBoardImageFileName() {
	return boardImageFileName;
}

public void setBoardImageFileName(String boardImageFileName) {
	this.boardImageFileName = boardImageFileName;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public int getBoardRe_ref() {
	return boardRe_ref;
}

public void setBoardRe_ref(int boardRe_ref) {
	this.boardRe_ref = boardRe_ref;
}

public int getBoardRe_lev() {
	return boardRe_lev;
}

public void setBoardRe_lev(int boardRe_lev) {
	this.boardRe_lev = boardRe_lev;
}

public int getBoardRe_seq() {
	return boardRe_seq;
}

public void setBoardRe_seq(int boardRe_seq) {
	this.boardRe_seq = boardRe_seq;
}

public Timestamp getBoardWriteDate() {
	return boardWriteDate;
}

public void setBoardWriteDate(Timestamp boardWriteDate) {
	this.boardWriteDate = boardWriteDate;
}

public int getBoardReadCount() {
	return boardReadCount;
}

public void setBoardReadCount(int boardReadCount) {
	this.boardReadCount = boardReadCount;
}



	
}
