package cart;

import java.sql.Date;

public class CartVO {

	private int productNo; // 상품번호
	private int productPrice; // 상품단가
	private int cartQuantity; // 상품수량
	private int productDelivery; // 배송비
	private int productTotalPrice; // 상품가격(단가*수량)
	private String productName; // 상품이름
	private String productImage; // 상품이미지
	private String productCategory; // 상품카테고리
	private String userId;// 사용자아이디
	private Date productCartDate; // 장바구니등록날짜

	public CartVO() {

	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public int getProductTotalPrice() {
		return productTotalPrice;
	}

	public void setProductTotalPrice(int productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
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

	public CartVO(int productNo, int productPrice, int cartQuantity, int productDelivery, int productTotalPrice, String productName, String productImage, String productCategory, String userId) {

		this.productNo = productNo;
		this.productPrice = productPrice;
		this.cartQuantity = cartQuantity;
		this.productDelivery = productDelivery;
		this.productTotalPrice = productTotalPrice;
		this.productName = productName;
		this.productImage = productImage;
		this.productCategory = productCategory;
		this.userId = userId;
	}

	public CartVO(int productNo, int productPrice, int cartQuantity, int productDelivery, int productTotalPrice, String productName, String productImage, String productCategory) {

		this.productNo = productNo;
		this.productPrice = productPrice;
		this.cartQuantity = cartQuantity;
		this.productDelivery = productDelivery;
		this.productTotalPrice = productTotalPrice;
		this.productName = productName;
		this.productImage = productImage;
		this.productCategory = productCategory;

	}
}