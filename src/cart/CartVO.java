package cart;

import java.sql.Timestamp;

public class CartVO {

	private int cartNo; //장바구니 번호
	private int productNo; //상품 번호
	private int productQuantity; //상품 수량
	private int productDelivery; //배송비
	private String userId; //아이디
	private Timestamp cartDate; //장바구니 등록일
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public int getProductDelivery() {
		return productDelivery;
	}
	public void setProductDelivery(int productDelivery) {
		this.productDelivery = productDelivery;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getCartDate() {
		return cartDate;
	}
	public void setCartDate(Timestamp cartDate) {
		this.cartDate = cartDate;
	}
}
