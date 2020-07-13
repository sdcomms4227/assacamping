package campingAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import camping.CampingVO;

public class CampingAdminService {
	
	CampingAdminDAO campingAdminDAO;
	
	public CampingAdminService() {		
		campingAdminDAO = new CampingAdminDAO();
	}

	public Map<String, Object> listCamping(Map<String, Object> searchMap) {
		
		Map<String, Object> campingListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> campingList = campingAdminDAO.getCampingList(searchMap);
		campingListMap.put("campingList", campingList);
		
		int totalCount = campingAdminDAO.getCampingListCount(searchMap);		
		campingListMap.put("totalCount", totalCount);
		
		return campingListMap;
	}

	public Map<String, Object> readCamping(int campingNo) {
		
		Map<String, Object> campingMap = new HashMap<String, Object>();
		
		campingAdminDAO.incrementCampingCount(campingNo);
				
		CampingVO campingVO = campingAdminDAO.getCamping(campingNo);
		campingMap.put("campingVO", campingVO);
		
		int campingCategoryNo = campingVO.getCampingCategoryNo();		
		String campingCategoryName = campingAdminDAO.getCategoryName(campingCategoryNo);		
		campingMap.put("campingCategoryName", campingCategoryName);
		
		return campingMap;
	}

	public int insertCamping(CampingVO campingVO) {

		int maxNo = campingAdminDAO.getCampingMaxNo();		
		campingAdminDAO.insertCamping(campingVO, maxNo);		
		
		return maxNo;
	}

	public int updateCamping(CampingVO campingVO, String deleteFile) {		
		return campingAdminDAO.updateCamping(campingVO, deleteFile);
	}

	public int deleteCamping(int campingNo) {		
		return campingAdminDAO.deleteCamping(campingNo);		
	}

	public int insertReplyCamping(CampingVO campingVO) {
				
		campingAdminDAO.updateCampingSequence(campingVO);

		int maxNo = campingAdminDAO.getCampingMaxNo();		
		campingAdminDAO.insertReplyCamping(campingVO, maxNo);
		
		return maxNo;
	}
}