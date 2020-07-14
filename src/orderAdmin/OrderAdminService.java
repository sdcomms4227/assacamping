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
		
		Map<String, Object> orderListMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> orderList = orderAdminDAO.getOrderList(searchMap);
		orderListMap.put("orderList", orderList);
		
		int totalCount = orderAdminDAO.getOrderCount(searchMap);
		orderListMap.put("totalCount", totalCount);
		
		return orderListMap;
	}

	public List<OrderVO> readOrder(int productNo) {						
		return orderAdminDAO.getOrder(productNo);
	}

	public int changeOrderState(OrderVO orderVO) {
		return orderAdminDAO.changeOrderState(orderVO);
	}
}