package board.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardCategoryDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void freeResource() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public List<BoardCategoryVO> selectAllBoardCategory(){
		List<BoardCategoryVO> boardCategoryList = new ArrayList<BoardCategoryVO>();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "select * from boardCategory";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardCategoryNo = rs.getInt("boardCategoryNo");
				String boardCategoryName = rs.getString("boardCategoryName");
				
				BoardCategoryVO boardCategoryVO = new BoardCategoryVO(boardCategoryNo, boardCategoryName);				
				boardCategoryList.add(boardCategoryVO);
			}
			
		} catch(Exception e) {
			System.out.println("selectAllBoardCategory()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
				
		return boardCategoryList;
	}

	public int insertNewBoardCategory(BoardCategoryVO boardCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String boardCategoryName = boardCategoryVO.getBoardCategoryName();
			String sql = "insert into boardCategory(boardCategoryName) values(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardCategoryName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertNewBoardCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}

	public int updateBoardCategory(BoardCategoryVO boardCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			int boardCategoryNo = boardCategoryVO.getBoardCategoryNo();
			String boardCategoryName = boardCategoryVO.getBoardCategoryName();
			String sql = "update boardCategory set boardCategoryName = ? where boardCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardCategoryName);
			pstmt.setInt(2, boardCategoryNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateBoardCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}

	public int deleteBoardCategory(int boardCategoryNo) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from boardCategory where boardCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCategoryNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteBoardCategory()메소드 내부에서 오류 : " + e.toString());
		}			
		
		return 0;	
	}

}
