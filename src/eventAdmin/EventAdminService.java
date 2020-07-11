package eventAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import event.EventVO;

public class EventAdminService {
	
	EventAdminDAO eveAdminDAO;
	
	public EventAdminService() {		
		eveAdminDAO = new EventAdminDAO();
	}

	public Map<String, Object> listEvent(Map<String, Object> searchMap) {
		
		Map<String, Object> eventListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> eventList = eveAdminDAO.getEventList(searchMap);
		eventListMap.put("eventList", eventList);
		
		int totalCount = eveAdminDAO.getEventListCount(searchMap);		
		eventListMap.put("totalCount", totalCount);
		
		return eventListMap;
	}

	public Map<String, Object> readEvent(int eventNo) {
		
		Map<String, Object> eventMap = new HashMap<String, Object>();
		
		eveAdminDAO.incrementEventCount(eventNo);
				
		EventVO eventVO = eveAdminDAO.getEvent(eventNo);
		eventMap.put("eventVO", eventVO);
		
		return eventMap;
	}

	public int insertEvent(EventVO eventVO) {

		int maxNo = eveAdminDAO.getEventMaxNo();		
		eveAdminDAO.insertEvent(eventVO, maxNo);		
		
		return maxNo;
	}

	public int updateEvent(EventVO eventVO, String deleteFile) {		
		return eveAdminDAO.updateEvent(eventVO, deleteFile);
	}

	public int deleteEvent(int eventNo) {		
		return eveAdminDAO.deleteEvent(eventNo);		
	}

}