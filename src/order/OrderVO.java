package order;

import java.sql.Timestamp;

public class OrderVO {
	private int productNo;
	private int cartQuantity;
	private int productDelivery;
	private int productPayment; // 총결제금액
	private int productPrice;
	private int orderNo;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;
	private String productName;
	private String userId;
	private String productCategory;
	private String orderState;
	private String userEmail;
	private String userName;
	private String userPhone;
	private String userComment;
	private Timestamp orderDate;

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public int getProductDelivery() {
		return productDelivery;
	}

	public void setProductDelivery(int productDelivery) {
		this.productDelivery = productDelivery;
	}

	public int getProductPayment() {
		return productPayment;
	}

	public void setProductPayment(int productPayment) {
		this.productPayment = productPayment;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public OrderVO(int productNo, int cartQuantity, int productDelivery, int productPayment, String userZipcode, String userAddress1, String userAddress2, String productName, String userId,
			String productCategory, String orderState, String userEmail, String userName, String userPhone, String userComment) {

		this.productNo = productNo;
		this.cartQuantity = cartQuantity;
		this.productDelivery = productDelivery;
		this.productPayment = productPayment;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.productName = productName;
		this.userId = userId;
		this.productCategory = productCategory;
		this.orderState = orderState;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userComment = userComment;
	}

	public OrderVO() {

	}

	public OrderVO(int productNo, int cartQuantity, int productDelivery, int productPayment, int orderNo, String userZipcode, String userAddress1, String userAddress2, String productName,
			String userId, String productCategory, String orderState, String userEmail, String userName, String userPhone, String userComment, Timestamp orderDate) {

		this.productNo = productNo;
		this.cartQuantity = cartQuantity;
		this.productDelivery = productDelivery;
		this.productPayment = productPayment;
		this.orderNo = orderNo;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.productName = productName;
		this.userId = userId;
		this.productCategory = productCategory;
		this.orderState = orderState;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userComment = userComment;
		this.orderDate = orderDate;
	}

}
