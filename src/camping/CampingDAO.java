package camping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import camping.CampingVO;

public class CampingDAO {
	
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

	public List<CampingVO> selectAllCamping() {
		List<CampingVO> campingList = new ArrayList<CampingVO>();

		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "select * from camping order by boardRe_ref desc, boardRe_seq asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CampingVO campingVO = new CampingVO();
				
				campingVO.setBoardCategoryNo(rs.getInt("boardCategoryNo"));
				campingVO.setBoardContent(rs.getString("boardContent"));
				campingVO.setBoardFileName(rs.getString("boardFileName"));
				campingVO.setBoardNo(rs.getInt("boardNo"));
				campingVO.setBoardRe_lev(rs.getInt("boardRe_lev"));
				campingVO.setBoardRe_ref(rs.getInt("boardRe_ref"));
				campingVO.setBoardRe_seq(rs.getInt("boardRe_seq"));
				campingVO.setBoardReadCount(rs.getInt("boardReadCount"));
				campingVO.setBoardTitle(rs.getString("boardTitle"));
				campingVO.setBoardWriteDate(rs.getTimestamp("boardWriteDate"));
				campingVO.setUserId(rs.getString("userId"));
								
				campingList.add(campingVO);
			}
			
		} catch(Exception e) {
			System.out.println("selectAllCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
				
		return campingList;
		
	}//selectAllCamping()

	public int selectTotalCamping() {

		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "select count(boardNo) from camping";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("selectTotalCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
		
	}//selectTotalCamping()

	public List<CampingVO> selectAllCamping(Map pagingMap) {

		List campingList = new ArrayList();
		
		int section = (Integer)pagingMap.get("section");
		int pageNum = (Integer)pagingMap.get("pageNum");
		int startNum = (section - 1)*100 + (pageNum - 1)*10;

		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "	select * from camping order by boardRe_ref desc, boardRe_seq asc"
					+ "		limit ?, 10";
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CampingVO campingVO = new CampingVO();
				
				campingVO.setBoardCategoryNo(rs.getInt("boardCategoryNo"));
				campingVO.setBoardContent(rs.getString("boardContent"));
				campingVO.setBoardFileName(rs.getString("boardFileName"));
				campingVO.setBoardNo(rs.getInt("boardNo"));
				campingVO.setBoardRe_lev(rs.getInt("boardRe_lev"));
				campingVO.setBoardRe_ref(rs.getInt("boardRe_ref"));
				campingVO.setBoardRe_seq(rs.getInt("boardRe_seq"));
				campingVO.setBoardReadCount(rs.getInt("boardReadCount"));
				campingVO.setBoardTitle(rs.getString("boardTitle"));
				campingVO.setBoardWriteDate(rs.getTimestamp("boardWriteDate"));
				campingVO.setUserId(rs.getString("userId"));
								
				campingList.add(campingVO);
			}
			
			
		} catch(Exception e) {
			System.out.println("selectAllCamping(Map)메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return campingList;
	}//selectAllCamping(Map)

}









