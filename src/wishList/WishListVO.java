package wishList;

import java.sql.Timestamp;

public class WishListVO {
	
	private int wishNo;
	private String userId;
	private int productNo;
	private Timestamp wishDate; 
		
	// getter, setter method
	public int getWishNo() {
		return wishNo;
	}
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public Timestamp getWishDate() {
		return wishDate;
	}
	public void setWishDate(Timestamp wishDate) {
		this.wishDate = wishDate;
	}
}
