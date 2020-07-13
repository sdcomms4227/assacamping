package faqAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FaqAdminService {
	
	FaqAdminDAO faqAdminDAO;
	
	public FaqAdminService() {		
		faqAdminDAO = new FaqAdminDAO();
	}

	public Map<String, Object> listFaq(Map<String, Object> searchMap) {
		
		Map<String, Object> faqListMap = new HashMap<String, Object>();
		
		List<FaqVO> faqList = faqAdminDAO.getFaqList(searchMap);
		faqListMap.put("faqList", faqList);
		
		int totalCount = faqAdminDAO.getFaqListCount(searchMap);		
		faqListMap.put("totalCount", totalCount);
		
		return faqListMap;
	}

	public FaqVO readFaq(int faqNo) {						
		return faqAdminDAO.getFaq(faqNo);
	}

	public int insertFaq(FaqVO faqVO) {
		
		int readNo = 0;
		int result = faqAdminDAO.insertFaq(faqVO);
		if(result>0) {
			readNo = faqAdminDAO.getFaqLastNo();
		}
		
		return readNo;
	}

	public int updateFaq(FaqVO faqVO) {		
		return faqAdminDAO.updateFaq(faqVO);
	}

	public int deleteFaq(int faqNo) {		
		return faqAdminDAO.deleteFaq(faqNo);		
	}
}