package productAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductAdminService {
	
	ProductAdminDAO productDAO;
	
	public ProductAdminService() {		
		productDAO = new ProductAdminDAO();
	}

	public Map<String, Object> listProduct(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = productDAO.getProductList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = productDAO.getProductListCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readProduct(int productNo) {
		
		Map<String, Object> productItemMap = new HashMap<String, Object>();
				
		ProductAdminVO productAdminVO = productDAO.getProductItem(productNo);
		productItemMap.put("productAdminVO", productAdminVO);
		
		int productCategoryNo = productAdminVO.getProductCategoryNo();		
		String productCategoryName = productDAO.getCategoryName(productCategoryNo);		
		productItemMap.put("productCategoryName", productCategoryName);
		
		return productItemMap;
	}

	public int insertProduct(ProductAdminVO productAdminVO) {
		
		int readNo = 0;
		int result = productDAO.insertProduct(productAdminVO);
		if(result>0) {
			readNo = productDAO.getProductLastNo();
		}
		
		return readNo;
	}

	public int updateProduct(ProductAdminVO productAdminVO) {		
		return productDAO.updateProduct(productAdminVO);
	}

	public int deleteProduct(int productNo) {		
		return productDAO.deleteProduct(productNo);		
	}
}