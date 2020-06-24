package camping;

import java.sql.Timestamp;

public class CampingVO {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardFileName;
	private String userId;
	private int boardRe_ref;
	private int boardRe_lev;
	private int boardRe_seq;
	private Timestamp boardWriteDate;
	private int boardReadCount;
	private int boardCategoryNo;
		
	public CampingVO() {}

	public CampingVO(int boardNo, String boardTitle, String boardContent, String boardFileName, String userId, int boardRe_ref, int boardRe_lev, int boardRe_seq, Timestamp boardWriteDate,
			int boardReadCount, int boardCategoryNo) {
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardFileName = boardFileName;
		this.userId = userId;
		this.boardRe_ref = boardRe_ref;
		this.boardRe_lev = boardRe_lev;
		this.boardRe_seq = boardRe_seq;
		this.boardWriteDate = boardWriteDate;
		this.boardReadCount = boardReadCount;
		this.boardCategoryNo = boardCategoryNo;
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

	public String getBoardFileName() {
		return boardFileName;
	}

	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
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

	public int getBoardCategoryNo() {
		return boardCategoryNo;
	}

	public void setBoardCategoryNo(int boardCategoryNo) {
		this.boardCategoryNo = boardCategoryNo;
	}
	
}
