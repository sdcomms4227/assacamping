package qnaAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import qna.ProductQnaVO;

public class QnaAdminService {

	QnaAdminDAO qnaAdminADO;

	public QnaAdminService() {
		qnaAdminADO = new QnaAdminDAO();
	}

	public Map<String, Object> listProductQna(Map<String, Object> searchMap) {

		Map<String, Object> productQnaListMap = new HashMap<String, Object>();

		List<Map<String, Object>> productQnaList = qnaAdminADO.getProductQnaList(searchMap);
		productQnaListMap.put("productQnaList", productQnaList);

		int totalCount = qnaAdminADO.getProductQnaListCount(searchMap);
		productQnaListMap.put("totalCount", totalCount);

		return productQnaListMap;
	}

	public Map<String, Object> readProductQna(int qnaNo) {
		return qnaAdminADO.getProductQna(qnaNo);
	}

	public int updateProductQna(ProductQnaVO productQnaVO) {
		return qnaAdminADO.updateProductQna(productQnaVO);
	}

	public int deleteProductQna(int qnaNo) {
		return qnaAdminADO.deleteProductQna(qnaNo);
	}

}