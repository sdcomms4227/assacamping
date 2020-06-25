package campingCategory;

import java.util.List;

public class CampingCategoryService {

	CampingCategoryDAO campingCategoryDAO;
	
	public CampingCategoryService() {
		campingCategoryDAO = new CampingCategoryDAO();
	}
	
	public List<CampingCategoryVO> listCampingCategory(){
		return campingCategoryDAO.listCampingCategory();
	}

	public int insertCampingCategory(CampingCategoryVO campingCategoryVO) {
		return campingCategoryDAO.insertCampingCategory(campingCategoryVO);
		
	}

	public int updateCampingCategory(CampingCategoryVO campingCategoryVO) {
		return campingCategoryDAO.updateCampingCategory(campingCategoryVO);
	}

	public int deleteCampingCategory(int campingCategoryNo) {
		return campingCategoryDAO.deleteCampingCategory(campingCategoryNo);		
	}
}
