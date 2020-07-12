package eventAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import event.EventVO;

public class EventAdminService {
	
	EventAdminDAO eventAdminDAO;
	
	public EventAdminService() {		
		eventAdminDAO = new EventAdminDAO();
	}

	public Map<String, Object> listEvent(Map<String, Object> searchMap) {
		
		Map<String, Object> eventListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> eventList = eventAdminDAO.getEventList(searchMap);
		eventListMap.put("eventList", eventList);
		
		int totalCount = eventAdminDAO.getEventListCount(searchMap);		
		eventListMap.put("totalCount", totalCount);
		
		return eventListMap;
	}

	public Map<String, Object> readEvent(int eventNo) {
		
		Map<String, Object> eventMap = new HashMap<String, Object>();
		
		eventAdminDAO.incrementEventReadCount(eventNo);
				
		EventVO eventVO = eventAdminDAO.getEvent(eventNo);
		eventMap.put("eventVO", eventVO);
		
		return eventMap;
	}

	public int insertEvent(EventVO eventVO) {

		int maxNo = eventAdminDAO.getEventMaxNo();		
		eventAdminDAO.insertEvent(eventVO, maxNo);		
		
		return maxNo;
	}

	public int updateEvent(EventVO eventVO, String deleteFile) {		
		return eventAdminDAO.updateEvent(eventVO, deleteFile);
	}

	public int deleteEvent(int eventNo) {		
		return eventAdminDAO.deleteEvent(eventNo);		
	}

}