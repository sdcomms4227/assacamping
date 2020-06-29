package productOrder;

import java.util.List;

public class OrderService {
	
	OrderDAO dao =new OrderDAO();
	
	
   public int orderCount(String userId) {
	   
	   return dao.orderCount(userId);
	   
   }
}
