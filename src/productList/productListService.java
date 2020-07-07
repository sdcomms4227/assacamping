package productList;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class productListService {
productListDAO proDAO;
	
	public productListService() {
		proDAO = new productListDAO();
	}
	
	public List<Map<String,Object> getProductList(Map<String, Object> searchMap) {
		
		return proDAO.getProductList();
		
	}
	
	public Map<String, Object> getProductItem(int productNo) {
		return proDAO.getProductItem(productNo);
		
	}
}
