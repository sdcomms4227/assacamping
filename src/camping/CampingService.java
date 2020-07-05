package camping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CampingService {
	
	CampingDAO campingDAO;
	
	public CampingService() {		
		campingDAO = new CampingDAO();
	}

	public Map<String, Object> listCamping(Map<String, Object> searchMap) {
		
		Map<String, Object> campingListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> campingList = campingDAO.getCampingList(searchMap);
		campingListMap.put("campingList", campingList);
		
		int totalCount = campingDAO.getCampingListCount(searchMap);		
		campingListMap.put("totalCount", totalCount);
		
		return campingListMap;
	}

	public Map<String, Object> readCamping(int campingNo) {
		
		Map<String, Object> campingMap = new HashMap<String, Object>();
		
		campingDAO.incrementCampingCount(campingNo);
				
		CampingVO campingVO = campingDAO.getCamping(campingNo);
		campingMap.put("campingVO", campingVO);
		
		int campingCategoryNo = campingVO.getCampingCategoryNo();		
		String campingCategoryName = campingDAO.getCategoryName(campingCategoryNo);		
		campingMap.put("campingCategoryName", campingCategoryName);
		
		return campingMap;
	}

	public int insertCamping(CampingVO campingVO) {

		int maxNo = campingDAO.getCampingMaxNo();		
		campingDAO.insertCamping(campingVO, maxNo);		
		
		return maxNo;
	}

	public int updateCamping(CampingVO campingVO, String deleteFile) {		
		return campingDAO.updateCamping(campingVO, deleteFile);
	}

	public int deleteCamping(int campingNo) {		
		return campingDAO.deleteCamping(campingNo);		
	}

	public int insertReplyCamping(CampingVO campingVO) {
				
		campingDAO.updateCampingSequence(campingVO);

		int maxNo = campingDAO.getCampingMaxNo();		
		campingDAO.insertReplyCamping(campingVO, maxNo);
		
		return maxNo;
	}
}