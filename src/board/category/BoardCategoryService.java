package board.category;

import java.util.List;

public class BoardCategoryService {

	BoardCategoryDAO boardCategoryDAO;
	
	public BoardCategoryService() {
		boardCategoryDAO = new BoardCategoryDAO();
	}
	
	public List<BoardCategoryVO> listBoardCategory(){
		return boardCategoryDAO.selectAllBoardCategory();
	}

	public int addBoardCategory(BoardCategoryVO boardCategoryVO) {
		return boardCategoryDAO.insertNewBoardCategory(boardCategoryVO);
		
	}

	public int updateBoardCategory(BoardCategoryVO boardCategoryVO) {
		return boardCategoryDAO.updateBoardCategory(boardCategoryVO);
	}

	public int deleteBoardCategory(int boardCategoryNo) {
		return boardCategoryDAO.deleteBoardCategory(boardCategoryNo);		
	}
}
