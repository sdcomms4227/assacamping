package board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BoardService {

	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}

	//전체 글 조회
	public List<BoardVO> listBoard() {
		List<BoardVO> boardList = boardDAO.selectAllBoard(); 
		return boardList;
	}

	public int addArticle(BoardVO board) {
		
		  return boardDAO.insertNewArticle(board);
			
		}
    //글정보 조회하는 명령
	public BoardVO viewArticle(int boardNo) {
	
		BoardVO board = null;
		
		board = boardDAO.selectArticle(boardNo);
		
		
		return board;
	}

	public void modArticle(BoardVO board) {
		boardDAO.updateArticle(board);
		
	}

	public List<Integer> removeArticle(int boardNo) {
		List<Integer> boardNoList = boardDAO.selectRemovedArticles(boardNo);

		boardDAO.deleteArticle(boardNo);

return boardNoList; 
	}

	public int addReply(BoardVO boardVO) {
		
		return boardDAO.reInsertNewArticle(boardVO);
	} 

	public Map listBoard(Map pagingMap) {
		
		Map boardMap = new HashMap();

		List<BoardVO> boardList = boardDAO.selectAllArticles(pagingMap);
		int totArticles = boardDAO.selectToArticles(pagingMap);
		
		boardMap.put("boardList", boardList);
		boardMap.put("totArticles", totArticles);
		
		return boardMap;
	}	
}
	
	
