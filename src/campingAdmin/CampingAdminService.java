package campingAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CampingAdminService {
	
	CampingAdminDAO campingDAO;
	
	public CampingAdminService() {		
		campingDAO = new CampingAdminDAO();
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
		
		Map<String, Object> campingItemMap = new HashMap<String, Object>();
		
		campingDAO.incrementCampingReadCount(campingNo);
				
		CampingAdminVO campingVO = campingDAO.getCampingItem(campingNo);
		campingItemMap.put("campingVO", campingVO);
		
		int campingCategoryNo = campingVO.getCampingCategoryNo();		
		String campingCategoryName = campingDAO.getCategoryName(campingCategoryNo);		
		campingItemMap.put("campingCategoryName", campingCategoryName);
		
		return campingItemMap;
	}

	public int insertCamping(CampingAdminVO campingVO) {

		int maxNo = campingDAO.getCampingMaxNo();		
		campingDAO.insertCamping(campingVO, maxNo);		
		
		return maxNo;
	}

	public int updateCamping(CampingAdminVO campingVO, String deleteFile) {		
		return campingDAO.updateCamping(campingVO, deleteFile);
	}

	public int deleteCamping(int campingNo) {		
		return campingDAO.deleteCamping(campingNo);		
	}

	public int insertReplyCamping(CampingAdminVO campingVO) {
				
		campingDAO.updateCampingSequence(campingVO);

		int maxNo = campingDAO.getCampingMaxNo();		
		campingDAO.insertReplyCamping(campingVO, maxNo);
		
		return maxNo;
	}
}