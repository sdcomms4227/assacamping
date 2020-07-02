package campingAdmin;

import java.sql.Timestamp;

public class CampingAdminVO {
	
	private int campingNo;
	private String campingTitle;
	private String campingContent;
	private String campingFileName;
	private String userId;
	private int campingRe_ref;
	private int campingRe_lev;
	private int campingRe_seq;
	private Timestamp campingWriteDate;
	private int campingReadCount;
	private int campingCategoryNo;
		
	public CampingAdminVO() {}

	public CampingAdminVO(int campingNo, String campingTitle, String campingContent, String campingFileName, String userId, int campingRe_ref, int campingRe_lev, int campingRe_seq, Timestamp campingWriteDate,
			int campingReadCount, int campingCategoryNo) {
		this.campingNo = campingNo;
		this.campingTitle = campingTitle;
		this.campingContent = campingContent;
		this.campingFileName = campingFileName;
		this.userId = userId;
		this.campingRe_ref = campingRe_ref;
		this.campingRe_lev = campingRe_lev;
		this.campingRe_seq = campingRe_seq;
		this.campingWriteDate = campingWriteDate;
		this.campingReadCount = campingReadCount;
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

	public Timestamp getCampingWriteDate() {
		return campingWriteDate;
	}

	public void setCampingWriteDate(Timestamp campingWriteDate) {
		this.campingWriteDate = campingWriteDate;
	}

	public int getCampingReadCount() {
		return campingReadCount;
	}

	public void setCampingReadCount(int campingReadCount) {
		this.campingReadCount = campingReadCount;
	}

	public int getCampingCategoryNo() {
		return campingCategoryNo;
	}

	public void setCampingCategoryNo(int campingCategoryNo) {
		this.campingCategoryNo = campingCategoryNo;
	}
	
}
