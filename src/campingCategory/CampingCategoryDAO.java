package campingCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CampingCategoryDAO {
	
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

	public List<CampingCategoryVO> listCampingCategory(){
		List<CampingCategoryVO> campingCategoryList = new ArrayList<CampingCategoryVO>();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "select * from campingCategory";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int campingCategoryNo = rs.getInt("campingCategoryNo");
				String campingCategoryName = rs.getString("campingCategoryName");
				
				CampingCategoryVO campingCategoryVO = new CampingCategoryVO(campingCategoryNo, campingCategoryName);				
				campingCategoryList.add(campingCategoryVO);
			}
			
		} catch(Exception e) {
			System.out.println("listCampingCategory()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
				
		return campingCategoryList;
	}

	public int insertCampingCategory(CampingCategoryVO campingCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String campingCategoryName = campingCategoryVO.getCampingCategoryName();
			String sql = "insert into campingCategory(campingCategoryName) values(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, campingCategoryName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertCampingCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}

	public int updateCampingCategory(CampingCategoryVO campingCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			int campingCategoryNo = campingCategoryVO.getCampingCategoryNo();
			String campingCategoryName = campingCategoryVO.getCampingCategoryName();
			String sql = "update campingCategory set campingCategoryName = ? where campingCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, campingCategoryName);
			pstmt.setInt(2, campingCategoryNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateCampingCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}

	public int deleteCampingCategory(int campingCategoryNo) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from campingCategory where campingCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingCategoryNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteCampingCategory()메소드 내부에서 오류 : " + e.toString());
		}			
		
		return 0;	
	}

}
