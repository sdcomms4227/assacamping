package contact;

import java.util.List;

import faqAdmin.FaqVO;

public class ContactService {

	ContactDAO faqDAO;

	public ContactService() {
		faqDAO = new ContactDAO();
	}

	public List<FaqVO> listFaq() {
		List<FaqVO> faqList = faqDAO.getFaqList();
		return faqList;
	}
}