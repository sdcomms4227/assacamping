package campingAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import camping.CampingVO;

public class CampingAdminDAO {
	
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

	public List<Map<String,Object>> getCampingList(Map<String, Object> searchMap) {

		List<Map<String,Object>> campingList = new ArrayList<Map<String,Object>>();

		int numberPerPage = 10;
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			if(searchCategoryNo==0) {
				sql = "	select *"
						+ " from camping cp"
						+ " join campingCategory ct"
						+ " on cp.campingCategoryNo = ct.campingCategoryNo"
						+ " where cp.campingTitle like ?"
						+ " order by cp.campingRe_ref desc, cp.campingRe_seq asc"
						+ "	limit ?, ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, offset);
				pstmt.setInt(3, numberPerPage);
			}else {
				sql = "	select *"
						+ " from camping cp"
						+ " join campingCategory ct"
						+ " on cp.campingCategoryNo = ct.campingCategoryNo"
						+ " where cp.campingTitle like ?"
						+ " and cp.campingCategoryNo = ?"
						+ " order by cp.campingRe_ref desc, cp.campingRe_seq asc"
						+ "	limit ?, ?";		
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, numberPerPage);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> campingMap = new HashMap<String, Object>();
				CampingVO campingVO = new CampingVO();
				
				campingVO.setCampingCategoryNo(rs.getInt("campingCategoryNo"));
				campingVO.setCampingContent(rs.getString("campingContent"));
				campingVO.setCampingFileName(rs.getString("campingFileName"));
				campingVO.setCampingNo(rs.getInt("campingNo"));
				campingVO.setCampingRe_lev(rs.getInt("campingRe_lev"));
				campingVO.setCampingRe_ref(rs.getInt("campingRe_ref"));
				campingVO.setCampingRe_seq(rs.getInt("campingRe_seq"));
				campingVO.setCampingCount(rs.getInt("campingCount"));
				campingVO.setCampingTitle(rs.getString("campingTitle"));
				campingVO.setCampingDate(rs.getTimestamp("campingDate"));
				campingVO.setUserId(rs.getString("userId"));
				campingVO.setUserId(rs.getString("userName"));
				
				String campingCategoryName = rs.getString("campingCategoryName");
				
				campingMap.put("campingVO", campingVO);
				campingMap.put("campingCategoryName", campingCategoryName);
								
				campingList.add(campingMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getCampingList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return campingList;		
	}


	public int getCampingListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();			

			if(searchCategoryNo==0) {
				sql = "select count(campingNo) from camping"
						+ " where campingTitle like ?";
						
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
			}else {
				sql = "select count(campingNo) from camping"
						+ " where campingTitle like ?"
						+ " and campingCategoryNo = ?";
						
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
			}			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getCampingListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
	
	public CampingVO getCamping(int campingNo) {
		
		CampingVO campingVO = new CampingVO();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from camping where campingNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				campingVO.setCampingCategoryNo(rs.getInt("campingCategoryNo"));
				campingVO.setCampingContent(rs.getString("campingContent"));
				campingVO.setCampingFileName(rs.getString("campingFileName"));
				campingVO.setCampingNo(rs.getInt("campingNo"));
				campingVO.setCampingRe_lev(rs.getInt("campingRe_lev"));
				campingVO.setCampingRe_ref(rs.getInt("campingRe_ref"));
				campingVO.setCampingRe_seq(rs.getInt("campingRe_seq"));
				campingVO.setCampingCount(rs.getInt("campingCount"));
				campingVO.setCampingTitle(rs.getString("campingTitle"));
				campingVO.setCampingDate(rs.getTimestamp("campingDate"));
				campingVO.setUserId(rs.getString("userId"));
				campingVO.setUserId(rs.getString("userName"));
			}			
			
		} catch(Exception e) {
			System.out.println("getCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return campingVO;
	}

	public String getCategoryName(int categoryNo) {
		
		String campingCategoryName = null;
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from campingCategory where campingCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				campingCategoryName = rs.getString("campingCategoryName");
			}			
			
		} catch(Exception e) {
			System.out.println("getCategoryName()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return campingCategoryName;
	}

	public int incrementCampingCount(int campingNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update camping set campingCount=campingCount+1 where campingNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("incrementCampingCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int getCampingMaxNo() {
		
		int maxNo = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "select max(campingNo) from camping";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNo = rs.getInt(1) + 1;
			}else {
				maxNo = 1;
			}
			
		} catch(Exception e) {
			System.out.println("getCampingMaxNo()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return maxNo;
	}
	
	public int insertCamping(CampingVO campingVO, int maxNo) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into camping(campingNo, campingTitle, campingContent, campingFileName, userId, userName, campingRe_ref, campingRe_lev, campingRe_seq, campingDate, campingCount, campingCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxNo);
			pstmt.setString(2, campingVO.getCampingTitle());
			pstmt.setString(3, campingVO.getCampingContent());
			pstmt.setString(4, campingVO.getCampingFileName());
			pstmt.setString(5, campingVO.getUserId());
			pstmt.setString(6, campingVO.getUserName());
			pstmt.setInt(7, maxNo);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, campingVO.getCampingCategoryNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int updateCamping(CampingVO campingVO, String deleteFile) {
		
		String campingFileName = campingVO.getCampingFileName();
				
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			if(campingFileName!=null) {				
				String sql = "update camping set campingTitle=?, campingContent=?, campingFileName=?, campingCategoryNo=? where campingNo=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, campingVO.getCampingTitle());
				pstmt.setString(2, campingVO.getCampingContent());
				pstmt.setString(3, campingFileName);
				pstmt.setInt(4, campingVO.getCampingCategoryNo());
				pstmt.setInt(5, campingVO.getCampingNo());				
			}else if(deleteFile!=null){				
				String sql = "update camping set campingTitle=?, campingContent=?, campingFileName=?, campingCategoryNo=? where campingNo=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, campingVO.getCampingTitle());
				pstmt.setString(2, campingVO.getCampingContent());
				pstmt.setString(3, null);
				pstmt.setInt(4, campingVO.getCampingCategoryNo());
				pstmt.setInt(5, campingVO.getCampingNo());
			}else{
				String sql = "update camping set campingTitle=?, campingContent=?, campingCategoryNo=? where campingNo=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, campingVO.getCampingTitle());
				pstmt.setString(2, campingVO.getCampingContent());
				pstmt.setInt(3, campingVO.getCampingCategoryNo());
				pstmt.setInt(4, campingVO.getCampingNo());
			}
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("updateCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int deleteCamping(int campingNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from camping where campingNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("deleteCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}		
		
		return 0;
	}

	public int updateCampingSequence(CampingVO campingVO) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update camping set campingRe_seq=campingRe_seq+1 where campingRe_ref=? and campingRe_seq>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingVO.getCampingRe_ref());
			pstmt.setInt(2, campingVO.getCampingRe_seq());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("updateCampingSequence()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}	
		
		return 0;
	}

	public int insertReplyCamping(CampingVO campingVO, int maxNo) {
		
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into camping(campingNo, campingTitle, campingContent, campingFileName, userId, userName, campingRe_ref, campingRe_lev, campingRe_seq, campingDate, campingCount, campingCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxNo);
			pstmt.setString(2, campingVO.getCampingTitle());
			pstmt.setString(3, campingVO.getCampingContent());
			pstmt.setString(4, campingVO.getCampingFileName());
			pstmt.setString(5, campingVO.getUserId());
			pstmt.setString(6, campingVO.getUserName());
			pstmt.setInt(7, campingVO.getCampingRe_ref());
			pstmt.setInt(8, campingVO.getCampingRe_lev() + 1);
			pstmt.setInt(9, campingVO.getCampingRe_seq() + 1);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, campingVO.getCampingCategoryNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertReplyCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}
	
}