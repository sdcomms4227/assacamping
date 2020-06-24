package camping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CampingService {
	
	CampingDAO campingDAO;
	
	public CampingService() {		
		campingDAO = new CampingDAO();
	}

	public Map listCamping(Map pagingMap) {
		
		Map campingMap = new HashMap();
		
		List<CampingVO> campingList = campingDAO.selectAllCamping(pagingMap);
		
		int total = campingDAO.selectTotalCamping();
		
		campingMap.put("campingList", campingList);
		campingMap.put("total", total);
		
		return campingMap;
	}

	public List<CampingVO> listCamping() {
		return campingDAO.selectAllCamping();
	}
}