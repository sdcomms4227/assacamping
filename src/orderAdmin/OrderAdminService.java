package orderAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import order.OrderVO;

public class OrderAdminService {
	
	OrderAdminDAO orderAdminDAO;
	
	public OrderAdminService() {		
		orderAdminDAO = new OrderAdminDAO();
	}

	public Map<String, Object> listOrder(Map<String, Object> searchMap) {
		
		Map<String, Object> productListMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> productList = orderAdminDAO.getOrderList(searchMap);
		productListMap.put("productList", productList);
		
		int totalCount = orderAdminDAO.getOrderCount(searchMap);
		productListMap.put("totalCount", totalCount);
		
		return productListMap;
	}

	public Map<String, Object> readOrder(int productNo) {						
		return orderAdminDAO.getOrder(productNo);
	}

	public int insertOrder(OrderVO orderVO) {
		
		int readNo = 0;
		int result = orderAdminDAO.insertOrder(orderVO);
		if(result>0) {
			readNo = orderAdminDAO.getOrderLastNo();
		}
		
		return readNo;
	}

	public int updateOrder(OrderVO orderVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		return orderAdminDAO.updateOrder(orderVO, originalImageNameMap, deleteFileMap);
	}

	public int deleteOrder(int productNo) {
		return orderAdminDAO.deleteOrder(productNo);		
	}
	
	public void updateOrderQuantity(int productNo,int cartQuantity) {
		orderAdminDAO.updateOrderQuantity(productNo, cartQuantity);
	}
}