package productList;

import java.sql.Date;

public class productListVO {
	
	   private int productNO; //상품번호
	   private int productPrice; //상품가격
	   private int cartQuantity; //상품수량
	   private int productRestQuantity; //상품재고수량
	   private int productDelivery; //배송비
	   private String productName; //상품이름
	   private String productInformation; //상품설명
	   private String productImage; //상품이미지
	   private String productCategory; //상품카테고리
	   private Date productDate; //상품등록날짜

	   
	   public productListVO() {
		
	}


	public productListVO(int productNO, int productPrice, int cartQuantity, int productRestQuantity,
			int productDelivery, String productName, String productInformation, String productImage,
			String productCategory) {
	
		this.productNO = productNO;
		this.productPrice = productPrice;
		this.cartQuantity = cartQuantity;
		this.productRestQuantity = productRestQuantity;
		this.productDelivery = productDelivery;
		this.productName = productName;
		this.productInformation = productInformation;
		this.productImage = productImage;
		this.productCategory = productCategory;
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


	public int getProductRestQuantity() {
		return productRestQuantity;
	}


	public void setProductRestQuantity(int productRestQuantity) {
		this.productRestQuantity = productRestQuantity;
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


	public String getProductInformation() {
		return productInformation;
	}


	public void setProductInformation(String productInformation) {
		this.productInformation = productInformation;
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


	public Date getProductDate() {
		return productDate;
	}


	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}
	   
	
	
}
