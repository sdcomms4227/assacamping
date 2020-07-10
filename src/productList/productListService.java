package productList;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class productListService {
productListDAO proDAO;
	
	public productListService() {
		proDAO = new productListDAO();
	}
	
	public Map<String, Object> listProduct(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = proDAO.getProductList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = proDAO.getProductCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}
	
	public productListVO getOnePro(int productNo){
		
		productListVO onePro = new productListVO();
		onePro = proDAO.selectOnePro(productNo); 
		return onePro;
	}
}
