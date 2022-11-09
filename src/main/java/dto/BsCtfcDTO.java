package dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BsCtfcDTO {
	private int bsSeq;
	private String bsNumber;
	private String sysName;

	public BsCtfcDTO() {
		super();
	}

	public BsCtfcDTO(int bsSeq, String bsNumber, String sysName) {
		this.bsSeq = bsSeq;
		this.bsNumber = bsNumber;
		this.sysName = sysName;
	}

	public BsCtfcDTO(ResultSet rs) throws SQLException {
		this.bsSeq = rs.getInt("bs_seq");
		this.bsNumber = rs.getString("bs_Number");
		this.sysName = rs.getString("bs_regi_sys");
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

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

}
