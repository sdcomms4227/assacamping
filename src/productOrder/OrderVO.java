package productOrder;

public class OrderVO {
	private int productNO; 
	private int cartQuantity;  
	private int productDelivery;   
	private int productPrice; 
	private int orderNo;
	private int userZipcode;   
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
	
	public OrderVO() {
		
	}
	
	


	public OrderVO(int productNO, int cartQuantity, int productDelivery, int productPrice, int userZipcode,
			String userAddress1, String userAddress2, String productName, String userEmail, String userName,
			String userPhone, String userComment) {
	
		this.productNO = productNO;
		this.cartQuantity = cartQuantity;
		this.productDelivery = productDelivery;
		this.productPrice = productPrice;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.productName = productName;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userComment = userComment;
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




	public int getProductNO() {
		return productNO;
	}


	public void setProductNO(int productNO) {
		this.productNO = productNO;
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


	public int getUserZipcode() {
		return userZipcode;
	}


	public void setUserZipcode(int userZipcode) {
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
	
	
	
	
     
	
}
