package productCategory;

public class ProductCategoryVO {
	private int productCategoryNo;
	private String productCategoryName;
	
	public ProductCategoryVO() {}

	public ProductCategoryVO(int productCategoryNo, String productCategoryName) {
		this.productCategoryNo = productCategoryNo;
		this.productCategoryName = productCategoryName;
	}

	public int getProductCategoryNo() {
		return productCategoryNo;
	}

	public void setProductCategoryNo(int productCategoryNo) {
		this.productCategoryNo = productCategoryNo;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	
	
}
