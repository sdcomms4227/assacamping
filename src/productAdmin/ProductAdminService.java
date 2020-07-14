package productAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import product.ProductVO;

public class ProductAdminService {
	
	ProductAdminDAO productAdminDAO;
	
	public ProductAdminService() {		
		productAdminDAO = new ProductAdminDAO();
	}

	public Map<String, Object> listProduct(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = productAdminDAO.getProductList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = productAdminDAO.getProductCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readProduct(int productNo) {						
		return productAdminDAO.getProduct(productNo);
	}

	public int insertProduct(ProductVO productVO) {
		
		int readNo = 0;
		int result = productAdminDAO.insertProduct(productVO);
		if(result>0) {
			readNo = productAdminDAO.getProductLastNo();
		}
		
		return readNo;
	}

	public int updateProduct(ProductVO productVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		return productAdminDAO.updateProduct(productVO, originalImageNameMap, deleteFileMap);
	}

	public int deleteProduct(int productNo) {
		return productAdminDAO.deleteProduct(productNo);		
	}
	
	public void updateProductQuantity(int productNo,int cartQuantity) {
		productAdminDAO.updateProductQuantity(productNo, cartQuantity);
	}
}