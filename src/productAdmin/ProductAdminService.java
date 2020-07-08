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
		
		int totalCount = productDAO.getProductCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readProduct(int productNo) {						
		return productDAO.getProductItem(productNo);
	}

	public int insertProduct(ProductAdminVO productAdminVO) {
		
		int readNo = 0;
		int result = productDAO.insertProduct(productAdminVO);
		if(result>0) {
			readNo = productDAO.getProductLastNo();
		}
		
		return readNo;
	}

	public int updateProduct(ProductAdminVO productAdminVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		return productDAO.updateProduct(productAdminVO, originalImageNameMap, deleteFileMap);
	}

	public int deleteProduct(int productNo) {
		return productDAO.deleteProduct(productNo);		
	}
	
	public void updateProductQuantity(int productNo,int cartQuantity) {
		
		productDAO.updateProductQuantity(productNo, cartQuantity);
	}
}