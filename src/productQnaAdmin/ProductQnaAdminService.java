package productQnaAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import productQna.ProductQnaVO;

public class ProductQnaAdminService {

	ProductQnaAdminDAO productAdminADO;

	public ProductQnaAdminService() {
		productAdminADO = new ProductQnaAdminDAO();
	}

	public Map<String, Object> listProductQna(Map<String, Object> searchMap) {

		Map<String, Object> productQnaListMap = new HashMap<String, Object>();

		List<Map<String, Object>> productQnaList = productAdminADO.getProductQnaList(searchMap);
		productQnaListMap.put("productQnaList", productQnaList);

		int totalCount = productAdminADO.getProductQnaListCount(searchMap);
		productQnaListMap.put("totalCount", totalCount);

		return productQnaListMap;
	}

	public Map<String, Object> readProductQna(int qnaNo) {
		return productAdminADO.getProductQna(qnaNo);
	}

	public int updateProductQna(ProductQnaVO productQnaVO) {
		return productAdminADO.updateProductQna(productQnaVO);
	}

	public int deleteProductQna(int qnaNo) {
		return productAdminADO.deleteProductQna(qnaNo);
	}

}