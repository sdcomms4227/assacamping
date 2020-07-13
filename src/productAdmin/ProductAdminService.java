package productAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import product.ProductVO;

public class ProductAdminService {
	
	ProductAdminDAO proAdminDAO;
	
	public ProductAdminService() {		
		proAdminDAO = new ProductAdminDAO();
	}

	public Map<String, Object> listProduct(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = proAdminDAO.getProductList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = proAdminDAO.getProductCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readProduct(int productNo) {						
		return proAdminDAO.getProduct(productNo);
	}

	public int insertProduct(ProductVO productVO) {
		
		int readNo = 0;
		int result = proAdminDAO.insertProduct(productVO);
		if(result>0) {
			readNo = proAdminDAO.getProductLastNo();
		}
		
		return readNo;
	}

	public int updateProduct(ProductVO productVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		return proAdminDAO.updateProduct(productVO, originalImageNameMap, deleteFileMap);
	}

	public int deleteProduct(int productNo) {
		return proAdminDAO.deleteProduct(productNo);		
	}
	
	public void updateProductQuantity(int productNo,int cartQuantity) {
		proAdminDAO.updateProductQuantity(productNo, cartQuantity);
	}
}