package eventAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import event.EventVO;

public class EventAdminDAO {
	
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

	public List<Map<String,Object>> getEventList(Map<String, Object> searchMap) {

		List<Map<String,Object>> eventList = new ArrayList<Map<String,Object>>();

		int numberPerPage = 10;
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			sql = "	select *"
					+ " from event"
					+ " where eventTitle like ?"
					+ " order by eventNo desc"
					+ "	limit ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			pstmt.setInt(2, offset);
			pstmt.setInt(3, numberPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
//				Map<String, Object> eventMap = new HashMap<String, Object>();
//				EventVO eventVO = new EventVO();
//				
//				eventVO.setEventCategoryNo(rs.getInt("eventCategoryNo"));
//				eventVO.setEventContent(rs.getString("eventContent"));
//				eventVO.setEventFileName(rs.getString("eventFileName"));
//				eventVO.setEventNo(rs.getInt("eventNo"));
//				eventVO.setEventRe_lev(rs.getInt("eventRe_lev"));
//				eventVO.setEventRe_ref(rs.getInt("eventRe_ref"));
//				eventVO.setEventRe_seq(rs.getInt("eventRe_seq"));
//				eventVO.setEventCount(rs.getInt("eventCount"));
//				eventVO.setEventTitle(rs.getString("eventTitle"));
//				eventVO.setEventDate(rs.getTimestamp("eventDate"));
//				eventVO.setUserId(rs.getString("userId"));
//				eventVO.setUserId(rs.getString("userName"));
//								
//				eventMap.put("eventVO", eventVO);
//								
//				eventList.add(eventMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getEventList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return eventList;		
	}


	public int getEventListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();			

			sql = "select count(eventNo) from event"
					+ " where eventTitle like ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getEventListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
	
	public EventVO getEvent(int eventNo) {
		
		EventVO eventVO = new EventVO();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from event where eventNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eventNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				eventVO.setEventCategoryNo(rs.getInt("eventCategoryNo"));
//				eventVO.setEventContent(rs.getString("eventContent"));
//				eventVO.setEventFileName(rs.getString("eventFileName"));
//				eventVO.setEventNo(rs.getInt("eventNo"));
//				eventVO.setEventRe_lev(rs.getInt("eventRe_lev"));
//				eventVO.setEventRe_ref(rs.getInt("eventRe_ref"));
//				eventVO.setEventRe_seq(rs.getInt("eventRe_seq"));
//				eventVO.setEventCount(rs.getInt("eventCount"));
//				eventVO.setEventTitle(rs.getString("eventTitle"));
//				eventVO.setEventDate(rs.getTimestamp("eventDate"));
//				eventVO.setUserId(rs.getString("userId"));
//				eventVO.setUserId(rs.getString("userName"));
			}			
			
		} catch(Exception e) {
			System.out.println("getEvent()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return eventVO;
	}

	public int incrementEventCount(int eventNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update event set eventCount=eventCount+1 where eventNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eventNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("incrementEventCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int getEventMaxNo() {
		
		int maxNo = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "select max(eventNo) from event";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNo = rs.getInt(1) + 1;
			}else {
				maxNo = 1;
			}
			
		} catch(Exception e) {
			System.out.println("getEventMaxNo()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return maxNo;
	}
	
	public int insertEvent(EventVO eventVO, int maxNo) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
//			String sql = "insert into event(eventNo, eventTitle, eventContent, eventFileName, userId, userName, eventRe_ref, eventRe_lev, eventRe_seq, eventDate, eventCount, eventCategoryNo)"
//					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			String sql = "";
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, maxNo);
//			pstmt.setString(2, eventVO.getEventTitle());
//			pstmt.setString(3, eventVO.getEventContent());
//			pstmt.setString(4, eventVO.getEventFileName());
//			pstmt.setString(5, eventVO.getUserId());
//			pstmt.setString(6, eventVO.getUserName());
//			pstmt.setInt(7, maxNo);
//			pstmt.setInt(8, 0);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, 0);
//			pstmt.setInt(11, eventVO.getEventCategoryNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertEvent()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int updateEvent(EventVO eventVO, String deleteFile) {
		
//		String eventFileName = eventVO.getEventFileName();
//				
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			
//			if(eventFileName!=null) {				
//				String sql = "update event set eventTitle=?, eventContent=?, eventFileName=?, eventCategoryNo=? where eventNo=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, eventVO.getEventTitle());
//				pstmt.setString(2, eventVO.getEventContent());
//				pstmt.setString(3, eventFileName);
//				pstmt.setInt(4, eventVO.getEventCategoryNo());
//				pstmt.setInt(5, eventVO.getEventNo());				
//			}else if(deleteFile!=null){				
//				String sql = "update event set eventTitle=?, eventContent=?, eventFileName=?, eventCategoryNo=? where eventNo=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, eventVO.getEventTitle());
//				pstmt.setString(2, eventVO.getEventContent());
//				pstmt.setString(3, null);
//				pstmt.setInt(4, eventVO.getEventCategoryNo());
//				pstmt.setInt(5, eventVO.getEventNo());
//			}else{
//				String sql = "update event set eventTitle=?, eventContent=?, eventCategoryNo=? where eventNo=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, eventVO.getEventTitle());
//				pstmt.setString(2, eventVO.getEventContent());
//				pstmt.setInt(3, eventVO.getEventCategoryNo());
//				pstmt.setInt(4, eventVO.getEventNo());
//			}
//			
//			return pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("updateEvent()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
		
		return 0;
	}

	public int deleteEvent(int eventNo) {
		
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "delete from event where eventNo=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, eventNo);
//			
//			return pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("deleteEvent()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}		
		
		return 0;
	}
	
}