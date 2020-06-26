package camping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import campingCategory.CampingCategoryVO;

public class CampingService {
	
	CampingDAO campingDAO;
	
	public CampingService() {		
		campingDAO = new CampingDAO();
	}

	public Map<String, Object> listCamping(Map<String, Object> pagingMap) {
		
		Map<String, Object> campingListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> campingList = campingDAO.getCampingList(pagingMap);
		
		int total = campingDAO.getCampingListCount(pagingMap);
		
		campingListMap.put("campingList", campingList);		
		campingListMap.put("total", total);
		
		return campingListMap;
	}

	public Map<String, Object> readCamping(int campingNo) {
		
		Map<String, Object> campingItemMap = new HashMap<String, Object>();
		
		campingDAO.incrementCampingReadCount(campingNo);
		
		CampingVO campingVO = campingDAO.getCampingItem(campingNo);
		
		int campingCategoryNo = campingVO.getCampingCategoryNo();		
		String campingCategoryName = campingDAO.getCategoryName(campingCategoryNo);
		
		campingItemMap.put("campingVO", campingVO);
		campingItemMap.put("campingCategoryName", campingCategoryName);
		
		return campingItemMap;
	}

	public int insertCamping(CampingVO campingVO) {

		int maxNo = campingDAO.getCampingMaxNo();
		campingDAO.insertCamping(campingVO, maxNo);
		
		return maxNo;
	}

	public void updateCamping(CampingVO campingVO) {		
		campingDAO.updateCamping(campingVO);		
	}

	public void deleteCamping(int campingNo) {
		campingDAO.deleteCamping(campingNo);
	}

	public int insertReplyCamping(CampingVO campingVO) {
				
		campingDAO.updateCampingSequence(campingVO);

		int maxNo = campingDAO.getCampingMaxNo();
		campingDAO.insertReplyCamping(campingVO, maxNo);
		
		return maxNo;
	}
}