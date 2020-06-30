package productAdmin;

import java.sql.Timestamp;

public class ProductAdminVO {
	
	private int productNo;
	private String productName;
	private String productInformation;
	private int productPrice;
	private String productImageName;
	private int productCategoryNo;
	private Timestamp productDate;
	private int productQuantity;
	
	public ProductAdminVO() {}
	
	public ProductAdminVO(String productName, String productInformation, int productPrice, String productImageName, int productCategoryNo, int productQuantity) {
		this.productName = productName;
		this.productInformation = productInformation;
		this.productPrice = productPrice;
		this.productImageName = productImageName;
		this.productCategoryNo = productCategoryNo;
		this.productQuantity = productQuantity;
	}
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImageName() {
		return productImageName;
	}
	public void setProductImageName(String productImageName) {
		this.productImageName = productImageName;
	}
	public int getProductCategoryNo() {
		return productCategoryNo;
	}
	public void setProductCategoryNo(int productCategoryNo) {
		this.productCategoryNo = productCategoryNo;
	}
	public Timestamp getProductDate() {
		return productDate;
	}
	public void setProductDate(Timestamp productDate) {
		this.productDate = productDate;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}			
}