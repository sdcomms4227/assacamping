package campingAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import camping.CampingVO;

public class CampingAdminService {
	
	CampingAdminDAO campAdminDAO;
	
	public CampingAdminService() {		
		campAdminDAO = new CampingAdminDAO();
	}

	public Map<String, Object> listCamping(Map<String, Object> searchMap) {
		
		Map<String, Object> campingListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> campingList = campAdminDAO.getCampingList(searchMap);
		campingListMap.put("campingList", campingList);
		
		int totalCount = campAdminDAO.getCampingListCount(searchMap);		
		campingListMap.put("totalCount", totalCount);
		
		return campingListMap;
	}

	public Map<String, Object> readCamping(int campingNo) {
		
		Map<String, Object> campingMap = new HashMap<String, Object>();
		
		campAdminDAO.incrementCampingCount(campingNo);
				
		CampingVO campingVO = campAdminDAO.getCamping(campingNo);
		campingMap.put("campingVO", campingVO);
		
		int campingCategoryNo = campingVO.getCampingCategoryNo();		
		String campingCategoryName = campAdminDAO.getCategoryName(campingCategoryNo);		
		campingMap.put("campingCategoryName", campingCategoryName);
		
		return campingMap;
	}

	public int insertCamping(CampingVO campingVO) {

		int maxNo = campAdminDAO.getCampingMaxNo();		
		campAdminDAO.insertCamping(campingVO, maxNo);		
		
		return maxNo;
	}

	public int updateCamping(CampingVO campingVO, String deleteFile) {		
		return campAdminDAO.updateCamping(campingVO, deleteFile);
	}

	public int deleteCamping(int campingNo) {		
		return campAdminDAO.deleteCamping(campingNo);		
	}

	public int insertReplyCamping(CampingVO campingVO) {
				
		campAdminDAO.updateCampingSequence(campingVO);

		int maxNo = campAdminDAO.getCampingMaxNo();		
		campAdminDAO.insertReplyCamping(campingVO, maxNo);
		
		return maxNo;
	}
}