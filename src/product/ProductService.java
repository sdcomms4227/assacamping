package product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService {
	
	ProductDAO productDAO;
	
	public ProductService() {		
		productDAO = new ProductDAO();
	}

	public Map<String, Object> listProduct(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = productDAO.getProductList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = productDAO.getProductCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readProduct(int productNo) {						
		return productDAO.getProduct(productNo);
	}

	public int updateProductRating(int productNo, int avgRating) {
		return productDAO.updateProductRating(productNo, avgRating);
	}
}