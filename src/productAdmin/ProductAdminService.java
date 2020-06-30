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

//	public Map<String, Object> readProduct(int productNo) {
//		
//		Map<String, Object> productItemMap = new HashMap<String, Object>();
//		
//		productDAO.incrementProductReadCount(productNo);
//		
//		ProductVO productVO = productDAO.getProductItem(productNo);
//		productItemMap.put("productVO", productVO);
//		
//		int productCategoryNo = productVO.getProductCategoryNo();		
//		String productCategoryName = productDAO.getCategoryName(productCategoryNo);		
//		productItemMap.put("productCategoryName", productCategoryName);
//		
//		return productItemMap;
//	}
//
//	public int insertProduct(ProductVO productVO) {
//
//		int maxNo = productDAO.getProductMaxNo();		
//		productDAO.insertProduct(productVO, maxNo);		
//		
//		return maxNo;
//	}
//
//	public int updateProduct(ProductVO productVO, String deleteFile) {		
//		return productDAO.updateProduct(productVO, deleteFile);
//	}
//
//	public int deleteProduct(int productNo) {		
//		return productDAO.deleteProduct(productNo);		
//	}
//
//	public int insertReplyProduct(ProductVO productVO) {
//				
//		productDAO.updateProductSequence(productVO);
//
//		int maxNo = productDAO.getProductMaxNo();		
//		productDAO.insertReplyProduct(productVO, maxNo);
//		
//		return maxNo;
//	}
}