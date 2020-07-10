package event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import event.EventVO;


public class EventService {

	EventDAO eventDAO;
	
	public EventService() {
		eventDAO = new EventDAO();
	}

	//전체 글 조회
	public Map listEvent(Map pagingMap) {
		Map eventMap = new HashMap();
		List<EventVO> eventList = eventDAO.selectAllEvents(pagingMap);
		int totEvents = eventDAO.selectToEvents(pagingMap);
		eventMap.put("eventList", eventList);
		eventMap.put("totEvents", totEvents);		
		return eventMap;
	}

	//글 추가
	public int addEvent(EventVO event) {		
		  return eventDAO.insertNewEvent(event);			
	}
	
    //글정보 조회하는 명령
	public EventVO viewEvent(int eventNo) {	
		EventVO event = null;		
		event = eventDAO.selectEvent(eventNo);				
		return event;
	}
	//글 수정
	public void modEvent(EventVO event) {
		eventDAO.updateEvent(event);	
	}
	//글 삭제
	public List<Integer> removeEvent(int eventNo) {
		List<Integer> eventNoList = eventDAO.selectRemovedEvents(eventNo);
		eventDAO.deleteEvent(eventNo);
		return eventNoList; 
	}

}
	
	
