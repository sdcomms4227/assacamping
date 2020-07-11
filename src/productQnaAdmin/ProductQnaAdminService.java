package productQnaAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import productQna.ProductQnaVO;

public class ProductQnaAdminService {

	ProductQnaAdminDAO proAdminADO;

	public ProductQnaAdminService() {
		proAdminADO = new ProductQnaAdminDAO();
	}

	public Map<String, Object> listProductQna(Map<String, Object> searchMap) {

		Map<String, Object> productQnaListMap = new HashMap<String, Object>();

		List<Map<String, Object>> productQnaList = proAdminADO.getProductQnaList(searchMap);
		productQnaListMap.put("productQnaList", productQnaList);

		int totalCount = proAdminADO.getProductQnaListCount(searchMap);
		productQnaListMap.put("totalCount", totalCount);

		return productQnaListMap;
	}

	public Map<String, Object> readProductQna(int qnaNo) {
		return proAdminADO.getProductQna(qnaNo);
	}

	public int updateProductQna(ProductQnaVO productQnaVO) {
		return proAdminADO.updateProductQna(productQnaVO);
	}

	public int deleteProductQna(int qnaNo) {
		return proAdminADO.deleteProductQna(qnaNo);
	}

}