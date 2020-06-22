package boardCategory;

import java.util.List;

public class BoardCategoryService {

	BoardCategoryDAO boardCategoryDAO;
	
	public BoardCategoryService() {
		boardCategoryDAO = new BoardCategoryDAO();
	}
	
	public List<BoardCategoryVO> listBoardCategorys(){
		List<BoardCategoryVO> boardCategorysList = boardCategoryDAO.selectAllBoardCategorys();
		return boardCategorysList;
	}
}
