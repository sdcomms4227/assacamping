package board;

import java.util.List;




public class BoardService {

	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}

	//BoardController서블릿 클래스에서 호출 당하는 메소드로
	//BoardDAO객체의 selectAllBoard()메소드를 호출해 전체 글을 검색해서 가져와서 
	//BoardController서블릿으로 리턴(반환)해주는 메소드 
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

boardDAO.deleteArticle(boardNo);//삭제 요청시 삭제할 글번호 전달

return boardNoList; //삭제할 글 번호 목록을 컨트롤러로 반환합니다.
	}	
	
	
}
