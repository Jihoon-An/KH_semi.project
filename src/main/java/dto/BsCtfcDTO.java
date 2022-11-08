package dto;

public class BsCtfcDTO {
	private int bsSeq;
	private String bsNumber;
	private String oriName;
	private String sysName;

	public BsCtfcDTO() {
		super();
	}

	public BsCtfcDTO(int bsSeq, String bsNumber, String oriName, String sysName) {
		super();
		this.bsSeq = bsSeq;
		this.bsNumber = bsNumber;
		this.oriName = oriName;
		this.sysName = sysName;
	}

	public int getBsSeq() {
		return bsSeq;
	}

	public void setBsSeq(int bsSeq) {
		this.bsSeq = bsSeq;
	}

	public String getBsNumber() {
		return bsNumber;
	}

	public void setBsNumber(String bsNumber) {
		this.bsNumber = bsNumber;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

}
