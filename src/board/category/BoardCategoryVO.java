package board.category;

public class BoardCategoryVO {

	private int boardCategoryNo;
	private String boardCategoryName;
	
	public BoardCategoryVO() {}
	
	public BoardCategoryVO(int boardCategoryNo, String boardCategoryName) {
		super();
		this.boardCategoryNo = boardCategoryNo;
		this.boardCategoryName = boardCategoryName;
	}

	public int getBoardCategoryNo() {
		return boardCategoryNo;
	}

	public void setBoardCategoryNo(int boardCategoryNo) {
		this.boardCategoryNo = boardCategoryNo;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}

}
