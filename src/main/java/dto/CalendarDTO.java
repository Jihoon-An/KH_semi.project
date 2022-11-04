package dto;

public class CalendarDTO{
	
	private String subject;
	private String startDate;
	private String endDate;
	private String memo;
	
	
	public CalendarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalendarDTO(String subject, String startDate, String endDate, String memo) {
		super();
		this.subject = subject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memo = memo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	
}

