package productOrder;

import java.util.List;

public class OrderService {
	
	OrderDAO dao;
	
	public List<OrderVO> orderList(String userId){

		
		return dao.orderList(userId);
		
	}
   public int orderCount(String userId) {
	   
	   return dao.orderCount(userId);
	   
   }
}
