package productList;

import java.sql.Date;
import java.sql.Timestamp;

public class productListVO {

	private int productNo;
	private String productName;
	private String productInformation;
	private String productImageName1;
	private String productImageName2;
	private String productImageName3;
	private int productPrice;
	private Timestamp productDate;
	private int productQuantity;
	private int productCategoryNo;
	
	
	
	
	
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
	public String getProductImageName1() {
		return productImageName1;
	}
	public void setProductImageName1(String productImageName1) {
		this.productImageName1 = productImageName1;
	}
	public String getProductImageName2() {
		return productImageName2;
	}
	public void setProductImageName2(String productImageName2) {
		this.productImageName2 = productImageName2;
	}
	public String getProductImageName3() {
		return productImageName3;
	}
	public void setProductImageName3(String productImageName3) {
		this.productImageName3 = productImageName3;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
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
	public int getProductCategoryNo() {
		return productCategoryNo;
	}
	public void setProductCategoryNo(int productCategoryNo) {
		this.productCategoryNo = productCategoryNo;
	}

	  
	
}
