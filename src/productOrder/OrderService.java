package productOrder;

import java.util.List;

public class OrderService {
	
	OrderDAO dao;
	
	
   public int orderCount(String userId) {
	   
	   return dao.orderCount(userId);
	   
   }
}
