package qna;

import java.util.List;

public class ProductQnaService {

	ProductQnaDAO productQnaDAO;
	
	public ProductQnaService() {
		productQnaDAO = new ProductQnaDAO();
	}
	
	public List<ProductQnaVO> getQnaList(int productNo) {
		return productQnaDAO.getQnaList(productNo);
	}

	public int insertQna(ProductQnaVO productQnaVO) {
		// TODO Auto-generated method stub
		return productQnaDAO.insertQna(productQnaVO);
	}

	public int deleteQna(int qnaNo, String userId) {
		return productQnaDAO.deleteQna(qnaNo, userId);
	}

}
