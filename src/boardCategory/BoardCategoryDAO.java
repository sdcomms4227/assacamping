package boardCategory;

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

	public List<BoardCategoryVO> selectAllBoardCategorys(){
		List<BoardCategoryVO> boardCategorysList = new ArrayList<BoardCategoryVO>();
		
		try {
			conn = util.DBConnection.getConnection();
			
			String sql = "select * from boardCategory";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardCategoryNo = rs.getInt("boardCategoryNo");
				String boardCategoryName = rs.getString("boardCategoryName");
				
				BoardCategoryVO boardCategoryVO = new BoardCategoryVO(boardCategoryNo, boardCategoryName);				
				boardCategorysList.add(boardCategoryVO);
			}
			
		} catch(Exception e) {
			System.out.println("selectAllBoardCategorys()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
				
		return boardCategorysList;
	}
	

}
