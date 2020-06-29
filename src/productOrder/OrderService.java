package productOrder;

import java.util.List;
import java.util.Map;

public class OrderService {
	
	OrderDAO dao =new OrderDAO();
	
	
	/*
	 * public int orderCount(String userId) {
	 * 
	 * return dao.orderCount(userId);
	 * 
	 * }
	 */
   public void addOrder(Map<String, Integer> orderMap,OrderVO vo) {
	   
	   dao.addOrder(orderMap, vo); 
   }
}
