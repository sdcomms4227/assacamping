package order;

import java.util.List;

import cart.CartVO;

public class OrderService {

	OrderDAO dao = new OrderDAO();

	public int orderCount(String userId) {
		return dao.orderCount(userId);
	}

	public void addOrder(List<CartVO> orderList, OrderVO vo) {
		dao.addOrder(orderList, vo);
	}

	public List<OrderVO> orderList(String userId, int orderNo) {
		return dao.orderList(userId, orderNo);
	}

	public int orderNoCount() {
		return dao.orderNoCount();
	}

	public List<OrderVO> payList(String userId) {
		return dao.payList(userId);
	}

	public List<OrderVO> orderNo(String userId) {
		return dao.orderNo(userId);
	}

	public List<OrderVO> orderInfo(String userId, int orderNo) {
		return dao.oderInfo(userId, orderNo);
	}

	public void orderDelete(String userId, int orderNo) {
		dao.orderDelete(userId, orderNo);

	}

	public List<OrderVO> selectAllOrderList() {
		return dao.selectAllOrderList();
	}

}
