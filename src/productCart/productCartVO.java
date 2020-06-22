package productCart;

import java.sql.Date;

public class productCartVO {
	
	   private int productNO; //상품번호
	   private int productPrice; //상품가격
	   private int cartQuantity; //상품수량
	   private int productDelivery; //배송비
	   private String productName; //상품이름
	   private String productImage; //상품이미지
	   private String productCategory; //상품카테고리
	   private String userId;//사용자아이디
	   private Date productCartDate; //장바구니등록날짜
	   
	   public productCartVO() {
		
	}
	   
	   
	public productCartVO(int productNO, int productPrice, int cartQuantity, int productDelivery, String productName,
			String productImage, String productCategory, String userId) {
		
		this.productNO = productNO;
		this.productPrice = productPrice;
		this.cartQuantity = cartQuantity;
		this.productDelivery = productDelivery;
		this.productName = productName;
		this.productImage = productImage;
		this.productCategory = productCategory;
		this.userId = userId;
		
	}


	public int getProductNO() {
		return productNO;
	}
	public void setProductNO(int productNO) {
		this.productNO = productNO;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getProductCartDate() {
		return productCartDate;
	}
	public void setProductCartDate(Date productCartDate) {
		this.productCartDate = productCartDate;
	}
	   
	   
	   

}
