package campingCategory;

public class CampingCategoryVO {

	private int campingCategoryNo;
	private String campingCategoryName;
	
	public CampingCategoryVO() {}
	
	public CampingCategoryVO(int campingCategoryNo, String campingCategoryName) {
		this.campingCategoryNo = campingCategoryNo;
		this.campingCategoryName = campingCategoryName;
	}

	public int getCampingCategoryNo() {
		return campingCategoryNo;
	}

	public void setCampingCategoryNo(int campingCategoryNo) {
		this.campingCategoryNo = campingCategoryNo;
	}

	public String getCampingCategoryName() {
		return campingCategoryName;
	}

	public void setCampingCategoryName(String campingCategoryName) {
		this.campingCategoryName = campingCategoryName;
	}

}
