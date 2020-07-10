package user;

import java.sql.Timestamp;

public class UserVO {
	
	private String userId;
	private String userPw; 
	private String userName; 
	private String userPhone; 
	private String userEmail; 
	private String userZipcode; 
	private String userAddress1; 
	private String userAddress2; 
	private Timestamp userDate;
	private int userUse;
	
	public UserVO() {}
	
	public UserVO(String userId, String userPw, String userName, String userPhone, String userEmail, String userZipcode,
			String userAddress1, String userAddress2, int userUse) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userUse = userUse;
	}



	public UserVO(String userId, String userPw, String userName, String userPhone, String userEmail, String userZipcode,
			String userAddress1, String userAddress2, Timestamp userDate, int userUse) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userDate = userDate;
		this.userUse = userUse;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
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

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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

	public Timestamp getUserDate() {
		return userDate;
	}

	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}

	public int getUserUse() {
		return userUse;
	}

	public void setUserUse(int userUse) {
		this.userUse = userUse;
	}

	
	
	
}
