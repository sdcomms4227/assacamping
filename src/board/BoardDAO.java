package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

   public void closeDB() {
	   if(conn != null) try { conn.close(); } catch(Exception e) {}
	   if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
	   if(rs != null) try { rs.close(); } catch(Exception e) {}
    }
//전체 글 조회 
//selectAllBoard(각페이지마다 맨위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글개수)   
public List selectAllBoard(){

	String sql = "";	
	
	//검색한 글 정보들을 저장할 용도
	List boardList = new ArrayList();

	try {
		conn = dbUtil.DBConnection.getConnection();
		
		sql = "select * from board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		 
			BoardVO board = new BoardVO();
	
			 board.setBoardNo(rs.getInt("boardNo"));
			 board.setBoardRe_ref(rs.getInt("boardRe_ref"));
			 board.setBoardRe_lev(rs.getInt("boardRe_lev"));
			 board.setBoardRe_seq(rs.getInt("boardRe_seq"));
			 board.setBoardTitle(rs.getString("boardTitle"));
			 board.setBoardContent(rs.getString("boardContent"));
			 board.setUserId(rs.getString("userId"));
			 board.setBoardReadCount(rs.getInt("boardReadCount"));
			 board.setBoardWriteDate(rs.getTimestamp("boardWriteDate"));
			
			boardList.add(board);	
		}		
		closeDB();
						
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return boardList;

   }//selectAllBoard()메소드 끝

//DB에 새글 추가하기 전에, DB에 존재하는 가장 최신글번호 검색해서 가져오는 메소드
public int getNewBoardNo() {
	 int boardNo=0;
	
	try{
		
		conn = dbUtil.DBConnection.getConnection();
		
		String sql = "select max(boardNo) from board";
		
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			
			boardNo =(rs.getInt(1) + 1); //가장 큰 글번호에 1를 더한 번호 반환
		}else {
			boardNo = 1;
		}
		
		
		
	}catch (Exception e) {
		System.out.println("getNewBoardNo메소드 에서 예외 : " + e);
	}finally {
		closeDB();
	}
	return boardNo; //아래의 insertNewArticle메소드로 반환
	
	
}//getNewBoardNo()메소드

//DB에 추가할 새글번호(최신글번호+1) 얻어와 insert 실행
public int insertNewArticle(BoardVO board) {
	
	int boardNo = getNewBoardNo(); //DB에 새로 추가할 새글 글번호 얻기
	
	try {
		
		conn = dbUtil.DBConnection.getConnection();
		
		int boardRe_ref = board.getBoardRe_ref();
		String boardTitle = board.getBoardTitle();
		String boardContent= board.getBoardContent();
		String userId = board.getUserId();
		int boardRe_lev= board.getBoardRe_lev();
		int boardRe_seq = board.getBoardRe_seq();
		String boardImageFileName = board.getBoardImageFileName();
		
	String sql = "insert into board(boardNo, boardRe_ref,boardRe_lev,boardRe_seq, boardTitle,"
			   +" boardContent, boardImageFileName, userId,boardReadCount)"
			   +" values(?,?,?,?,?,?,?,?,0)";
	
	pstmt = conn.prepareStatement(sql);
		
	pstmt.setInt(1, boardNo);
	pstmt.setInt(2, boardNo); //boardNo 주글번호 기준 == boardRe_ref 그룹번호
	pstmt.setInt(3, boardRe_lev);
	pstmt.setInt(4, boardRe_seq);
	pstmt.setString(5, boardTitle);
	pstmt.setString(6, boardContent);
	pstmt.setString(7, boardImageFileName);
	pstmt.setString(8, userId);

	pstmt.executeUpdate();//INSERT	
	
	closeDB();
			   
	}catch (Exception e) {
		System.out.println("insertNewArticle메소드 내부에서 예외발생: " + e);
	}
	
	return boardNo;
	
}//insertNewArticle()메소드 

//글번호를 이용해 하나의 글정보 조회후 반환할 메소드
public BoardVO selectArticle(int boardNo) {
	
	BoardVO board = new BoardVO();
	
	try {
		conn = dbUtil.DBConnection.getConnection();
		
		
		 String sql = "select boardRe_ref, boardNo, boardTitle,"
				   +"boardContent, boardImageFileName, userId, boardReadCount, boardWriteDate"
				   +" from board where boardNo=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		rs=pstmt.executeQuery();
		rs.next();
		
		int _boardNo = rs.getInt("boardNo");
		int boardRe_ref = rs.getInt("boardRe_ref");
		String boardTitle = rs.getString("boardTitle");
		String boardContent = rs.getString("boardContent");
		int boardReadCount = rs.getInt("boardReadCount")+1;
		String boardImageFileName = rs.getString("boardImageFileName");
		String userId = rs.getString("userId");
		Timestamp boardWriteDate = rs.getTimestamp("boardWriteDate");	
		
		System.out.println(boardReadCount +"조회수");
		
		board.setBoardNo(_boardNo);
		board.setBoardRe_ref(boardRe_ref);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setBoardImageFileName(boardImageFileName);
		board.setUserId(userId);
		board.setBoardWriteDate(boardWriteDate);
		board.setBoardReadCount(boardReadCount);

		closeDB();	
		
	} catch (Exception e) {
		System.out.println("selectArticle메소드 내부에서 예외발생 : " + e);
	}
	
	return board;
	
}//selectArticle
public void updateArticle(BoardVO board) {
		int boardNo = board.getBoardNo();
		String title = board.getBoardTitle();
		String content = board.getBoardContent();
		String imageFileName = board.getBoardImageFileName();
		
		System.out.println(board.getBoardNo() +"update제목");
		System.out.println(board.getBoardTitle()+"update파일내용");
		System.out.println(board.getBoardImageFileName()+"update파일네임");
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update board  set boardTitle=?, boardContent=?";
			
			//수정된 이미지 파일이 있을때만 imageFileNmae을 SQL문에 추가 합니다.
			if (imageFileName != null && imageFileName.length() != 0) {
				sql += ",boardImageFileName=?";
			}
			//수정된 이미지 파일이 없을때는 뒤에 where절만 붙인다.
			sql += " where boardNo=?";
			
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			//이미지 파일을 수정하는 경우 설정
			if (imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);
				pstmt.setInt(4, boardNo);
			
			//이미지 파일을 수정하지 않은 경우를 구분해서  설정 
			} else {
				pstmt.setInt(3, boardNo);
			}
			
			pstmt.executeUpdate(); //UPDATE구문 실행
			
			//자원해제
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	
    }
public List<Integer> selectRemovedArticles(int boardNo) {
	//삭제할 글들의 boardNo를 저장할 용도
	List<Integer> boardNoList = new ArrayList<Integer>();
	
	try {
		//커넥션풀로 부터 커넥션 얻기(DB연결)
		conn = dbUtil.DBConnection.getConnection();
		
		String sql = "SELECT * FROM board where boardNo = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			boardNo = rs.getInt("boardNo");
			boardNoList.add(boardNo);
		}

		closeDB();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	return boardNoList;
  }

public void deleteArticle(int boardNo) {
	try {
		//커넥션풀로부터 커넥션얻기
		conn = dbUtil.DBConnection.getConnection();
		//SQL문 만들기 :  삭제 글과 관련된 자식글까지 모두 삭제
		String sql = "DELETE FROM board ";
			   sql += "WHERE boardNo=? ;";
			   
			   
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.executeUpdate(); //delete
		
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
public void updateReadCount(int boardNo) {

	try {		
		conn = dbUtil.DBConnection.getConnection();
		
		String sql = "update board set boardReadCount= boardReadCount +1 where boardNo=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
				
		pstmt.executeUpdate();	   	
	
} catch (Exception e) {
	System.out.println("updateReadCount 메소드에서 예외 발생 : " + e);
}

	closeDB();
 }
}