package camping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<Map<String,Object>> getCampingList(Map<String, Object> searchMap) {

		List<Map<String,Object>> campingList = new ArrayList<Map<String,Object>>();
		
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
						+ "	limit ?, 10";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, offset);
			}else {
				sql = "	select *"
						+ " from camping cp"
						+ " join campingCategory ct"
						+ " on cp.campingCategoryNo = ct.campingCategoryNo"
						+ " where cp.campingTitle like ?"
						+ " and cp.campingCategoryNo = ?"
						+ " order by cp.campingRe_ref desc, cp.campingRe_seq asc"
						+ "	limit ?, 10";		
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
				pstmt.setInt(3, offset);
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
				campingVO.setCampingReadCount(rs.getInt("campingReadCount"));
				campingVO.setCampingTitle(rs.getString("campingTitle"));
				campingVO.setCampingWriteDate(rs.getTimestamp("campingWriteDate"));
				campingVO.setUserId(rs.getString("userId"));
				
				String campingCategoryName = rs.getString("campingCategoryName");
				
				campingMap.put("campingVO", campingVO);
				campingMap.put("campingCategoryName", campingCategoryName);
								
				campingList.add(campingMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getCampingList(Map)메소드 내부에서 오류 : " + e.toString());
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
	
	public CampingVO getCampingItem(int campingNo) {
		
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
				campingVO.setCampingReadCount(rs.getInt("campingReadCount"));
				campingVO.setCampingTitle(rs.getString("campingTitle"));
				campingVO.setCampingWriteDate(rs.getTimestamp("campingWriteDate"));
				campingVO.setUserId(rs.getString("userId"));
			}			
			
		} catch(Exception e) {
			System.out.println("getCampingItem()메소드 내부에서 오류 : " + e.toString());
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

	public void incrementCampingReadCount(int campingNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update camping set campingReadCount=campingReadCount+1 where campingNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingNo);
			pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("incrementCampingReadCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
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
	
	public void insertCamping(CampingVO campingVO, int maxNo) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into camping(campingNo, campingTitle, campingContent, campingFileName, userId, campingRe_ref, campingRe_lev, campingRe_seq, campingWriteDate, campingReadCount, campingCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxNo);
			pstmt.setString(2, campingVO.getCampingTitle());
			pstmt.setString(3, campingVO.getCampingContent());
			pstmt.setString(4, null);
			pstmt.setString(5, campingVO.getUserId());
			pstmt.setInt(6, maxNo);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, campingVO.getCampingCategoryNo());
			pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}		
	}

	public void updateCamping(CampingVO campingVO) {
		
		int campingNo = campingVO.getCampingNo();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update camping set campingTitle=?, campingContent=?, campingCategoryNo=? where campingNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, campingVO.getCampingTitle());
			pstmt.setString(2, campingVO.getCampingContent());
			pstmt.setInt(3, campingVO.getCampingCategoryNo());
			pstmt.setInt(4, campingNo);
			pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
	}

	public void deleteCamping(int campingNo) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from camping where campingNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingNo);
			pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("deleteCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}		
	}

	public void updateCampingSequence(CampingVO campingVO) {		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update camping set campingRe_seq=campingRe_seq+1 where campingRe_ref=? and campingRe_seq>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, campingVO.getCampingRe_ref());
			pstmt.setInt(2, campingVO.getCampingRe_seq());
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("updateCampingSequence()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}		
	}

	public void insertReplyCamping(CampingVO campingVO, int maxNo) {
		
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into camping(campingNo, campingTitle, campingContent, campingFileName, userId, campingRe_ref, campingRe_lev, campingRe_seq, campingWriteDate, campingReadCount, campingCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxNo);
			pstmt.setString(2, campingVO.getCampingTitle());
			pstmt.setString(3, campingVO.getCampingContent());
			pstmt.setString(4, null);
			pstmt.setString(5, campingVO.getUserId());
			pstmt.setInt(6, campingVO.getCampingRe_ref());
			pstmt.setInt(7, campingVO.getCampingRe_lev() + 1);
			pstmt.setInt(8, campingVO.getCampingRe_seq() + 1);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, campingVO.getCampingCategoryNo());
			pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertReplyCamping()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}		
	}
	
}









