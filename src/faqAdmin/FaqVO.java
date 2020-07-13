package faqAdmin;

import java.sql.Timestamp;

public class FaqVO {

	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private Timestamp faqWriteDate;

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Timestamp getFaqWriteDate() {
		return faqWriteDate;
	}

	public void setFaqWriteDate(Timestamp faqWriteDate) {
		this.faqWriteDate = faqWriteDate;
	}

}
