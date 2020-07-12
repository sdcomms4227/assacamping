package event;

import java.sql.Timestamp;

public class EventVO {
	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventImageFileName;
	private Timestamp eventWriteDate;
	private int eventReadCount;

	public EventVO() {
	}

	public EventVO(String eventTitle, String eventContent, String eventImageFileName) {
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventImageFileName = eventImageFileName;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventImageFileName() {
		return eventImageFileName;
	}

	public void setEventImageFileName(String eventImageFileName) {
		this.eventImageFileName = eventImageFileName;
	}

	public Timestamp getEventWriteDate() {
		return eventWriteDate;
	}

	public void setEventWriteDate(Timestamp eventWriteDate) {
		this.eventWriteDate = eventWriteDate;
	}

	public int getEventReadCount() {
		return eventReadCount;
	}

	public void setEventReadCount(int eventReadCount) {
		this.eventReadCount = eventReadCount;
	}

}
