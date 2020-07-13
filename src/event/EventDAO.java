package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EventDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

   public void closeDB() {
	   if(conn != null) try { conn.close(); } catch(Exception e) {}
	   if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
	   if(rs != null) try { rs.close(); } catch(Exception e) {}
    }
   
//전체 글 조회 
public List selectAllEvent(){
	String sql = "";		
	List eventList = new ArrayList();

	try {
		conn = dbUtil.DBConnection.getConnection();		
		sql = "select * from event order by eventNo desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {		 
			 EventVO event = new EventVO();	
			 event.setEventNo(rs.getInt("eventNo"));
			 event.setEventTitle(rs.getString("eventTitle"));
			 event.setEventContent(rs.getString("eventContent"));
			 event.setEventReadCount(rs.getInt("eventReadCount"));
			 event.setEventWriteDate(rs.getTimestamp("eventWriteDate"));			
			 eventList.add(event);	
		}		
		closeDB();
						
	}catch (Exception e) {
		e.printStackTrace();
	}	
	return eventList;

   }

public int getNewEventNo() {
	 int eventNo=0;
	
	try{		
		conn = dbUtil.DBConnection.getConnection();		
		String sql = "select max(eventNo) from event";		
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {			
			eventNo =(rs.getInt(1) + 1);
		}else {
			eventNo = 1;
		}				
	}catch (Exception e) {
		System.out.println("getNewEventNo메소드 에서 예외 : " + e);
	}finally {
		closeDB();
	}
	return eventNo; 
		
}

public int insertNewEvent(EventVO event) {
	
	int eventNo = getNewEventNo(); //DB에 새로 추가할 새글 글번호 얻기	
	try {	
		conn = dbUtil.DBConnection.getConnection();		
		String eventTitle = event.getEventTitle();
		String eventContent= event.getEventContent();
		String eventImageFileName = event.getEventImageFileName();
		
	String sql = "insert into event(eventNo, eventTitle,"
			   +" eventContent, eventImageFileName, eventReadCount)"
			   +" values(?,?,?,?,0)";
	
	pstmt = conn.prepareStatement(sql);		
	pstmt.setInt(1, eventNo);
	pstmt.setString(2, eventTitle);
	pstmt.setString(3, eventContent);
	pstmt.setString(4, eventImageFileName);

	pstmt.executeUpdate();	
			   
	}catch (Exception e) {
		System.out.println("insertNewEvent메소드 내부에서 예외발생: " + e);
	}finally {
		closeDB();
	}
	
	return eventNo;
	
}

public EventVO selectEvent(int eventNo) {
	
	EventVO event = new EventVO();
	
	try {
		conn = dbUtil.DBConnection.getConnection();
				
		 String sql = "select eventNo, eventTitle,"
				   +"eventContent, eventImageFileName, eventReadCount, eventWriteDate"
				   +" from event where eventNo=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, eventNo);
		rs=pstmt.executeQuery();
		rs.next();
		
		int _eventNo = rs.getInt("eventNo");
		String eventTitle = rs.getString("eventTitle");
		String eventContent = rs.getString("eventContent");
		int eventReadCount = rs.getInt("eventReadCount")+1;
		String eventImageFileName = rs.getString("eventImageFileName");
		Timestamp eventWriteDate = rs.getTimestamp("eventWriteDate");	
				
		event.setEventNo(_eventNo);
		event.setEventTitle(eventTitle);
		event.setEventContent(eventContent);
		event.setEventImageFileName(eventImageFileName);
		event.setEventWriteDate(eventWriteDate);
		event.setEventReadCount(eventReadCount);

		closeDB();	
		
	} catch (Exception e) {
		System.out.println("selectEvent메소드 내부에서 예외발생 : " + e);
	}
	
	return event;
	
}

public void updateEvent(EventVO event) {
		int eventNo = event.getEventNo();
		String title = event.getEventTitle();
		String content = event.getEventContent();
		String imageFileName = event.getEventImageFileName();

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update event set eventTitle=?, eventContent=?";
			
			if (imageFileName != null && imageFileName.length() != 0) {
				sql += ",eventImageFileName=?";
			}
			sql += " where eventNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			if (imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);
				pstmt.setInt(4, eventNo);

			} else {
				pstmt.setInt(3, eventNo);
			}
			pstmt.executeUpdate(); 			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}	
	
    }
public List<Integer> selectRemovedEvents(int eventNo) {
	
	List<Integer> eventNoList = new ArrayList<Integer>();
	
	try {
		conn = dbUtil.DBConnection.getConnection();
		
		String sql = "SELECT * FROM event where eventNo = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, eventNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			eventNo = rs.getInt("eventNo");
			eventNoList.add(eventNo);
		}
		closeDB();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	return eventNoList;
  }

public void deleteEvent(int eventNo) {
	try {
		conn = dbUtil.DBConnection.getConnection();

		String sql = "DELETE FROM event ";
			   sql += "WHERE eventNo=? ;";			   		   
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, eventNo);
		pstmt.executeUpdate(); 
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
public void updateReadCount(int eventNo) {

	try {		
		conn = dbUtil.DBConnection.getConnection();
		
		String sql = "update event set eventReadCount= eventReadCount +1 where eventNo=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, eventNo);				
		pstmt.executeUpdate();	   	
	
	} catch (Exception e) {
	System.out.println("updateReadCount 메소드에서 예외 발생 : " + e);
	}

	closeDB();
 	}


public List selectAllEvents(Map pagingMap) {
	List eventList = new ArrayList();
	
	int section = (Integer)pagingMap.get("section");
	int pageNum = (Integer)pagingMap.get("pageNum"); 
	int startNum = (section - 1)*27 + (pageNum - 1)*9;
	String search = (String) pagingMap.get("search");
	
	try {	
		conn = dbUtil.DBConnection.getConnection();
		String sql = "select * from event"
					+ " where eventTitle like ?"
					+ " order by eventNo desc"
					+ " limit ?, 9";
					
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,"%"+search +"%");
		pstmt.setInt(2,startNum);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {			
			EventVO event = new EventVO();
			
			 event.setEventNo(rs.getInt("eventNo"));
			 event.setEventTitle(rs.getString("eventTitle"));
			 event.setEventContent(rs.getString("eventContent"));
			 event.setEventImageFileName(rs.getString("eventImageFileName"));
			 event.setEventReadCount(rs.getInt("eventReadCount"));
			 event.setEventWriteDate(rs.getTimestamp("eventWriteDate"));
			
			eventList.add(event);	
		}		
			
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
	 closeDB();
	}
	
	return eventList;
}

public int selectToEvents(Map pagingMap) {
	
		int section = (Integer)pagingMap.get("section");
		int pageNum = (Integer)pagingMap.get("pageNum"); 
		int startNum = (section - 1)*27 + (pageNum - 1)*9;
		String search = (String) pagingMap.get("search");
	
	try {
		conn = dbUtil.DBConnection.getConnection();
		
		String sql = "select count(eventNo) from event where eventTitle like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,'%'+search+'%');
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
	} catch(Exception e) {
		System.out.println("selectToEvents 메소드 내부에서 오류 : " + e);
	} finally {
		closeDB();
	}
	return 0;
   }

}
