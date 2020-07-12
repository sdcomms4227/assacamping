package orderAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import order.OrderVO;

public class OrderAdminService {
	
	OrderAdminDAO proAdminDAO;
	
	public OrderAdminService() {		
		proAdminDAO = new OrderAdminDAO();
	}

	public Map<String, Object> listOrder(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = proAdminDAO.getOrderList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = proAdminDAO.getOrderCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readOrder(int productNo) {						
		return proAdminDAO.getOrder(productNo);
	}

	public int insertOrder(OrderVO orderVO) {
		
		int readNo = 0;
		int result = proAdminDAO.insertOrder(orderVO);
		if(result>0) {
			readNo = proAdminDAO.getOrderLastNo();
		}
		
		return readNo;
	}

	public int updateOrder(OrderVO orderVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		return proAdminDAO.updateOrder(orderVO, originalImageNameMap, deleteFileMap);
	}

	public int deleteOrder(int productNo) {
		return proAdminDAO.deleteOrder(productNo);		
	}
	
	public void updateOrderQuantity(int productNo,int cartQuantity) {
		proAdminDAO.updateOrderQuantity(productNo, cartQuantity);
	}
}