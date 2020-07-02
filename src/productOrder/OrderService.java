package productOrder;

import java.util.List;
import java.util.Map;

import productCart.productCartVO;

public class OrderService {
	
	OrderDAO dao =new OrderDAO();
	
	

public int orderCount(String userId) {
	  
	  return dao.orderCount(userId);
	  
	 }
	
   public void addOrder(List<productCartVO> orderList,OrderVO vo) {
	   
	   dao.addOrder(orderList, vo); 
   }
   
   public List<OrderVO> orderList(String userId){
	   
	   return dao.orderList(userId);
   }
}
