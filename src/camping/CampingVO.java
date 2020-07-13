package camping;

import java.sql.Timestamp;

public class CampingVO {
	
	private int campingNo;
	private String campingTitle;
	private String campingContent;
	private String campingFileName;
	private String userId;
	private String userName;
	private int campingRe_ref;
	private int campingRe_lev;
	private int campingRe_seq;
	private Timestamp campingDate;
	private int campingCount;
	private int campingCategoryNo;
		
	public CampingVO() {}

	public CampingVO(String campingTitle, String campingContent, String campingFileName, String userId, String userName, int campingCategoryNo) {
		this.campingTitle = campingTitle;
		this.campingContent = campingContent;
		this.campingFileName = campingFileName;
		this.userId = userId;
		this.userName = userName;
		this.campingCategoryNo = campingCategoryNo;
	}

	public int getCampingNo() {
		return campingNo;
	}

	public void setCampingNo(int campingNo) {
		this.campingNo = campingNo;
	}

	public String getCampingTitle() {
		return campingTitle;
	}

	public void setCampingTitle(String campingTitle) {
		this.campingTitle = campingTitle;
	}

	public String getCampingContent() {
		return campingContent;
	}

	public void setCampingContent(String campingContent) {
		this.campingContent = campingContent;
	}

	public String getCampingFileName() {
		return campingFileName;
	}

	public void setCampingFileName(String campingFileName) {
		this.campingFileName = campingFileName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCampingRe_ref() {
		return campingRe_ref;
	}

	public void setCampingRe_ref(int campingRe_ref) {
		this.campingRe_ref = campingRe_ref;
	}

	public int getCampingRe_lev() {
		return campingRe_lev;
	}

	public void setCampingRe_lev(int campingRe_lev) {
		this.campingRe_lev = campingRe_lev;
	}

	public int getCampingRe_seq() {
		return campingRe_seq;
	}

	public void setCampingRe_seq(int campingRe_seq) {
		this.campingRe_seq = campingRe_seq;
	}

	public Timestamp getCampingDate() {
		return campingDate;
	}

	public void setCampingDate(Timestamp campingDate) {
		this.campingDate = campingDate;
	}

	public int getCampingCount() {
		return campingCount;
	}

	public void setCampingCount(int campingCount) {
		this.campingCount = campingCount;
	}

	public int getCampingCategoryNo() {
		return campingCategoryNo;
	}

	public void setCampingCategoryNo(int campingCategoryNo) {
		this.campingCategoryNo = campingCategoryNo;
	}
	
}
